#!/bin/bash
EXECDIR=/home/cc/code/bitshuffle/tests
DATADIR=/home/cc/data
RESDIR=/home/cc/experiments
export ADVIXE_EXPERIMENTAL=roofline
# ================ #
# test fpzip #
# ================ #
source /home/cc/env4shuffle/bin/activate
cd $EXECDIR
for j in {0..30} 
do
	echo $j "===================" 
	advixe-cl --collect=roofline --interval=10 --project-dir=/home/cc/advi/bitshuffle_$j  -- python f_33.py 
	sed -i 's/K = '$j'/K = '$((j+1))'/' f_33.py
done
# python f_33.py >> $RESDIR/bitshuffle_all.txt
sed -i 's/K = 31/K = 0/' f_33.py
