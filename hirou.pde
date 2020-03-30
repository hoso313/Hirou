PImage hito;
PImage tanimage;
PImage haikei;
PImage dogeza;
float x =200.0;
float y =500.0;
int wx=30;
int[] ty = new int[10];
int[] tWait= new int[10];
int Y =0;
int dY=5;
int score;
int hp;
int game;




void setup(){
  tanimage=loadImage("tanimage.png");
  hito=loadImage("hashiru.png");
  haikei=loadImage("haikei.jpg");
  dogeza=loadImage("dogeza.png");
  size(500,600);
 gameInit();
}




void draw(){
  if(game==0){gamePlay();}
  else if(game==1){gameOver();}

}
void gamePlay()

{ image(haikei,0,0,500,600);
  playerMove();
  player();
  tani();
  hitCheck();
 scoreDisp();
 if(hp<1){game=1;}
 
 }
 
 void gameOver()
 
 {background(0);
   int mc=0;
 player(); scoreDisp();mc++;
 if((mc%60)<40){
 textSize(70);
 fill(255,0,0);
 text("留年確定",110,200);
 textSize(25);
 fill(255,255,0);
 text("クリックしてもう一年やり直してください",20,400);}
 }
  
  
 void gameInit(){
   for(int i=0; i<10; i++)
{
  ty[i]=int( random(40,240));
objInit(i);
}
score=0;
hp=10;
game=0;

}

void mousePressed(){
  if(game==1){gameInit();}}

void player(){if(hp>0){image(hito,x,y,70,70);}
else{image(dogeza,x,y,70,70);}
}

void playerMove(){
  x=mouseX;
  if( (x+wx)>width){x=width-wx;}
}

void tani(){
for(int i=0; i<10; i++){
image(tanimage,float(i*43+40),float(ty[i]),30,30);}

for(int i=0; i<10; i++){
  if(tWait[i]>0){
    tWait[i]--;
}else{
  ty[i] +=3;}


 if( ty[i] > height ){
  objInit(i); hp--;
     }
  }
}

void objInit(int no){
  ty[no] =40;
  tWait[no]=int(random(70,210));
}

void hitCheck(){
int ox;
for(int i=0; i<10; i++){
ox = i*43+40;
if(( x <(ox+30))&&((x+30) >ox)&&(y<(ty[i]+30))&&((y+30)>ty[i])){
  score +=1;
  noStroke();
  fill(255,255,51,90);
  ellipse(x,y,100,100);  
  fill(255,255,51,70);
  ellipse(x,y,150,150); 
  fill(255,255,51,50);
  ellipse(x,y,200,200);
  objInit(i);}
}
}

void scoreDisp(){PFont font = createFont("MS Gothic",48,true);textFont(font);
  textSize(24);
  fill(255,0,0);
  text("取得単位:"+score,10,25);
  text("モチベーション:"+hp,270,25);}