****************************************************************************
*                                                                          *
*   Univariate Box-Jenkins model (using inventories.dta)                   *
*                                                                          *
****************************************************************************

version 11.2
set more off
capture log close

* use "C:\...\inventories.dta", clear
* log using "C:\...\inventories.log", replace   

describe

generate time = _n-21
format time %tq
tsset time

*generate time2 = tq(1955q1)+_n-1
*format time2 %tq

*list time time2 in 1/5

tsline inventories, lwidth(thick)

ac inventories, lags(15)
pac inventories, lags(15)

corrgram inventories
sum inventories
di 6.095*(1-0.6897)

regress inventories L1.inventories
di 1.9209/(1-0.6898)
predict res_AR1_OLS, res
predict inventories_hat_OLS, xb
format inventories_hat_OLS %9.2f
list time inventories inventories_hat_OLS in 1/8, abbreviate(4) noo
tsline inventories inventories_hat_OLS, lwidth(thick thick) legend(label(1 "inventories") label(2 "inventories_hat_OLS") rows(2))

twoway scatter inventories L.inventories || line inventories_hat_OLS L.inventories, legend(off) name(regression, replace) ///
xtitle("L.inventories") ytitle("inventories") lwidth(thick)
twoway scatter res_AR1_OLS L.inventories, name(residuals, replace) ytitle("res_AR1_OLS") xtitle("L.inventories")
graph combine regression residuals, rows(2) 

gen res_AR1_OLS_squared = res_AR1_OLS^2
sum res_AR1_OLS_squared
di r(sum)/57

arima inventories, ar(1)
di 6.0407 *(1-.6803)
predict inventories_hat_ML, xb
format inventories_hat_ML %9.2f
list time inventories inventories_hat_ML in 1/8, abbreviate(4) noo
tsline inventories inventories_hat_ML, lwidth(thick thick) legend(label(1 "inventories") label(2 "inventories_hat_ML") rows(2))

predict res_AR1_ML, res
tsline res_AR1_ML, lwidth(thick) ytitle("res_AR1_ML")

arima inventories, ar(1/2)

ac res_AR1_ML, lags(15)
pac res_AR1_ML, lags(15)
corrgram res_AR1_ML

di 60*62*((1/59)*(-0.0580)^2+(1/58)*(-0.0031)^2)
di 1-chi2(2,.21288)
di 1-chi2(1,.21288)

wntestq  res_AR1_ML, lags(15)
di 1-chi2(15,9.4865)
di 1-chi2(14,9.4865)

di invchi2(15, 0.95)
di invchi2(14, 0.95)

regress inventories L1.inventories if time <= 35
local phi1 = .6977864
local delta = 1.810721
local mu = `delta'/(1-`phi1')
generate forecast_OLS = .
replace forecast_OLS = `phi1'*L.inventories + `delta' in 57
forvalues num = 58/60 {
  replace forecast_OLS = `phi1'*L.forecast_OLS + `delta' in `num'
}
twoway scatter inventories forecast_OLS time, c(l l) lwidth(medthick medthick) xline(35, lcolor(black) lpattern(dash)) yline(`mu')

list time inventories forecast_OLS in 57/60
di (8.3-6.7650)/8.3

* log close
exit
