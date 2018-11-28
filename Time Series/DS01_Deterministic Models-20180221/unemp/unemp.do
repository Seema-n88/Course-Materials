*************************************************************************************
*                                                                                   *
*                     Seasonal Adjustment (using unemp.dta)                         *
*                                                                                   *
*********************************************************************************** *

version 11.2
capture log close
set more off

* use "C:\...\unemp.dta", replace
* log using "C:\...\unemp.log", replace

describe

tsset time
twoway connect unemp time, xline(552(6)588, lpattern(dash) lcolor(black)) xlabel(552(6)588) lwidth(medthick)

regress unemp time
predict res, res
twoway connect res time, xline(552(6)588, lpattern(dash) lcolor(black)) xlabel(552(6)588) lwidth(medthick)

tssmooth ma unemp_ma12 = unemp, weights(1 2 2 2 2 2 <2> 2 2 2 2 2 1)
twoway connect unemp time, xline(552(6)588, lpattern(dash) lcolor(black)) xlabel(552(6)588) lwidth(medthick) || ///
       tsline unemp_ma12, lwidth(thick) legend(rows(2))

generate SI = unemp / unemp_ma12
twoway connect SI time, lwidth(medthick) xline(552(6)588, lpattern(dash) lcolor(black)) xlabel(552(6)588)

generate month = month(dofm(time))
label var month "Month"
twoway scatter SI month, xlabel(1(1)12) xtitle(, margin(t+2)) ylabel(0.96(0.02)1.12) ytick(0.96(0.01)1.12)

egen Q = mean(SI), by(month)
twoway scatter SI month || scatter Q month, xlabel(1(1)12) xtitle(, margin(t+2)) ylabel(0.96(0.02)1.12) ytick(0.96(0.01)1.12)

list month Q in 1/12
sum Q in 1/12
di r(sum)

gen S=Q

generate unemp_sa = unemp/S
twoway connect unemp time, xline(552(6)588, lpattern(dash) lcolor(black)) xlabel(552(6)588) lwidth(medthick) || ///
       tsline unemp_sa, clwidth(thick)

* log close
exit

