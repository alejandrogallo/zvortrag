set terminal unknown

set datafile separator ";"

set tics font ",12"
#set xtics (0)
#set ytics (0)
set grid
set grid lw 2
set key font ",12"
set autoscale x
set autoscale y
set xlabel "E (GHz)"
set ylabel "D (GHz)"
set format x "%1.2f"
set format y "%1.2f"


#set format y "%.1s"

plot  \
  "data/C_minus_cubic_128_.data" using ($3/1000):($2/1000):(sprintf("CV^{-}_{c}")) notitle with labels center font "Arial,17" textcolor rgb "red"  , \
  "data/C_minus_hexagonal_x_128_.data" using ($3/1000):($2/1000):(sprintf("CV^{-}_{x}")) notitle with labels center font "Arial,17" textcolor rgb "red"  , \
  "data/C_zero_cubic_128_.data" using ($3/1000):($2/1000):(sprintf("CV^{0}_{c}")) notitle with labels center font "Arial,17" textcolor rgb "black"  , \
  "data/C_zero_hexagonal_x_128_.data" using ($3/1000):($2/1000):(sprintf("CV^{0}_{x}")) notitle with labels center font "Arial,17" textcolor rgb "black"  , \
  "data/Ge_zero_cubic_128_.data" using ($3/1000):($2/1000):(sprintf("GeV^{0}_{c}")) notitle with labels center font "Arial,17" textcolor rgb "black"  , \
  "data/Ge_zero_hexagonal_z_128_.data" using ($3/1000):($2/1000):(sprintf("GeV^{0}_{z}")) notitle with labels center font "Arial,17" textcolor rgb "black"  , \
  "data/N_minus_cubic_128_.data" using ($3/1000):($2/1000):(sprintf("NV^{-}_{c}")) notitle with labels center font "Arial,17" textcolor rgb "red"  , \
  "data/N_minus_hexagonal_x_128_.data" using ($3/1000):($2/1000):(sprintf("NV^{-}_{x}")) notitle with labels center font "Arial,17" textcolor rgb "red"  , \
  "data/N_minus_hexagonal_z_128_.data" using ($3/1000):($2/1000):(sprintf("NV^{-}_{z}")) notitle with labels center font "Arial,17" textcolor rgb "red"  , \
  "data/Si_zero_cubic_128_.data" using ($3/1000):($2/1000):(sprintf("SiV^{0}_{c}")) notitle with labels center font "Arial,17" textcolor rgb "black"  , \
  "data/Si_zero_hexagonal_z_128_.data" using ($3/1000):($2/1000):(sprintf("SiV^{0}_{z}")) notitle with labels center font "Arial,17" textcolor rgb "black"  , \

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
set output "all.pdf"
replot

set label font ",20"
set tics font ",20"
#set terminal wxt font ",12" enhanced
replot



# vim: ft=gnuplot :
