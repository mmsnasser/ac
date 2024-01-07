% Example in Fig. 3 & Table 3 (page 361) in: 
% Malik Younsi & Thomas Ransford, Computation of Analytic Capacity and  
% Applications to the Subadditivity Problem, Computational Methods and 
% Function Theory, 13 (2013) 337-382
% 
clear
format long g
%
addpath ../bie; addpath ../fmm; addpath ../files; %addpath ../pcm
%%
%
n     =  3*2^8;
t     = (0:2*pi/n:2*pi-2*pi/n).';
%
ver1   = [1  -1  -1+i   1+i];
[zet1,zet1p]=polygonp(ver1,n/4);
ver2   = [5  4-i  3   4+i];
[zet2,zet2p]=polygonp(ver2,n/4);
ver3   = [-3+4i -4+3i -5+4i -4+5i];
[zet3,zet3p]=polygonp(ver3,n/4);
ver4   = [0.5+4i -0.5+4i  i*(4+sqrt(3)/2)];
[zet4,zet4p]=polygonp(ver4,n/3);
%
zet   = [zet1  ; zet2  ; zet3  ; zet4  ];
zetp  = [zet1p ; zet2p ; zet3p ; zet4p ];
%
tic
cap = ancap(zet,zetp,n)
toc
%

%%
figure;
set(groot,'defaultAxesTickLabelInterpreter','latex');
set(groot,'defaulttextinterpreter','latex');
set(groot,'defaultLegendInterpreter','latex');
hold on; box on
k = 1; crv = zet(1+(k-1)*n:k*n); crv(n+1)=crv(1);
plot(real(crv),imag(crv),'b-','LineWidth',1.5)
fill(real(crv),imag(crv),'b')
k = 2; crv = zet(1+(k-1)*n:k*n); crv(n+1)=crv(1);
plot(real(crv),imag(crv),'b-','LineWidth',1.5)
fill(real(crv),imag(crv),'b')
k = 3; crv = zet(1+(k-1)*n:k*n); crv(n+1)=crv(1);
plot(real(crv),imag(crv),'b-','LineWidth',1.5)
fill(real(crv),imag(crv),'b')
k = 4; crv = zet(1+(k-1)*n:k*n); crv(n+1)=crv(1);
plot(real(crv),imag(crv),'b-','LineWidth',1.5)
fill(real(crv),imag(crv),'b')
% grid on; grid('minor')
% set(gca, 'XMinorTick','on'); set(gca, 'YMinorTick','on')
% ax=gca; ax.GridAlpha=0.5; ax.MinorGridAlpha=0.5;
set(gca,'FontSize',18)
set(gca,'LooseInset',get(gca,'TightInset'))
axis equal
axis square
xticks([-6:2:6])
yticks([-4:2:8])
axis([-6 6 -4 8])
drawnow
print -depsc Fig4polygons
%%
%
%
