set terminal unknown

set datafile separator ";"

set tics font ",16"
set ytics add ("Exp.\n (2.88)" 2.88)
set grid
set autoscale x
set autoscale y
set xlabel "Number of atoms in the primitive cell"
set ylabel "Energy (GHz)"

set key font ",16"
set ytics font ",12"
set xtics font ",12"

#set title "cubic"

#set format y "%.1s"

LINEWIDTH=9


plot "data/cubic.data" using 1:($2/1000):xtic(1) title "D" with linespoint lw LINEWIDTH pt 7 , \
     "data/cubic.data" using 1:($3/1000):xtic(1) title "E" with linespoint  lw LINEWIDTH pt 7, \

set terminal pdfcairo
set output "plot_cubic.pdf"

set yrange [-(GPVAL_DATA_Y_MAX - GPVAL_DATA_Y_MIN)*0.05+GPVAL_DATA_Y_MIN:GPVAL_DATA_Y_MAX+(GPVAL_DATA_Y_MAX - GPVAL_DATA_Y_MIN)*0.05]
set xrange [-(GPVAL_DATA_X_MAX - GPVAL_DATA_X_MIN)*0.05+GPVAL_DATA_X_MIN:GPVAL_DATA_X_MAX+(GPVAL_DATA_X_MAX - GPVAL_DATA_X_MIN)*0.05]

replot

#set terminal wxt
#replot



# vim: nospell ft=gnuplot :

