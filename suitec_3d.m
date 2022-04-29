function [x_deltak,y_deltak,z_deltak,xx,yy,zz]=suitec_3d(a,b,x0,y0,z0,delta,n,m);
%[z_deltak,xx,xxx]=suitec40(a,x0,delta,n);
%%%%%%%%%%%%%%%%%%%
%delta=0.1
%a=4.0;
%b=2.0;
%x0=0.11;
%y0=0.21;
%z0=0.31;
%%%%%%%%%%%%%%%%%%%%
%axis([amin amax xmin xmax])
x=x0;
y=y0;
z=z0;
x1=x0+delta;
y1=y0+delta;
z1=z0+delta;
%xx1=x0+delta;
%yy1=y0+delta;
%zz1=z0+delta;
%%%%%%%%%%%%%%%%%%%%%%%
for i=1:n;
    xx(i)=x;
    xxx(i)=x1;
    yy(i)=y;
    yyy(i)=y1;
    zz(i)=z;
    zzz(i)=z1;
    x_deltak(i)=x1-x;
    y_deltak(i)=y1-y;
    z_deltak(i)=z1-z;
    [x1,y1,z1]=rec3(x+delta,y+delta,z+delta,a,b);
    %[xx1,yy1,zz1]=rec3(xx1,yy1,zz1,a,b);
    [x,y,z]=rec3(x,y,z,a,b);
end
%m
%fid = fopen('test.txt','w');
%fprintf(fid,'%f\n',xx);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [r1,r2,r3] = rec0(x,y,z,a,b);
 r1 = a*x*(1-x);
 r2 = a*x*(1-x);
 r3 = a*x*(1-x);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%3-D,TTL_2^C
function [r1,r2,r3] = rec1(x,y,z,a,b);
b=a;
 r1 = mod(1.0-a*abs(x)+b*abs(x)*(1.0-y),1);
 r2 = mod(1.0-a*abs(y)+b*abs(y)*(1.0-z),1);
 r3 = mod(1.0-a*abs(z)+b*abs(z)*(1.0-x),1);
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%3-D,TTL_2^C
function [r1,r2,r3] = rec5(x,y,z,a,b);
b=a;
 r1 = mod(1.0-a*abs(x)+b*abs(y)*(1.0-z),1);
 r2 = mod(1.0-a*abs(y)+b*abs(z)*(1.0-x),1);
 r3 = mod(1.0-a*abs(z)+b*abs(x)*(1.0-y),1);
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%3-D,TTL_2^C
function [r1,r2,r3] = rec3(x,y,z,a,b);
b=a;
 r1 = mod(abs(1.0-a*x+a*y*(1.0-z)),1);
 r2 = mod(abs(1.0-a*y+a*z*(1.0-x)),1);
 r3 = mod(abs(1.0-a*z+a*x*(1.0-y)),1);