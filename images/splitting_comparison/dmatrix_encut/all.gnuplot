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
  "data/C_minus_cubic_128_.data" using\
 ($3/1000):($2/1000) notitle with\
 points pt 7 ps .5 , \
  "data/C_minus_hexagonal_x_128_.data" using\
 ($3/1000):($2/1000) notitle with\
 points pt 7 ps .5 , \
  "data/C_zero_cubic_128_.data" using\
 ($3/1000):($2/1000) notitle with\
 points pt 7 ps .5 , \
  "data/C_zero_hexagonal_x_128_.data" using\
 ($3/1000):($2/1000):(sprintf("CV^{0}_{x}")) notitle with\
 labels center font "Arial,17" textcolor rgb "black"  , \
  "data/Ge_zero_cubic_128_.data" using\
 ($3/1000):($2/1000) notitle with\
 points pt 7 ps .5 , \
  "data/Ge_zero_hexagonal_z_128_.data" using\
 ($3/1000):($2/1000) notitle with\
 points pt 7 ps .5 , \
  "data/N_minus_cubic_128_.data" using\
 ($3/1000):($2/1000):(sprintf("NV^{-}_{c}")) notitle with\
 labels center font "Arial,17" textcolor rgb "red"  , \
  "data/N_minus_hexagonal_x_128_.data" using\
 ($3/1000):($2/1000):(sprintf("NV^{-}_{x}")) notitle with\
 labels center font "Arial,17" textcolor rgb "red"  , \
  "data/N_minus_hexagonal_z_128_.data" using\
 ($3/1000):($2/1000):(sprintf("NV^{-}_{z}")) notitle with\
 labels center font "Arial,17" textcolor rgb "red"  , \
  "data/Si_zero_cubic_128_.data" using\
 ($3/1000):($2/1000) notitle with\
 points pt 7 ps .5 , \
  "data/Si_zero_hexagonal_z_128_.data" using\
 ($3/1000):($2/1000) notitle with\
 points pt 7 ps .5 , \


set style arrow 1 head filled size screen 0.025,10,45 ls 1

separation=0.05


#-  ArROWS {{{1  -
#-----------------

#"data/Si_zero_cubic_128_.data" using
set arrow from -separation,0.703 to 0.0,0.703 as 1
set label "SiV^{0}_{c}" at -separation,0.703 right\
  font "Arial,17" textcolor rgb "black"

#"data/Ge_zero_cubic_128_.data" using
set arrow from +separation,0.8296695 to 0.0,0.8296695 as 1
set label "GeV^{0}_{c}" at +separation+0.0,0.8296695 left\
  font "Arial,17" textcolor rgb "black"

#"data/Si_zero_hexagonal_z_128_.data" using
#1297.23
set arrow from -separation,1.29723 to 0.0,1.29723 as 1
set label "SiV^{0}_{z}" at -separation,1.29723 right\
  font "Arial,17" textcolor rgb "black"

#"data/Ge_zero_hexagonal_z_128_.data" using
#1260.3045
set arrow from +separation,1.2603045 to 0.0,1.2603045 as 1
set label "GeV^{0}_{z}" at +separation+0.0,1.2603045 left\
  font "Arial,17" textcolor rgb "black"

#"data/C_zero_cubic_128_.data" using
set arrow from -separation,0.0 to 0.0,0 as 1
set label "CV^{0}_{c}" at -separation,0 right\
  font "Arial,17" textcolor rgb "black"

#"data/C_minus_cubic_128_.data" using
set arrow from +separation,0.0 to 0.0,0 as 1
set label "CV^{-}_{c}" at +separation,0 left\
  font "Arial,17" textcolor rgb "black"

#"data/C_minus_hexagonal_x_128_.data" using
#-71.3565 #-0.0713565
set arrow from -separation,-20*separation to 0.0,-0.0713565 as 1
set label "CV^{-}_{x}" at -separation,-20*separation right \
  font "Arial,17" textcolor rgb "black"

set xrange [-(GPVAL_DATA_X_MAX - GPVAL_DATA_X_MIN)*0.05+GPVAL_DATA_X_MIN:GPVAL_DATA_X_MAX+(GPVAL_DATA_X_MAX - GPVAL_DATA_X_MIN)*0.05 +.1]
set yrange [-(GPVAL_DATA_Y_MAX - GPVAL_DATA_Y_MIN)*0.05+GPVAL_DATA_Y_MIN:GPVAL_DATA_Y_MAX+(GPVAL_DATA_Y_MAX - GPVAL_DATA_Y_MIN)*0.05]


set terminal pdfcairo enhanced
set output "all.pdf"
replot




# vim: ft=gnuplot :
