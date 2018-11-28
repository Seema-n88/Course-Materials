*************************************************************************
*                                                                       *
*   Identification (using GNP.dta)                                      *
*                                                                       *
*************************************************************************

version 11.2
set more off
capture log close

* use "C:\...\GNP.dta", clear
* log using "C:\...\GNP.log", replace   

gen time = -52 + _n
format time %tq
list in 1/10

tsset time
tsline GNP, lwidth(thick)

summarize GNP
return list
display r(mean)
local mean=r(mean)
display `mean'

twoway scatter L.GNP GNP, yline(`mean', lwidth(medthick)) xline(`mean', lwidth(medthick)) xtitle("GNP in t") ytitle("GNP in t-1") || ///
       lfit L.GNP GNP, lwidth(medthick) legend(off)

twoway scatter L2.GNP GNP, yline(`mean', lwidth(medthick)) xline(`mean', lwidth(medthick)) xtitle("GNP in t") ytitle("GNP in t-2") || ///
       lfit L2.GNP GNP, lwidth(medthick) legend(off)

twoway scatter L3.GNP GNP, yline(`mean', lwidth(medthick)) xline(`mean', lwidth(medthick)) xtitle("GNP in t") ytitle("GNP in t-3") || ///
       lfit L3.GNP GNP, lwidth(medthick) legend(off)

corrgram GNP

ac GNP

* log close
exit
