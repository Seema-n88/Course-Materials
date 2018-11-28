*************************************************************************
*                                                                       *
*   Introduction to Stata (using dax.dta)                               *
*                                                                       *
*************************************************************************

version 11.2
set more off

* use "C:\...\dax.dta", clear
* log using "C:\...\dax.log", replace   

describe
list

format time %tdd/M/Y
list in 1/4

format time %td-D_l.CY-
list in 1/4

display 365*40+10+2
list if time == 14612

summarize
sum dax

generate L_dax=L.dax
list in 1/10

graph twoway line dax time
tsset time
tsline dax

* log close
exit
