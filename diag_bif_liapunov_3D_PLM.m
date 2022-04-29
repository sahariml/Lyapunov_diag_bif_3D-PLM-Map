%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%Code for lyapunov exponent and bifurcation diagram for 3D-map 
%%%%%Sahari, Mohamed Lamine, and Ibtissem Boukemara. "A pseudo-random numbers 
%%%%%%generator based on a novel 3D chaotic map with an application to color image encryption.
%%%%%" Nonlinear Dynamics 94.1 (2018): 723-744.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function diag_bif_liapunov_3D_PLM(ii)
%%%%%%%%%%%%%%%%%%%
warning('off')
%%%%%%%%%%%%%%%%%%%
b=2.0;
%%%%%%%%%%%%%%%%%%%
x0=0.411
y0=0.321
z0=0.631
%%%%%%%%%%%%%%%%%%%
n=100;
m=6;
delta=0.000000001;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
amin=0.0;
amax=20.0;
nmax=200;
ha=(amax-amin)/nmax;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for ia=0:nmax;
    a=amin+ia*ha;
    lambda_ex_x=0;
    lambda_ex_y=0;
    lambda_ex_z=0;
    [x_deltak,y_deltak,z_deltak,xx,yy,zz]=suitec_3d(a,b,x0,y0,z0,delta,n,m);
    for i=1:n;
        lambda_ex_x=lambda_ex_x+log(abs(x_deltak(i))/delta);
        lambda_ex_y=lambda_ex_y+log(abs(y_deltak(i))/delta);
        lambda_ex_z=lambda_ex_z+log(abs(z_deltak(i))/delta);
    end
    aa(ia+1)=a;
    lambda_ex_x_k(ia+1)=lambda_ex_x/n;
    lambda_ex_y_k(ia+1)=lambda_ex_y/n;
    lambda_ex_z_k(ia+1)=lambda_ex_z/n;    
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[B]=bif_diagramme_2D(amin,amax,x0,y0,z0);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
ymin=min(lambda_ex_x_k(:));
ymax=max(lambda_ex_x_k(:));
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
fontsz=16
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if (ii==1)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure(1)
hold on
%%%%%%%%%%%%%%%%%%%%%%%%%%%%
ymin=min(lambda_ex_x_k(:));
ymax=max(lambda_ex_x_k(:));
%axis([amin amax ymin ymax]);
%%%%%%%%%%%%%%%%%%%%%%%%%%%
subplot(2,1,1)
axis([amin amax 0 1]);
hh=plot(B(:,1),B(:,2),'.');
set(hh,'MarkerSize',6)
xlabel('$\bf c$','Interpreter','latex','FontSize',fontsz)
ylabel('$\bf x$','Interpreter','latex','FontSize',fontsz)
%title('$x$-Bifurcation diagram','Interpreter','latex')
%%%%%%%%%%
subplot(2,1,2)
axis([amin amax ymin ymax])
hh=plot(aa(:),lambda_ex_x_k(:),'-');
set(hh,'linewidth',2,'Color','black')
line([amin amax],[0 0],'linewidth',2,'Color','red');
%line([amin amax],[2.7 2.7],'linewidth',2,'Color','red');
%title('x-Lyapunov exponent')
xlabel('$\bf c$','Interpreter','latex','FontSize',fontsz)
ylabel('$\bf \lambda_x$','Interpreter','latex','FontSize',fontsz)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure(2)
axis([amin amax 0 1]);
hh=plot(B(:,1),B(:,2),'.');
set(hh,'MarkerSize',6)
xlabel('$\bf c$','Interpreter','latex','FontSize',fontsz)
ylabel('$\bf x$','Interpreter','latex','FontSize',fontsz)
%title('$x$-Bifurcation diagram','Interpreter','latex')
%%%%%%%%%%
figure(3)
axis([amin amax ymin ymax])
hh=plot(aa(:),lambda_ex_x_k(:),'-');
set(hh,'linewidth',2,'Color','black')
line([amin amax],[0 0],'linewidth',2,'Color','red');
%line([amin amax],[2.7 2.7],'linewidth',2,'Color','red');
%title('x-Lyapunov exponent')
xlabel('$\bf c$','Interpreter','latex','FontSize',fontsz)
ylabel('$\bf \lambda_x$','Interpreter','latex','FontSize',fontsz)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%
end
%%%%%%%%%%%%%%%%%%%%%%%%%%
if (ii==2)
figure(1)
%hold on
ymin=min(lambda_ex_y_k(:));
ymax=max(lambda_ex_y_k(:));
%axis([amin amax ymin ymax]);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%axis square
subplot(2,1,1)
%axis([amin amax ymin ymax])
hh=plot(B(:,1),B(:,3),'.');
set(hh,'MarkerSize',6)
xlabel('$\bf c$','Interpreter','latex','FontSize',fontsz)
ylabel('$\bf y$','Interpreter','latex','FontSize',fontsz)
%title('$z$-Bifurcation diagram','Interpreter','latex')
%%%%%%%%%%
subplot(2,1,2)
%axis([amin amax ymin ymax])
hh=plot(aa(:),lambda_ex_y_k(:),'-');
set(hh,'linewidth',2,'Color','black')
line([amin amax],[0 0],'linewidth',2,'Color','red');
%title('y-Lyapunov exponent')
xlabel('$\bf c$','Interpreter','latex','FontSize',fontsz)
ylabel('$\bf \lambda_y$','Interpreter','latex','FontSize',fontsz)
%%%%%%
figure(2)
ymin=min(lambda_ex_y_k(:));
ymax=max(lambda_ex_y_k(:));
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
hh=plot(B(:,1),B(:,3),'.');
set(hh,'MarkerSize',6)
xlabel('$\bf c$','Interpreter','latex','FontSize',fontsz)
ylabel('$\bf y$','Interpreter','latex','FontSize',fontsz)
%title('$z$-Bifurcation diagram','Interpreter','latex')
%%%%%%%%%%
figure(3)
hh=plot(aa(:),lambda_ex_y_k(:),'-');
set(hh,'linewidth',2,'Color','black')
line([amin amax],[0 0],'linewidth',2,'Color','red');
%title('y-Lyapunov exponent')
xlabel('$\bf c$','Interpreter','latex','FontSize',fontsz)
ylabel('$\bf \lambda_y$','Interpreter','latex','FontSize',fontsz)
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if (ii==3)
figure(1)
%hold on
ymin=min(lambda_ex_z_k(:));
ymax=max(lambda_ex_z_k(:));
%axis([amin amax ymin ymax]);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%axis square
subplot(2,1,1)
%axis([amin amax ymin ymax])
hh=plot(B(:,1),B(:,4),'.');
set(hh,'MarkerSize',6)
xlabel('$\bf c$','Interpreter','latex','FontSize',fontsz)
ylabel('$\bf z$','Interpreter','latex','FontSize',fontsz)
%title('z-Bifurcation diagram')
%%%%%%%%%%
subplot(2,1,2)
%axis([amin amax ymin ymax])
hh=plot(aa(:),lambda_ex_y_k(:),'-');
set(hh,'linewidth',2,'Color','black')
line([amin amax],[0 0],'linewidth',2,'Color','red');
%title('z-Lyapunov exponent')
xlabel('$\bf c$','Interpreter','latex','FontSize',fontsz)
ylabel('$\bf \lambda_z$','Interpreter','latex','FontSize',fontsz)
%%%%%%%%%%%%%%%
figure(2)
ymin=min(lambda_ex_z_k(:));
ymax=max(lambda_ex_z_k(:));
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
hh=plot(B(:,1),B(:,4),'.');
set(hh,'MarkerSize',6)
xlabel('$\bf c$','Interpreter','latex','FontSize',fontsz)
ylabel('$\bf z$','Interpreter','latex','FontSize',fontsz)
%title('z-Bifurcation diagram')
%%%%%%%%%%
figure(3)
hh=plot(aa(:),lambda_ex_y_k(:),'-');
set(hh,'linewidth',2,'Color','black')
line([amin amax],[0 0],'linewidth',2,'Color','red');
%title('z-Lyapunov exponent')
xlabel('$\bf c$','Interpreter','latex','FontSize',fontsz)
ylabel('$\bf \lambda_z$','Interpreter','latex','FontSize',fontsz)
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%