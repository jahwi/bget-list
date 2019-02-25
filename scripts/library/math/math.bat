::::BgetDescription#Macro of specialo math functions such as PI; SIN; COS; ABS; as well as basic geometry.
::::BgetAuthor#Icarus
::::BgetCategory#library








set /a "PI=(35500000/113+5)/10, HALF_PI=(35500000/113/2+5)/10, PIx2=2*PI, PI32=PI+PI_div_2, neg_PI=PI * -1, neg_HALF_PI=HALF_PI *-1"
    set "_SIN=a-a*a/1920*a/312500+a*a/1920*a/15625*a/15625*a/2560000-a*a/1875*a/15360*a/15625*a/15625*a/16000*a/44800000"
    set "SIN(x)=(a=(x * 31416 / 180)%%62832, c=(a>>31|1)*a, a-=(((c-47125)>>31)+1)*((a>>31|1)*62832)  +  (-((c-47125)>>31))*( (((c-15709)>>31)+1)*(-(a>>31|1)*31416+2*a)  ), %_SIN%) / 10000"
    set "COS(x)=(a=(15708 - x * 31416 / 180)%%62832, c=(a>>31|1)*a, a-=(((c-47125)>>31)+1)*((a>>31|1)*62832)  +  (-((c-47125)>>31))*( (((c-15709)>>31)+1)*(-(a>>31|1)*31416+2*a)  ), %_SIN%) / 10000"
    set "_SIN="
    set "Sqrt(N)=( x=(N)/(11*1024)+40, x=((N)/x+x)/2, x=((N)/x+x)/2, x=((N)/x+x)/2, x=((N)/x+x)/2, x=((N)/x+x)/2 )"
    set "Sign(n)=(n>>31)|((-n>>31)&1)"
    set "Abs(x)=(((x)>>31|1)*(x))"
    REM  Max1(x)=  if (x geq y)  then x    else y
    set "Max(x)=( ?=((x-y)>>31)+1, ?*x + ^^^!?*y )"
    set "Max=( ?=(((((t1)>>31|1)*(t1))-(((t2)>>31|1)*(t2)))>>31)+1, ?*(2*(((t1)>>31|1)*(t1))-(((t2)>>31|1)*(t2))-((((t1)>>31|1)*(t1))-(((t2)>>31|1)*(t2)))) + ^^^!?*((((t1)>>31|1)*(t1))-(((t2)>>31|1)*(t2))-((((t1)>>31|1)*(t1))-(((t2)>>31|1)*(t2))*2)) )"
    set "getDistance(x2,x1,y2,y1)=( @=x2-x1, $=y2-y1, ?=(((@>>31|1)*@-(($>>31|1)*$))>>31)+1, ?*(2*(@>>31|1)*@-($>>31|1)*$-((@>>31|1)*@-($>>31|1)*$)) + ^^^!?*((@>>31|1)*@-($>>31|1)*$-((@>>31|1)*@-($>>31|1)*$*2)) )"
    set "percentOf(p)=p=100*x*y/10000"
    set "swap(x,y)=t=x, x=y, y=t"
    set "SQ(x)=x*x"
    set "CUBE(x)=x*x*x"
    set "pmSQ(x)=x+x+x+x"
    set "pmREC(l,w)=l+w+l+w"
    set "pmTRI(a,b,c)=a+b+c"
    set "areaREC(l,w)=l*w"
    set "areaTRI(b,h)=(b*h)/2"
    set "areaTRA(b1,b2,h)=(b1*b2)*h/2"
    set "volBOX(l,w,h)=l*w*h"