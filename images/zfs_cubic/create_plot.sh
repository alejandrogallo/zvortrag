#! /usr/bin/env bash


#  general definitions {{{1  #
##############################

function header()   { echo -e "\n\033[1m$@\033[0m"; }
function success()  { echo -e " \033[1;32m==>\033[0m  $@"; }
function error()    { echo -e " \033[1;31mX\033[0m  $@"; }
function arrow()    { echo -e " \033[1;34m==>\033[0m  $@"; }


__SCRIPT_VERSION="0.0.1"; __SCRIPT_NAME=$( basename $0 ); __DESCRIPTION="Create some plots"; __OPTIONS=":hvn"
function usage_head() { echo "Usage :  $__SCRIPT_NAME [-h|-help] [-v|-version]"; }
function usage () {
cat <<EOF
$(usage_head)

    $__DESCRIPTION

    Options:
    -h|help       Display this message
    -v|version    Display script version
    -n            No replace data, just see info


    This program is maintained by Alejandro Gallo.
EOF
}    # ----------  end of function usage  ----------

while getopts $__OPTIONS opt
do
  case $opt in

  h|help     )  usage; exit 0   ;;

  v|version  )  echo "$__SCRIPT_NAME -- Version $__SCRIPT_VERSION"; exit 0   ;;

  n ) NO_REPLACE=1;;

  * )  echo -e "\n  Option does not exist : $OPTARG\n"
      usage_head; exit 1   ;;

  esac    # --- end of case ---
done
shift $(($OPTIND-1))


if [[ -z ${NO_REPLACE} ]]; then
  header Warning
  read -p "Are you sure you want to overwrite the other plot? (y/N)" -n 1 -r
  echo
  if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    success "Exiting safely..."
    exit 0
  fi
  REPLY= # unset REPLY after using it
fi

DATA_DIR=data
mkdir -p $DATA_DIR



###################
#  Allotrop loop  #
###################

ALLOTROPES=(
cubic
)
#hexagonal.x
#hexagonal.z


for allotrop in ${ALLOTROPES[@]}; do 

  header "Creating $allotrop"

allotrop_id=$(tr "/" "_" <<<$allotrop)

##################
#  GET D MATRIX  #
##################


for path in *${allotrop}*; do

  arrow "Processing $path"
  number=$(sed "s/[^0-9]//g" <<<$path)
  data_file=$DATA_DIR/${number}_${allotrop_id}.txt

  arrow "\t Getting D matrix and outputing it in \033[0;31m$data_file\033[0m ..."
  spin=$(smye ${path} --get-spin)
  arrow "${spin}         - ${path}"
  if [[ -z ${NO_REPLACE} ]]; then
    d2E -f $path >  $data_file || error "An error occurred" && success "done"
  fi

done


##############
#  GET DATA  #
##############

arrow "\n Creating data file"
PLOT_DATA=$DATA_DIR/${allotrop_id}.data
[[ -f $PLOT_DATA ]] && rm $PLOT_DATA

if [[ -z ${NO_REPLACE} ]]; then
  echo "number_of_atoms;D;E" >> $PLOT_DATA
fi

for dataFile in $(ls -v $DATA_DIR/*${allotrop_id}.txt ); do
  arrow "Processing $dataFile ..."
  number=$(sed "s/[^0-9]//g" <<<$dataFile)
  E=$(sed -n "
  /E ---/ {
    s/---->//
    s/[^-\.0-9]//g
    p
  }" $dataFile)
  D=$(sed -n "
  /D ---/ {
    s/---->//
    s/[^-\.0-9]//g
    p
  }" $dataFile)
  if [[ -z ${NO_REPLACE} ]]; then
    if [[ -n $D  &&  -n $E ]]; then
      echo "$number;$D;$E" >> $PLOT_DATA
    fi
  fi
done


  if [[ -n ${NO_REPLACE} ]]; then
    success "Safe mode, exiting now"
    continue
  fi

#############
#  GNUPLOT  #
#############


arrow " Creating Gnuplot file"

GNUPLOT_DIR=plot_src
mkdir -p $GNUPLOT_DIR
PLOT_FILE=$GNUPLOT_DIR/plot_${allotrop_id}.gnuplot
YFACTOR=1000

YTICS=$( (cut -d ";" -f 2 $PLOT_DATA; cut -d ";" -f 3 $PLOT_DATA  ) |  sed "/[a-z]/I d" | sort -g | sed "s/.*/&\/$YFACTOR/" | tr "\n" ","  | sed s/,$//)

cat > $PLOT_FILE <<EOF
set terminal unknown

set datafile separator ";"

set tics font ",16"
#set ytics 2.88 1
set ytics add ("exp." 2.88)
set grid
#set key font ",16"
#set ytics font ",12"
set autoscale x
set autoscale y
set xlabel "Number of atoms"
set ylabel "Energy (GHz)"

set title "$( tr "_" " " <<< $allotrop_id )"

#set format y "%.1s"


plot "$PLOT_DATA" using 1:(\$2/$YFACTOR):xtic(1) title "D" with linespoint pt 7 , \\
     "$PLOT_DATA" using 1:(\$3/$YFACTOR):xtic(1) title "E" with linespoint  pt 7, \\

set terminal pdfcairo
set output "$(basename $PLOT_FILE .gnuplot ).pdf"

set yrange [-(GPVAL_DATA_Y_MAX - GPVAL_DATA_Y_MIN)*0.05+GPVAL_DATA_Y_MIN:GPVAL_DATA_Y_MAX+(GPVAL_DATA_Y_MAX - GPVAL_DATA_Y_MIN)*0.05]
set xrange [-(GPVAL_DATA_X_MAX - GPVAL_DATA_X_MIN)*0.05+GPVAL_DATA_X_MIN:GPVAL_DATA_X_MAX+(GPVAL_DATA_X_MAX - GPVAL_DATA_X_MIN)*0.05]

replot

set terminal wxt
replot



# vim: ft=gnuplot :

EOF


gnuplot -persist $PLOT_FILE &

done
