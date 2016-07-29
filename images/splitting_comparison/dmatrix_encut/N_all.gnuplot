set terminal unknown

set datafile separator ";"

set tics font ",12"
set xtics (0)
set ytics (0)
set grid
set grid lw 2
set key font ",12"
set autoscale x
set autoscale y
set xlabel "E (GHz)"
set ylabel "D (GHz)"
set format x "%1.2f"
set format y "%1.2f"

#set title "NV complexes"

#set format y "%.1s"

plot  \
  "data/N_minus_cubic_128_.data" using ($3/1000):($2/1000):(sprintf("NV_c^-")) notitle with labels center font "Arial,17" textcolor rgb "red"  , \
  "data/N_minus_hexagonal_x_128_.data" using ($3/1000):($2/1000):(sprintf("NV^-_x")) notitle with labels center font "Arial,17" textcolor rgb "red"  , \
  "data/N_minus_hexagonal_z_128_.data" using ($3/1000):($2/1000):(sprintf("NV^-_z")) notitle with labels center font "Arial,17" textcolor rgb "red"  , \





#set ytics add ("Exp. NV^- 2.88" 2.88)
set ytics add (2.88)

set xtics add (0.0/1000)
set ytics add (3046.1565/1000)

set label "Experimental value for NV^-" at -0.15,2.89 center textcolor rgb "blue"



set xtics add (-255.516/1000)
set ytics add (2863.851/1000)



set xtics add (0.0/1000)
set ytics add (2722.266/1000)


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


set terminal pdfcairo enhanced
set output "N_all.pdf"
replot

#set label font ",20"
#set tics font ",20"
#set terminal wxt font ",12"
#replot



# vim: ft=gnuplot :

