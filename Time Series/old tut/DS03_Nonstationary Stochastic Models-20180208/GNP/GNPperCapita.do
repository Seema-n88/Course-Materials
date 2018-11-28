****************************************************************************
*                                                                          *
*           TS versus DS models (using GNPperCapita.dta)                   *
*                                                                          *
****************************************************************************

version 11.2
set more off
capture log close

* use "C:\...\GNPperCapita.dta", clear
* log using "C:\...\GNPperCapita.log", replace   

tsset time
tsline GNP, lwidth(thick) xtitle(, margin(t+2)) ytitle(, margin(r+2))
tsline GNP, lwidth(thick) xtitle(, margin(t+2)) ytitle(, margin(r+2)) || lfit GNP time, lwidth(thick) legend(rows(2))

tsline lnGNP, lwidth(thick) xtitle(, margin(t+2)) ytitle(, margin(r+2))
ac lnGNP, xtitle(, margin(t+2)) ytitle(, margin(r+2)) ciopts(color(gs10))

tsline lnGNP, lwidth(thick) xtitle(, margin(t+2)) ytitle(, margin(r+2)) || lfit lnGNP time,  lwidth(thick)
regress lnGNP time
predict res_OLS, res
tsline res_OLS, lwidth(thick) xtitle(, margin(t+2)) ytitle(, margin(r+2))
ac  res_OLS, xtitle(, margin(t+2)) ytitle(, margin(r+2)) ciopts(color(gs10))
pac  res_OLS, xtitle(, margin(t+2)) ytitle(, margin(r+2)) ciopts(color(gs10))

arima res_OLS, ar(1/3) noconst
predict res_AR3, res
ac res_AR3, xtitle(, margin(t+2)) ytitle(, margin(r+2)) ciopts(color(gs10))
pac res_AR3, xtitle(, margin(t+2)) ytitle(, margin(r+2)) ciopts(color(gs10))
corrgram res_AR3

regress lnGNP time L.lnGNP L2.lnGNP L3.lnGNP

tsline D.lnGNP, lwidth(thick) xtitle(, margin(t+2)) ytitle(, margin(r+2))
ac D.lnGNP, xtitle(, margin(t+2)) ytitle(, margin(r+2)) ciopts(color(gs10))
pac D.lnGNP, xtitle(, margin(t+2)) ytitle(, margin(r+2)) ciopts(color(gs10))
arima D.lnGNP, ar(1/3)
arima lnGNP, arima(3,1,0)
predict res_ARIMA310, res
ac res_ARIMA310, xtitle(, margin(t+2)) ytitle(, margin(r+2)) ciopts(color(gs10))
pac res_ARIMA310, xtitle(, margin(t+2)) ytitle(, margin(r+2)) ciopts(color(gs10))
corrgram res_ARIMA310

* log close
exit
