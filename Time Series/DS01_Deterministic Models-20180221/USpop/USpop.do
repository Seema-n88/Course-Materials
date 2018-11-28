*************************************************************************************
*                                                                                   *
*                     Simple Trend Models (using USpop.dta)                         *
*                                                                                   *
*********************************************************************************** *

version 11.2
capture log close
set more off

* use "C:\...\USpop.dta", replace
* log using "C:\...\USpop.log", replace

describe
gen time = 1780 + 10*_n
format time %ty
tsset time
label variable time "Time"
tsline uspop, lwidth(thick)

regress uspop time
predict L_lin, xb
tsline uspop, lwidth(thick) || tsline L_lin, lwidth(thick) legend(rows(2))
predict res_lin, residuals
twoway scatter res_lin time, lwidth(thick)

gen luspop = ln(uspop)
tsline luspop, lwidth(thick)
regress luspop time
predict lL_exp, xb
gen L_exp = exp(_b[_cons])*exp(_b[time]*time)
tsline uspop L_exp, lwidth(thick thick) legend(rows(2))
generate res_exp = uspop-L_exp
twoway scatter res_exp time

di (uspop[2]-uspop[1])/uspop[1]
di ln(uspop[2])-ln(uspop[1])

regress luspop time if time < 1920
predict lL_exp_lt1920, xb
regress  luspop time if time >= 1920
predict lL_exp_ge1920, xb
gen L_exp_lt1920 = exp(lL_exp_lt1920)
gen L_exp_ge1920 = exp(lL_exp_ge1920)
tsline uspop, lwidth(thick) || tsline L_exp_lt1920 if time < 1920, lwidth(thick) || tsline L_exp_ge1920 if time >= 1920, lwidth(thick) legend(rows(3))

regress luspop time if time < 1910
predict lL_exp_lt1910, xb
regress luspop time if time >= 1910
predict lL_exp_ge1910, xb
gen L_exp_lt1910 = exp(lL_exp_lt1910)
gen L_exp_ge1910 = exp(lL_exp_ge1910)
tsline uspop, lwidth(thick) || tsline L_exp_lt1910 if time < 1910, lwidth(thick) || tsline L_exp_ge1910 if time >= 1910, lwidth(thick) legend(rows(3))

regress luspop time if time < 1900
predict lL_exp_lt1900, xb
regress  luspop time if time >= 1900
predict lL_exp_ge1900, xb
gen L_exp_lt1900 = exp(lL_exp_lt1900)
gen L_exp_ge1900 = exp(lL_exp_ge1900)
tsline uspop, lwidth(thick) || tsline L_exp_lt1900 if time < 1900, lwidth(thick) || tsline L_exp_ge1900 if time >= 1900, lwidth(thick) legend(rows(3))

gen time2 = time^2
regress uspop time time2
predict L_qua, xb
tsline uspop L_qua, lwidth(thick thick) legend(rows(2))
predict res_qua, residuals
scatter res_qua time

gen time3 =time^3
regress uspop time time2 time3
predict L_cub, xb
tsline uspop L_cub, lwidth(thick thick) legend(rows(2))
predict res_cub, residuals
scatter res_cub time

list time L_lin L_exp L_exp_ge1920 L_exp_ge1910 L_exp_ge1900 L_qua L_cub if time >= 2000

replace uspop = 281.55 in 22
replace uspop = 310.3 in 23

scatter uspop L_lin L_exp L_exp_ge1920 L_exp_ge1910 L_exp_ge1900 L_qua L_cub time if time == 2000, ///
legend(label(1 "US-Population at year 2000") label(2 "Linear Trend Prediction") label(3 "Exponential Trend Prediction") ///
label(4 "Exponential Trend Prediction, 1920") label(5 "Exponential Trend Prediction, 1910") label(6 "Exponential Trend Prediction, 1900") ///
label(7 "Quadratic Trend Prediction") label(8 "Cubic Trend prediction"))

scatter uspop L_lin L_exp L_exp_ge1920 L_exp_ge1910 L_exp_ge1900 L_qua L_cub time if time == 2010, ///
legend(label(1 "US-Population at year 2010") label(2 "Linear Trend Prediction") label(3 "Exponential Trend Prediction") ///
label(4 "Exponential Trend Prediction, 1920") label(5 "Exponential Trend Prediction, 1910") label(6 "Exponential Trend Prediction, 1900") ///
label(7 "Quadratic Trend Prediction") label(8 "Cubic Trend prediction"))

*calculate "forecast errors"
gen p_lin = .
replace p_lin = ( L_lin[22] -  281.55)/281.55 in 22
replace p_lin = ( L_lin[23] -  310.3)/310.3 in 23
gen p_exp = .
replace p_exp = ( L_exp[22] -  281.55)/281.55 in 22
replace p_exp = ( L_exp[23] -  310.3)/310.3 in 23
gen p_exp_ge1920 = .
replace p_exp_ge1920 = ( L_exp_ge1920[22] -  281.55)/281.55 in 22
replace p_exp_ge1920 = ( L_exp_ge1920[23] -  310.3)/310.3 in 23
gen p_exp_ge1910 = .
replace p_exp_ge1910 = ( L_exp_ge1910[22] -  281.55)/281.55 in 22
replace p_exp_ge1910 = ( L_exp_ge1910[23] -  310.3)/310.3 in 23
gen p_exp_ge1900 = .
replace p_exp_ge1900 = ( L_exp_ge1900[22] -  281.55)/281.55 in 22
replace p_exp_ge1900 = ( L_exp_ge1900[23] -  310.3)/310.3 in 23
gen p_qua = .
replace p_qua = ( L_qua[22] -  281.55)/281.55 in 22
replace p_qua = ( L_qua[23] -  310.3)/310.3 in 23
gen p_cub = .
replace p_cub = ( L_cub[22] -  281.55)/281.55 in 22
replace p_cub = ( L_cub[23] -  310.3)/310.3 in 23
list time p_lin p_exp p_exp_ge1920 p_exp_ge1910 p_exp_ge1900 p_qua p_cub if time >= 2000


* log close
exit
