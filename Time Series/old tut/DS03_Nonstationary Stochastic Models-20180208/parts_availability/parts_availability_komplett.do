****************************************************************************************
*                                                                                      *
*                           Parts Availability                                         *
*                                                                                      *
****************************************************************************************

version 11.2
capture log close

*use "C:\...\parts_availability.dta", clear
*log using "C:\...\parts_availability.log", replace

set more off

tsset time
sum parts_availability
di r(mean)
tsline parts_availability, yline(`r(mean)', lwidth(thick)) lwidth(thick) xtitle(, margin(t+2)) ytitle(, margin(r+2))
di 90/4
ac parts_availability, lags(23) xtitle(, margin(t+2)) ytitle(, margin(r+2)) ciopts(color(gs10))

twoway tsline parts_availability, lwidth(thick) xtitle(, margin(t+2)) ytitle(, margin(r+2)) || ///
       lfit parts_availability time, legend(off) lwidth(thick)
regress parts_availability time
predict res_OLS, res
tsline res_OLS, lwidth(thick) xtitle(, margin(t+2)) ytitle(, margin(r+2))
ac res_OLS, lags(23) xtitle(, margin(t+2)) ytitle(, margin(r+2)) ciopts(color(gs10))

sum D.parts_availability
tsline D.parts_availability, yline(`r(mean)', lwidth(thick)) lwidth(thick) xtitle(, margin(t+2)) ytitle(, margin(r+2))
ac  D.parts_availability, lags(23) xtitle(, margin(t+2)) ytitle(, margin(r+2)) ciopts(color(gs10))
pac D.parts_availability, lags(23) xtitle(, margin(t+2)) ytitle(, margin(r+2)) ciopts(color(gs10)) 

arima D.parts_availability, ma(1)
arima parts_availability, arima(0 1 1)
arima parts_availability, arima(0 1 1) noconstant
predict res_ARIMA011, residuals
predict x_tilde, xb

ac res_ARIMA011, lags(23) xtitle(, margin(t+2)) ytitle(, margin(r+2)) ciopts(color(gs10))
pac res_ARIMA011, lags(23) xtitle(, margin(t+2)) ytitle(, margin(r+2)) ciopts(color(gs10))
corrgram res_ARIMA011, lags(22)
wntestq res_ARIMA011, lags(22)
twoway function y = ((x^(22/2-1))*(exp(-x/2)))/((2^(22/2)*(exp(lngamma((22/2)))))), range(0 40) lwidth(thick) || ///
       function y = ((x^(21/2-1))*(exp(-x/2)))/((2^(21/2)*(exp(lngamma((21/2)))))), range(0 40) lwidth(thick) ||,   ///
       legend(label(1 "chi2den(22)")label(2 "chi2den(21)")) xline(12.933, lwidth(medthick) lcolor(black) lpattern(dash)) xtitle("") ytitle("")
twoway function y = ((x^(22/2-1))*(exp(-x/2)))/((2^(22/2)*(exp(lngamma((22/2)))))), range(0 40) lwidth(thick) || ///
       function y = ((x^(21/2-1))*(exp(-x/2)))/((2^(21/2)*(exp(lngamma((21/2)))))), range(0 12.933) lwidth(thick) ||  ///
       function y = ((x^(21/2-1))*(exp(-x/2)))/((2^(21/2)*(exp(lngamma((21/2)))))), range(12.933 40) lwidth(thick) color(gs12) recast(area) ||,   ///
       legend(label(1 "chi2den(22)")label(2 "chi2den(21)") order(1 2)) xline(12.933, lwidth(medthick) lcolor(black) lpattern(dash)) xtitle("") ytitle("")
di 1-chi2(22, 12.933)
di 1-chi2(21, 12.933)

list time parts_availability x_tilde in 88/90

drop x_tilde
set obs 110
replace time = _n
replace parts_availability = 87   in 91
replace parts_availability = 86.5 in 92
tsset time

arima parts_availability in 1/90, arima(0,1,1) noconstant
predict x_tilde_dyn, xb dynamic(91)
predict y_tilde_dyn, y dynamic(91)
predict x_tilde, xb
predict y_tilde, y
list time parts_availability x_tilde_dyn y_tilde_dyn x_tilde y_tilde in 91/94

tsline  parts_availability if time <=90 || tsline y_tilde_dyn  if time>90, xline(90.5)

gen upper_CI= y_tilde_dyn+invnormal(0.975)*2.01387*sqrt(1) in 91
replace upper_CI= y_tilde_dyn+invnormal(0.975)*2.01387*sqrt(1+(1-.7175448)^2) in 92
replace upper_CI= y_tilde_dyn+invnormal(0.975)*2.01387*sqrt(1+(1-.7175448)^2+(1-.7175448)^2) in 93
replace upper_CI= y_tilde_dyn+invnormal(0.975)*2.01387*sqrt(1+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2) in 94
replace upper_CI= y_tilde_dyn+invnormal(0.975)*2.01387*sqrt(1+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2) in 95
replace upper_CI= y_tilde_dyn+invnormal(0.975)*2.01387*sqrt(1+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2) in 96
replace upper_CI= y_tilde_dyn+invnormal(0.975)*2.01387*sqrt(1+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2) in 97
replace upper_CI= y_tilde_dyn+invnormal(0.975)*2.01387*sqrt(1+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2) in 98
replace upper_CI= y_tilde_dyn+invnormal(0.975)*2.01387*sqrt(1+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2) in 99
replace upper_CI= y_tilde_dyn+invnormal(0.975)*2.01387*sqrt(1+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2) in 100
replace upper_CI= y_tilde_dyn+invnormal(0.975)*2.01387*sqrt(1+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2) in 101
replace upper_CI= y_tilde_dyn+invnormal(0.975)*2.01387*sqrt(1+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2) in 102
replace upper_CI= y_tilde_dyn+invnormal(0.975)*2.01387*sqrt(1+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2) in 103
replace upper_CI= y_tilde_dyn+invnormal(0.975)*2.01387*sqrt(1+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2) in 104
replace upper_CI= y_tilde_dyn+invnormal(0.975)*2.01387*sqrt(1+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2) in 105
replace upper_CI= y_tilde_dyn+invnormal(0.975)*2.01387*sqrt(1+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2) in 106
replace upper_CI= y_tilde_dyn+invnormal(0.975)*2.01387*sqrt(1+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2) in 107
replace upper_CI= y_tilde_dyn+invnormal(0.975)*2.01387*sqrt(1+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2) in 108
replace upper_CI= y_tilde_dyn+invnormal(0.975)*2.01387*sqrt(1+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2) in 109
replace upper_CI= y_tilde_dyn+invnormal(0.975)*2.01387*sqrt(1+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2) in 110

gen lower_CI= y_tilde_dyn-invnormal(0.975)*2.01387*sqrt(1) in 91
replace lower_CI= y_tilde_dyn-invnormal(0.975)*2.01387*sqrt(1+(1-.7175448)^2) in 92
replace lower_CI= y_tilde_dyn-invnormal(0.975)*2.01387*sqrt(1+(1-.7175448)^2+(1-.7175448)^2) in 93
replace lower_CI= y_tilde_dyn-invnormal(0.975)*2.01387*sqrt(1+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2) in 94
replace lower_CI= y_tilde_dyn-invnormal(0.975)*2.01387*sqrt(1+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2) in 95
replace lower_CI= y_tilde_dyn-invnormal(0.975)*2.01387*sqrt(1+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2) in 96
replace lower_CI= y_tilde_dyn-invnormal(0.975)*2.01387*sqrt(1+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2) in 97
replace lower_CI= y_tilde_dyn-invnormal(0.975)*2.01387*sqrt(1+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2) in 98
replace lower_CI= y_tilde_dyn-invnormal(0.975)*2.01387*sqrt(1+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2) in 99
replace lower_CI= y_tilde_dyn-invnormal(0.975)*2.01387*sqrt(1+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2) in 100
replace lower_CI= y_tilde_dyn-invnormal(0.975)*2.01387*sqrt(1+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2) in 101
replace lower_CI= y_tilde_dyn-invnormal(0.975)*2.01387*sqrt(1+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2) in 102
replace lower_CI= y_tilde_dyn-invnormal(0.975)*2.01387*sqrt(1+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2) in 103
replace lower_CI= y_tilde_dyn-invnormal(0.975)*2.01387*sqrt(1+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2) in 104
replace lower_CI= y_tilde_dyn-invnormal(0.975)*2.01387*sqrt(1+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2) in 105
replace lower_CI= y_tilde_dyn-invnormal(0.975)*2.01387*sqrt(1+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2) in 106
replace lower_CI= y_tilde_dyn-invnormal(0.975)*2.01387*sqrt(1+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2) in 107
replace lower_CI= y_tilde_dyn-invnormal(0.975)*2.01387*sqrt(1+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2) in 108
replace lower_CI= y_tilde_dyn-invnormal(0.975)*2.01387*sqrt(1+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2) in 109
replace lower_CI= y_tilde_dyn-invnormal(0.975)*2.01387*sqrt(1+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2+(1-.7175448)^2) in 110


tsline  parts_availability if time <=90, lwidth(thick) || ///
tsline y_tilde_dyn upper_CI lower_CI if time>90, lwidth(thick thick thick) lcolor(cranberry orange orange)xline(90.5, lpattern(dash) lcolor(gray) lwidth(thick)) || , ///
xtitle(, margin(t+2)) ytitle(, margin(r+2)) legend(off)

*log close
exit
