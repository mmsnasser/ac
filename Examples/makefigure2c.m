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
n     =  3*2^11;
t     = (0:2*pi/n:2*pi-2*pi/n).';
%
epv  = [0.05,0.1:0.05:0.3,0.4:0.1:1,1.2:0.2:3.8,4:0.25:8]';
%
for kk=1:length(epv)
    ep    =  epv(kk);
    %
ver   = [1+i  1-i  -1-i  -1+i];
%
ver1   = (1+ep)*(1+i)+ver;
[zet1,zet1p]=polygonp(ver1,n/length(ver1));
%
ver2   = [2 2-2i -2-2i -2+2i 2i 0+0i];
[zet2,zet2p]=polygonp(ver2,n/length(ver2));
%
zet   = [zet1  ; zet2  ];
zetp  = [zet1p ; zet2p ];
%
tic
cap(kk,1) = ancap(zet,zetp,n);
toc
%
excap = @(h)((h*gamma(1/4)^2)/(4*sqrt(pi^3)));
capE0 = excap(4);
capEj = excap(2);
LB(kk,1) = capE0;
UB(kk,1) = 4*capEj;
%%
figure(1);
clf
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
% grid on; grid('minor')
% set(gca, 'XMinorTick','on'); set(gca, 'YMinorTick','on')
% ax=gca; ax.GridAlpha=0.5; ax.MinorGridAlpha=0.5;
set(gca,'FontSize',18)
set(gca,'LooseInset',get(gca,'TightInset'))
axis equal
drawnow
if ep ==0.25
    xticks([-3:1:3])
    yticks([-3:1:3])
    axis([-3 3 -3 3])
    set(gcf,'Renderer','zbuffer')
    print -depsc -r1000 Fig4sqCase3
end
%
end
%%
[epv LB cap UB]%
%
%
figure;
clf
set(groot,'defaultAxesTickLabelInterpreter','latex');
set(groot,'defaulttextinterpreter','latex');
set(groot,'defaultLegendInterpreter','latex');
hold on; box on
plot(epv,LB,':k','LineWidth',1.5)
plot(epv,UB,'--k','LineWidth',1.5)
plot(epv,cap,'-b','LineWidth',1.5)
grid on; grid('minor')
set(gca, 'XMinorTick','on'); set(gca, 'YMinorTick','on')
ax=gca; ax.GridAlpha=0.5; ax.MinorGridAlpha=0.5;
set(gca,'FontSize',18)
set(gca,'LooseInset',get(gca,'TightInset'))
axis equal
drawnow
%%