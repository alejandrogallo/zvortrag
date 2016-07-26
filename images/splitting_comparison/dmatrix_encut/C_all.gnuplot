set terminal unknown

set datafile separator ";"

set tics font ",12"
set xtics (0)
set ytics (0)
set grid
set key font ",12"
set autoscale x
set autoscale y
set xlabel "E (GHz)"
set ylabel "D (GHz)"
set format x "%1.1f"
set format y "%1.1f"

set title "CV complexes"

#set format y "%.1s"

plot  \
  "data/C_minus_cubic_128_.data" using ($3/1000):($2/1000):(sprintf("-c")) notitle with labels center font "Times,12" textcolor rgb "red"  , \
  "data/C_minus_hexagonal_x_128_.data" using ($3/1000):($2/1000):(sprintf("-x")) notitle with labels center font "Times,12" textcolor rgb "red"  , \
  "data/C_zero_cubic_128_.data" using ($3/1000):($2/1000):(sprintf("0c")) notitle with labels center font "Times,12" textcolor rgb "black"  , \
  "data/C_zero_hexagonal_x_128_.data" using ($3/1000):($2/1000):(sprintf("0x")) notitle with labels center font "Times,12" textcolor rgb "black"  , \





set xtics add (0.0/1000)
set ytics add (0.0/1000)



set xtics add (0.0/1000)
set ytics add (-71.3565/1000)



set xtics add (0.0/1000)
set ytics add (0.0/1000)



set xtics add (0.0/1000)
set ytics add (-1586.712/1000)


if (GPVAL_DATA_X_MAX==GPVAL_DATA_X_MIN) {
set xrange [-0.5:0.5]
}
else {
set xrange [-(GPVAL_DATA_X_MAX - GPVAL_DATA_X_MIN)*0.05+GPVAL_DATA_X_MIN:GPVAL_DATA_X_MAX+(GPVAL_DATA_X_MAX - GPVAL_DATA_X_MIN)*0.05]
}
if (GPVAL_DATA_Y_MAX==GPVAL_DATA_Y_MIN) {
set yrange [-0.5:0.5]
}
else {
set yrange [-(GPVAL_DATA_Y_MAX - GPVAL_DATA_Y_MIN)*0.05+GPVAL_DATA_Y_MIN:GPVAL_DATA_Y_MAX+(GPVAL_DATA_Y_MAX - GPVAL_DATA_Y_MIN)*0.05]
}

#set xtics add (GPVAL_DATA_X_MAX)
#set xtics add (GPVAL_DATA_X_MIN)
#set ytics add (GPVAL_DATA_Y_MAX)
#set ytics add (GPVAL_DATA_Y_MIN)

set terminal pdfcairo enhanced
set output "C_all.pdf"
replot

set label font ",20"
set tics font ",20"
#set terminal wxt font ",12"
replot



# vim: ft=gnuplot :
