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
tic
%
n     =  2^10;
t     = (0:2*pi/n:2*pi-2*pi/n).';
%
zet1  =  exp(-i.*t);
zet1p = -i*exp(-i.*t);
%
ver2   = [2  4];
cent2  = [3  inf];
dir2   = [-1 0];
[zet2,zet2p]=plgcirarcp(ver2,cent2,dir2,n/2);
ver3   = [4i  2i];
cent3  = [3i  inf];
dir3   = [-1  0];
[zet3,zet3p]=plgcirarcp(ver3,cent3,dir3,n/2);
%
zet   = [zet1  ; zet2  ; zet3  ];
zetp  = [zet1p ; zet2p ; zet3p ];
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
% grid on; grid('minor')
% set(gca, 'XMinorTick','on'); set(gca, 'YMinorTick','on')
% ax=gca; ax.GridAlpha=0.5; ax.MinorGridAlpha=0.5;
set(gca,'FontSize',18)
set(gca,'LooseInset',get(gca,'TightInset'))
axis equal
axis square
xticks([-2:5])
yticks([-2:5])
axis([-2 5 -2 5])
drawnow
print -depsc Figdisk2semidisks
%%
%
%