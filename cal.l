%option noyywrap
%{
  #include <stdio.h>
  #include <math.h>
  int option = 0;
  float a, b;
  void digi();
%}
  
dig [0-9]+|([0-9]*)"."([0-9]+)
addition "+"
subtraction "-"
multiplication "*"
division "/"
power "^"
sine "sin"
cosine "cos"
tangent "tan"
squareRoot "sqrt"
cubicRoot "cbrt"
log "lg"
ln "ln"
percent "prcn"
mod "%"
%%
  
{dig} {digi();} 
{addition} {option=1;}
{subtraction} {option=2;}
{multiplication} {option=3;}
{division} {option=4;}
{power} {option=5;}
{sine} {option=6;}
{cosine} {option=7;}
{tangent} {option=8;}
{squareRoot} {option=9;}
{cubicRoot} {option=10;}
{log} {option=11;}
{ln} {option=12;}
{percent} {option=13;}
{mod} {option=14;}
[\n] {
printf("\n The Answer :%f\n\n",a);
}
  
%%

void digi()
{
 if(option==0)
  
 a=atof(yytext); 
  
 else
 {
 b=atof(yytext);
  
 switch(option)
 {
   case 1:
   a=a+b;
   break;
  
   case 2:
   a=a-b;
   break;
   
   case 3:
   a=a*b;
   break;
   
   case 4:
   a=a/b;
   break;
   
   case 5:
   a = pow(a,b);
   break;
   
   case 6:
   b = b * (M_PI / 180.0);
   a=sin(b);
   break;
   
   case 7:
   b = b * (M_PI / 180.0);
   a=cos(b);
   break;
   
   case 8:
   b = b * (M_PI / 180.0);
   a=tan(b);
   break;
   
   case 9:
   a=sqrt(b);
   break;
   
   case 10:
   a=cbrt(b);
   break;

   case 11:
   a=log(a)/log(b);
   break;

   case 12:
   a=log(a);
   break;

   case 13:
   a=a*b;
   result=a/100
   break;

   case 14:
   (a>=b){
        a-=b;
    }
   result = a;
   break;

  }
 option=0;
 }
}
  
int main(void)
{
 yylex();
 return 0;
}
