% Example in Fig. 3 & Table 3 (page 361) in: 
% Malik Younsi & Thomas Ransford, Computation of Analytic Capacity and  
% Applications to the Subadditivity Problem, Computational Methods and 
% Function Theory, 13 (2013) 337-382
% 
clear;clc
%
addpath ../bie; addpath ../fmm; addpath ../files; %addpath ../pcm
%%
%
n     =  2^15;
t     = (0:2*pi/n:2*pi-2*pi/n).';
%
ver    = [1  -i  -1   i];
[zet,zetp]=polygonp(ver,n/4);
%
tic
cap = ancap(zet,zetp,n);
tim = toc;
%
excap = (gamma(1/4)^2)/(2*sqrt(2*pi^3));
%
format long 
cap 
format short e
abs(excap-cap)/excap 
format short g
tim



%%
figure;
set(groot,'defaultAxesTickLabelInterpreter','latex');
set(groot,'defaulttextinterpreter','latex');
set(groot,'defaultLegendInterpreter','latex');
hold on; box on
k = 1; crv = zet(1+(k-1)*n:k*n); crv(n+1)=crv(1);
plot(real(crv),imag(crv),'b-','LineWidth',1.5)
fill(real(crv),imag(crv),'b')
grid on; grid('minor')
set(gca, 'XMinorTick','on'); set(gca, 'YMinorTick','on')
ax=gca; ax.GridAlpha=0.5; ax.MinorGridAlpha=0.5;
set(gca,'FontSize',18)
set(gca,'LooseInset',get(gca,'TightInset'))
axis equal
drawnow
%%
%
%
