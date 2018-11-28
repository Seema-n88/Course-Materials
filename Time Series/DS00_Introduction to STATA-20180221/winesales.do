
*************************************************************************
*                                                                       *
*   Introduction to Stata (using winesales.dta)                               *
*                                                                       *
*************************************************************************

version 11.2
set more off

use "C:\...\winesales.dta", clear
log using "C:\...\winesales.log", replace   

generate time=_n+239
format time %tm
generate time_2=tm(1980m1)+_n-1
format  time_2 %tm
list time time_2 in 1/5

log close
exit
