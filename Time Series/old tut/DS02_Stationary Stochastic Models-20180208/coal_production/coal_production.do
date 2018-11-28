****************************************************************************
*                                                                          *
*   Univariate Box-Jenkins model (using coal_production.dta)               *
*                                                                          *
****************************************************************************

version 11.2
set more off
capture log close

* use "C:\...\coal_production.dta", clear
* log using "C:\...\coal_production.log", replace   

generate time = -97 + _n
format time %tm
tsset time

generate time2=tm(1952m1)+_n-1
format time2 %tm

list time time2 in 1/5

tsline coal_production, lwidth(thick)

ac coal_production, lags(24)
pac coal_production, lags(24)

corrgram coal_production, lags(24)
sum coal_production
regress coal_production L1.coal_production L2.coal_production
arima coal_production, ar(1/2)
arima coal_production, ar(1) ma(1)

arima coal_production, ar(1/2)
predict res_AR2, residuals
ac res_AR2, lags(24) 
pac res_AR2, lags(24)
corrgram res_AR2, lags(24)
di 1-chi2(24, 14.337)
di 1-chi2(22, 14.337)

arima coal_production, ar(1) ma(1)
predict res_ARMA11, residuals
ac res_ARMA11, lags(24)
pac res_ARMA11, lags(24)
corrgram res_ARMA11, lags(24)
di 1-chi2(22, 14.387)

arima coal_production, ar(1/2)
di log(3066.34^2)+2*(2+0)/96
di log(3066.34^2)+((2+0)/96)*log(96)

arima coal_production, ar(1) ma(1)
di log(3084.761^2)+2*(1+1)/96
di log(3084.761^2)+((1+1)/96)*log(96)

arima coal_production if time < -12, ar(1/2)

list time coal_production in 1/84


set obs 120
replace time = -97 + _n
format time %tm
tsset time
    
arima coal_production if time < -12, ar(1/2)

predict forecast_AR2, xb dynamic(-12)

twoway line coal_production forecast_AR2 time,  msize(medlarge medlarge) ///
                                                xline(564, lcolor(black) lpattern(dash)) ///
                                                yline(38395.6) legend(label(1 "coal_production"))

generate forecast_error_AR2=(coal_production-forecast_AR2)/coal_production in 85/96
list time coal_production forecast_AR2 forecast_error_AR2 in 85/96

* log close
exit










