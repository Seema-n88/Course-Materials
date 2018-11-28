*************************************************************************************
*                                                                                   *
*                   Exponential Smoothing (using Siemens.dta)                       *
*                                                                                   *
*************************************************************************************

version 11.2
capture log close 
set more off

* use "C:\...\Siemens.dta", replace 
*log using "C:\...\Siemens.log", replace

describe
tsset time
tsline SIE, clwidth(thick)

gen SIE_exp3 = SIE in 1
local alpha = 0.3
forvalues num = 2/20 {
replace SIE_exp3 = `alpha'*SIE + (1-`alpha')*SIE_exp3[`num'-1] in `num'
}
tsline SIE SIE_exp3, clwidth(thick thick)

regress SIE time
predict res, residuals
tsline res, clwidth(thick)
gen res_exp3 = res 
local alpha = 0.3
forvalues num = 2/20 {
replace res_exp3 = `alpha'*res + (1-`alpha')*res_exp3[`num'-1] in `num'
}
tsline res res_exp3, clwidth(thick thick)
gen SIE_exp3_trend = res_exp3+_b[time]* time+_b[_cons]
tsline SIE SIE_exp3 SIE_exp3_trend, clwidth(thick thick thick)

local alpha = 0.3
local gamma = 0.6
gen r = 0
gen y = 32.05
forvalues num = 2/20 {
replace y = `alpha'*SIE + (1-`alpha')*(y[`num'-1]+r[`num'-1]) in `num'
replace r = `gamma'*(y-y[`num'-1]) + ((1-`gamma')*r[`num'-1]) in `num'
}
tsline SIE SIE_exp3 SIE_exp3_trend y, clwidth(thick thick thick thick)



list time SIE SIE_exp3 in 1/10
tssmooth exponential SIE_exp3_stata=SIE, parms(.3) s0(32.05) replace
list time SIE SIE_exp3 SIE_exp3_stata in 1/10


* log close
exit
