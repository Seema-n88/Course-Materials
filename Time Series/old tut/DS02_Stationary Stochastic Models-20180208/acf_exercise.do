*************************************************************************************
*                                                                                   *
*                                      ACF                                          *
*                                                                                   *
*************************************************************************************

version 11.1

drop _all
set more off
set obs 200
generate time = _n
tsset time

*JUST ACF! PACF has to be created!

*****************************************************
*     ACF simulated white noise                     *
*****************************************************
set seed 1
generate sim_white_noise = invnorm(uniform())
label variable sim_white_noise "simulated white noise"
tsline sim_white_noise, yline(0)
ac sim_white_noise, lags(25) ytitle(ACF of simulated white noise) ylabel(-1(.2)1, format(%9.0g))

*****************************************************
*     ACF simulated MA(1)                           *
*****************************************************
local theta1 = -0.8
generate sim_MA1 = sim_white_noise
forvalues num = 2/200 {
  quietly: replace  sim_MA1 = sim_white_noise - (`theta1')*L1.sim_white_noise in `num'
}
label variable sim_MA1 "simulated MA(1)"
tsline sim_MA1, yline(0)
ac sim_MA1, lags(25) ytitle(ACF of simulated MA(1)) ylabel(-1(.2)1, format(%9.0g))

*****************************************************
*     ACF simulated MA(2)                           *
*****************************************************
local theta1 = -0.6
local theta2 = 0.3
generate sim_MA2 = sim_white_noise
replace  sim_MA2 = sim_white_noise - `theta1'*L1.sim_white_noise in 2
forvalues num = 3/200 {
  quietly: replace  sim_MA2 = sim_white_noise - `theta1'*L1.sim_white_noise - `theta2'*L2.sim_white_noise in `num'
}
label variable sim_MA2 "simulated MA(2)"
tsline sim_MA2, yline(0)
ac sim_MA2, lags(25) ytitle(ACF of simulated MA(2)) ylabel(-1(.2)1, format(%9.0g))

drop _all
set more off
set obs 2000
generate time = _n
tsset time

*****************************************************
*     ACF simulated white noise                     *
*****************************************************
set seed 1
generate sim_white_noise = invnorm(uniform())
label variable sim_white_noise "simulated white noise"
tsline sim_white_noise, yline(0)
ac sim_white_noise, lags(25) ytitle(ACF of simulated white noise) ylabel(-1(.2)1) 

*****************************************************
*     ACF simulated AR(1)                           *
*****************************************************
local phi1 = .9
generate sim_AR1 = sim_white_noise
forvalues num = 2/2000 {
  quietly: replace sim_AR1 = `phi1'*L1.sim_AR1 + sim_white_noise in `num'
}
label variable sim_AR1 "simulated AR(1)"
tsline sim_AR1 if time >= 1800, yline(0)
ac sim_AR1 if time >= 1800, lags(25) ytitle(ACF of simulated AR(1)) ylabel(-1(.2)1, format(%9.0g)) subtitle("") note("")

*****************************************************
*     ACF simulated AR(2)                           *
*****************************************************
local phi1 = .9
local phi2 = -.7
generate sim_AR2 = sim_white_noise
replace  sim_AR2 = `phi1'*L1.sim_AR2 + sim_white_noise in 2
forvalues num = 3/2000 {
  quietly: replace  sim_AR2 = `phi1'*L1.sim_AR2 + `phi2'*L2.sim_AR2 + sim_white_noise in `num'
}
label variable sim_AR2 "simulated AR(2)"
tsline sim_AR2 if time >= 1800, yline(0)
ac sim_AR2 if time >= 1800, lags(25) ytitle(ACF of simulated AR(2)) ylabel(-1(.2)1, format(%9.0g)) subtitle("") note("")

exit
