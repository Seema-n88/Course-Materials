#!/bin/bash

DST=$1
NUMTIMES=$2
OUTLIN=lin
OUTMEMSWEEP=memsweep
OUTDD=dd
EXECLIN=linpack.sh
EXECMEMSWEEP=memsweep.sh
EXECDD=diskdump.sh
DATE=$(date +%m-%d-%y)
WAITTIME=90
SUFLIN=$(ls ${OUTLIN}*.out 2>/dev/null | wc -l)
SUFMEMSWEEP=$(ls ${OUTMEMSWEEP}*.out 2>/dev/null | wc -l)
SUFDD=$(ls ${OUTDD}*.out 2>/dev/null | wc -l)


workdir=$(pwd)
echo $workdir
#cd ${DST}
${workdir}/repeatexec.sh ${NUMTIMES} ${workdir}/${EXECLIN} | ${workdir}/timestamp.sh | tee ${workdir}/${OUTLIN}_${DATE}_${SUFLIN}.out
${workdir}/repeatexec.sh ${NUMTIMES} ${workdir}/${EXECMEMSWEEP} | ${workdir}/timestamp.sh | tee ${workdir}/${OUTMEMSWEEP}_${DATE}_${SUFMEMSWEEP}.out

for i in $(seq 1 1 $2)
do
	./${EXECDD} 2>&1 | ${workdir}/timestamp.sh | tee -a ${PWD}/${OUTDD}_${DATE}_${SUFDD}.out
        sleep ${WAITTIME}
done
cd ${workdir}
