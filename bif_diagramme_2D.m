function [B]=bif_diagramme_2D(amin,amax,x0,y0,z0);
%%%%%%%%%%%%%%%%%%%%
xmin=0.0;
xmax=1.0;
ymin=0.0;
ymax=1.0;
zmin=0.0;
zmax=1.0;
b=6.0
%%%%%%%%%%%%%%%%%
npamax=600;
ktrans=1000;
knpts=200;
ha=(amax-amin)/npamax;
%%%%%%%%%%%%%%
%%x0=0.11;
%%y0=0.21;
%%z0=0.31;
%%%%%%%%%%%%%%%%%%%
m=0
br=0;
%%%%%%%%%%%%%%%%%
for i=0:npamax;
    a=amin+i*ha;
    xa=x0;
    ya=y0;
    za=z0;
    for k = 1:ktrans;
        if (norm([xa ya za])>10e5) %2.0)
            br=1;
            break
        end
        br=2;
        [xa,ya,za]=rec5(xa,ya,za,a,b);
        %xa=x;
     end
    if (br == 2) 
        for k=1:knpts;
            if (xa<=xmax) & (xa>=xmin) & (ya<=ymax) & (ya>=ymin) & (za<=zmax) & (za>=zmin)  
                m=m++1;
                B(m,1)=a;
                B(m,2)=xa;
                B(m,3)=ya;
                B(m,4)=za;
                [xa,ya,za]=rec5(xa,ya,za,a,b);
                %xa=x;
            end
        end
    end
end
%%%%%%%%%%%%%%%%%%
%%figure(1)
%%hold on
%%axis square
%%subplot(2,1,1)
%%hh=plot(B(:,1),B(:,4),'.');
%%set(hh,'MarkerSize',6)
%%title('Subplot 1')
%%%%%%%%%%
%%subplot(2,1,2)       % add second plot in 2 x 1 grid
%%hh=plot(B(:,1),B(:,4),'.');
%%set(hh,'MarkerSize',6)
%%title('Subplot 2')
%%%%%%%%%%%%%%%%%%%%T1%%%%%%%%%%%%%%%%%%%%%%%%%
function d = rec1(x,a);
 d = a*x*(1-x);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%3-D,TTL_2^C
function [r1,r2,r3] = rec(x,y,z,a,b);
b=a;
 r1 = mod(1.0-a*abs(x)+b*abs(x)*(1.0-y),1);
 r2 = mod(1.0-a*abs(y)+b*abs(y)*(1.0-z),1);
 r3 = mod(1.0-a*abs(z)+b*abs(z)*(1.0-x),1);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%3-D,TTL_2^C
function [r1,r2,r3] = rec2(x,y,z,a,b);
b=a;
 r1 = mod(1.0-a*abs(x)+a*abs(y)*(1.0-z),1);
 r2 = mod(1.0-a*abs(y)+a*abs(z)*(1.0-x),1);
 r3 = mod(1.0-a*abs(z)+a*abs(x)*(1.0-y),1);
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%3-D,TTL_2^C
function [r1,r2,r3] = rec4(x,y,z,a,b);
b=a;
 r1 = mod(abs(1.0-a*x+a*y*(1.0-z)),1);
 r2 = mod(abs(1.0-a*y+a*z*(1.0-x)),1);
 r3 = mod(abs(1.0-a*z+a*x*(1.0-y)),1);
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%3-D,TTL_2^C
function [r1,r2,r3] = rec5(x,y,z,a,b);
b=a;
 r1 = mod(abs(1.0-a*abs(x))+a*y*(1.0-z),1);
 r2 = mod(abs(1.0-a*abs(y))+a*z*(1.0-x),1);
 r3 = mod(abs(1.0-a*abs(z))+a*x*(1.0-y),1);
 %%%%%%%%%%%%%%%%%%