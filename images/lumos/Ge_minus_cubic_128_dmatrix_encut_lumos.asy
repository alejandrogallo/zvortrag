

string LUMO_TITLE="\sf \Huge Cubic";

real ENERGIE_LB_PRISTINE   = 17.1560 ;
real ENERGIE_VB_PRISTINE   = 12.7456 ;

real OBERKANTE     = 100;
real UNTERKANTE    = 0;
real IMG_WIDTH     = 50;
real KANTEN_HEIGHT = 20;

real[] UNEXCITED_ENERGIES={17.0999, 17.0474, 17.0409, 17.0285, 17.0285, 17.0229, 17.0229, 14.2835, 14.2835, 13.9921, 13.9921, 12.4684, 12.4626, 12.2021};
real[] UNEXCITED_SPINS={1, 2, 1, 2, 2, 1, 1, 2, 2, 1, 1, 2, 1, 2};
real[] UNEXCITED_OCCUPATION={-0.00000, -0.00000, -0.00000, -0.00000, -0.00000, -0.00000, -0.00000, 0.46853, 0.46857, 1.03145, 1.03145, 1.00000, 1.00000, 1.00000};
real[] UNEXCITED_BANDS={260, 258, 258, 256, 257, 256, 257, 255, 254, 255, 254, 253, 253, 252};

//size(5cm,5cm);
unitsize(.2cm);


struct state {
  real energy;
  real occupation;
  real band;
  real value;
  string title     = "";
  real spin        = 0;
  real VB          = ENERGIE_VB_PRISTINE;
  real LB          = ENERGIE_LB_PRISTINE;
  real DASH_WIDTH  = 25;
  real DASH_HEIGHT = 1;
  real X_COORD     = 0;
  real Y_OFFSET    = 0;
  real getPlottingValue ( ){
    real val = 100*(energy - VB)/(LB-VB);
    return val + Y_OFFSET;
  };
  void init(real e, real s, real o, real b){
    energy     = e;
    if (spin == 0 ){
      occupation = o;
    }
    else{
    if ( o<0.5 ) {
      occupation = 0;
    } else {
      occupation = 1;
    }
    }
    band       = b;
    spin       = s;
    value      = getPlottingValue();
  };
  pair getMiddlePoint (  ){
    real x,y;
    x = X_COORD+(DASH_WIDTH)/2;
    y = value + (DASH_HEIGHT)/2;
    return (x,y);
  };
  void draw_spin(){
    pair middle = getMiddlePoint();
    path ar;
    real x_deviation = 0.25*DASH_WIDTH;
    real height = 5*DASH_HEIGHT;
    pen unoccupied_style = 0.7*white+dashed, occupied_style = black, style;
    if ( occupation == 1 ) {
      style = occupied_style;
    } else {
      style = unoccupied_style;
    }
    if ( spin == 1 ) {
      ar = (middle - (-x_deviation,height))..(middle + (x_deviation,height));
    } else {
      ar = (middle + (-x_deviation,height))..(middle - (x_deviation,height));
    }
    draw(ar, linewidth(1)+style,Arrow());
  };
  void draw (){
    pen style = red;
    //label((string)energy, (X_COORD+DASH_WIDTH,value), E);
    if ( spin != 0 ) {
      draw_spin();
    } else{
      real OCCUPATION_CUTOFF=0.1;
      if (occupation<=OCCUPATION_CUTOFF){
        style=blue;
      }
    }
    filldraw(box((X_COORD,value),(X_COORD+DASH_WIDTH,value+DASH_HEIGHT)),style);
  };
};


/*******************/
/* DRAW DECORATION */
/*******************/
real pointsToEnergy ( real point ){
  return (ENERGIE_LB_PRISTINE-ENERGIE_VB_PRISTINE)*point/100 + ENERGIE_VB_PRISTINE;
};
label(LUMO_TITLE, (25, 100+KANTEN_HEIGHT/1.5), black);
draw((50,0)--(50,100),dashed, Arrows);
label((string)(ENERGIE_LB_PRISTINE-ENERGIE_VB_PRISTINE)+" eV", (50,50), Fill(white));

//label("Leitungsband" , (IMG_WIDTH/2 , OBERKANTE+(KANTEN_HEIGHT)/2));
//label("Valenzband"   , (IMG_WIDTH/2 , (UNTERKANTE-KANTEN_HEIGHT)/2));

path UNTERKANTE_BOX = box((0 , UNTERKANTE) , (IMG_WIDTH , UNTERKANTE - KANTEN_HEIGHT));
path OBERKANTE_BOX  = box((0 , OBERKANTE)  , (IMG_WIDTH , OBERKANTE + KANTEN_HEIGHT));

filldraw(OBERKANTE_BOX  , .8*white);
filldraw(UNTERKANTE_BOX , .8*white);



int steps = 5;
real width = 100/5;
draw((0,0)--(0,100), linewidth(1));
for ( int i = 0; i <= steps; i+=1 ) {
  draw((0,width*i)--(2,width*i));
  label(scale(0.7)*(string)pointsToEnergy(width*i), (1,width*i), E, Fill(white));
}




/***************/
/* DRAW STATES */
/***************/

for ( int i = 0; i < UNEXCITED_ENERGIES.length; i+=1 ) {
  int controller;
  if ( i%2 == 0 ) {
    controller = 0;
  } else {
    controller = 1;
  }
  state s;
  s.init(UNEXCITED_ENERGIES[i], UNEXCITED_SPINS[i], UNEXCITED_OCCUPATION[i], UNEXCITED_BANDS[i]);
  s.X_COORD=0+controller*(s.DASH_WIDTH);
  if ( controller == 0 ) {
    label((string)s.energy, (s.X_COORD,s.value), W, red);
  } else {
    label((string)s.energy, (s.X_COORD+s.DASH_WIDTH, s.value), E, red);
  }
  label(scale(1)*(string)s.band, s.getMiddlePoint() - (s.DASH_WIDTH/4, 0), black);
  label(scale(1)*(string)s.occupation, s.getMiddlePoint()+ (s.DASH_WIDTH/4, 0), black);
  s.draw();

}

