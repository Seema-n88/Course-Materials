*************************************************************************
*                                                                       *
*   Univariate ARIMA Time Series Analysis (using ahp.dta)               *
*                                                                       *
*************************************************************************

version 11.2
set more off
capture log close

* use "C:\...\ahp.dta", clear
* log using "C:\...\ahp.log", replace   

generate time = _n + 371
label var time "Time"
format time %tmm_Y
list time ahp in 1/10

tsset time

tsline ahp, lwidth(thick)
ac ahp

gen dhp= 100*(ahp-L.ahp)/L.ahp
label var dhp "Monthly Percentage Change"

tsline dhp, lwidth(thick)

ac  dhp
pac dhp

arima dhp, ar(1/2)
predict res_AR2, residuals
tsline res_AR2, lwidth(thick) xtitle(,margin(t+2)) ylabel(-4(1)4)
ac res_AR2
pac res_AR2
corrgram res_AR2
wntestq res_AR2, lags(12)
di 1-chi2(12, 21.2675)
di 1-chi2(10, 21.2675)

arima dhp, ar(1) ma(1)
predict res_ARMA11, residuals
tsline res_ARMA11, lwidth(thick) xtitle(,margin(t+2)) ylabel(-4(1)4)
ac res_ARMA11
pac res_ARMA11
corrgram res_ARMA11

arima dhp, ar(1/2) ma(1)
predict res_ARMA21, residuals
ac res_ARMA21
pac res_ARMA21
corrgram res_ARMA21

arima dhp, ar(2) ma(1)
predict res_ARMA21_r, residuals
ac res_ARMA21_r
pac res_ARMA21_r
corrgram res_ARMA21_r

arima dhp, ar(1) ma(1/2)
predict res_ARMA12, residuals
ac res_ARMA12
pac res_ARMA12

arima dhp, ar(1) ma(2)
predict res_ARMA12_r, residuals
ac res_ARMA12_r
pac res_ARMA12_r

arima dhp, ar(1/2)
ereturn list
di e(sigma)
di e(ar_max)
di e(ma_max)

arima dhp, ar(1/2)
local AIC_AR2 = log((e(sigma))^2)+(2*((e(ar_max)+e(ma_max))/e(N)))
local BIC_AR2 = log((e(sigma))^2)+((e(ar_max)+e(ma_max))/e(N))*log(e(N))

arima dhp, ar(1) ma(1)
local AIC_ARMA11 = log((e(sigma))^2)+(2*((e(ar_max)+e(ma_max))/e(N)))
local BIC_ARMA11 = log((e(sigma))^2)+((e(ar_max)+e(ma_max))/e(N))*log(e(N))

arima dhp, ar(1/2) ma(1)
local AIC_ARMA21 = log((e(sigma))^2)+(2*((e(ar_max)+e(ma_max))/e(N)))
local BIC_ARMA21 = log((e(sigma))^2)+((e(ar_max)+e(ma_max))/e(N))*log(e(N))

arima dhp, ar(2) ma(1)
local AIC_ARMA21_r = log((e(sigma))^2)+(2*(((e(ar_max)-1)+e(ma_max))/e(N)))
local BIC_ARMA21_r = log((e(sigma))^2)+(((e(ar_max)-1)+e(ma_max))/e(N))*log(e(N))

arima dhp, ar(1) ma(1/2)
local AIC_ARMA12 = log((e(sigma))^2)+(2*((e(ar_max)+e(ma_max))/e(N)))
local BIC_ARMA12 = log((e(sigma))^2)+((e(ar_max)+e(ma_max))/e(N))*log(e(N))

arima dhp, ar(1) ma(2)
local AIC_ARMA12_r = log((e(sigma))^2)+(2*((e(ar_max)+(e(ma_max)-1))/e(N)))
local BIC_ARMA12_r = log((e(sigma))^2)+((e(ar_max)+(e(ma_max)-1))/e(N))*log(e(N))


di "AIC_AR2:      " `AIC_AR2'
di "AIC_ARMA11:   " `AIC_ARMA11'
di "AIC_ARMA21:   " `AIC_ARMA21'
di "AIC_ARMA21_r: " `AIC_ARMA21_r'
di "AIC_ARMA12:   " `AIC_ARMA12'
di "AIC_ARMA12_r: " `AIC_ARMA12_r'

di "BIC_AR2:      " `BIC_AR2'
di "BIC_ARMA11:   " `BIC_ARMA11'
di "BIC_ARMA21:   " `BIC_ARMA21'
di "BIC_ARMA21_r: " `BIC_ARMA21_r'
di "BIC_ARMA12:   " `BIC_ARMA12'
di "BIC_ARMA12_r: " `BIC_ARMA12_r'

arima dhp, ar(1/2)
arima dhp if time < 564, ar(1/2)
predict forecast_AR2, xb 
predict forecast_AR2_dyn, xb dynamic(564)
list time dhp forecast_AR2 forecast_AR2_dyn in 193/197

twoway scatter dhp forecast_AR2_dyn time if time >=552, c(l l) lwidth(thick thick) msize(medlarge medlarge) ///
                                                        xline(564, lcolor(black) lpattern(dash)) ///
                                                        yline(.6291755)

gen forecast_error_AR2 = (dhp-forecast_AR2_dyn) / dhp in 193/197
list time dhp forecast_AR2_dyn forecast_error_AR2 in 193/197

set obs 233
replace time = _n + 371
label var time "Time"
format time %tmm_Y
tsset time

arima dhp if time < 564, ar(1/2)
predict forecast_AR2_dyn_long, xb dynamic(564)
list time forecast_AR2_dyn_long in 193/233

* log close
exit
