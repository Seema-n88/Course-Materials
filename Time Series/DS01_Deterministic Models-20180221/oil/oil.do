*************************************************************************************
*                                                                                   *
*                      Exponential Smoothing (using oil.dta)                        *
*                                                                                   *
*************************************************************************************

version 11.2
capture log close
set more off

* use "C:\...\oil.dta", clear 
* log using "C:\...\oil.log", replace

di 12*40-1
generate time = 479+_n
format time %tmm_Y
tsset time 
tsline oil, lwidth(thick)

generate time2=tm(2000m1)+_n-1
format time2 %tmm_Y
tsset time2
list oil time time2 in 1/1

gen oil_exp3 = oil
local alpha = 0.3
forvalues num = 2/105 {
  replace  oil_exp3 = `alpha'*oil + (1-`alpha')*oil_exp3[`num'-1] in `num'
}
list time oil oil_exp3 in 1/4
tsline oil oil_exp3, clwidth(thick thick)

tssmooth exponential oil_exp3_stata = oil, parms(.3) s0(82.6) replace
list time oil oil_exp3 oil_exp3_stata in 1/12
tsline oil F.oil_exp3_stata, clwidth(thick thick) legend(rows(2))

* log close
exit
