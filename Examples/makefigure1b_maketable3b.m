% Example in Fig. 3 & Table 3 (page 361) in: 
% Malik Younsi & Thomas Ransford, Computation of Analytic Capacity and  
% Applications to the Subadditivity Problem, Computational Methods and 
% Function Theory, 13 (2013) 337-382
% 
clear
format long g
%
addpath ../bie; addpath ../fmm; %addpath ../files; %addpath ../pcm
%%
cent = [-3  3  -10i 10i];
rx   =  2;
ry   =  1;
m    =  length(cent);
%
n     =  2^9;
t     = (0:2*pi/n:2*pi-2*pi/n).';
%
for k=1:m
    zet(1+(k-1)*n:k*n,1)  = cent(k)+rx*cos(t)-i*ry*sin(t);
    zetp(1+(k-1)*n:k*n,1) =        -rx*sin(t)-i*ry*cos(t);
end
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
for k=1:m
    crv = zet(1+(k-1)*n:k*n); crv(n+1)=crv(1);
    plot(real(crv),imag(crv),'b-','LineWidth',1.5)
    fill(real(crv),imag(crv),'b')
end
% grid on; grid('minor')
% set(gca, 'XMinorTick','on'); set(gca, 'YMinorTick','on')
% ax=gca; ax.GridAlpha=0.5; ax.MinorGridAlpha=0.5;
set(gca,'FontSize',18)
set(gca,'LooseInset',get(gca,'TightInset'))
axis equal
axis square
xticks([-12:4:12])
yticks([-12:4:12])
axis([-12 12 -12 12])
drawnow
print -depsc Fig4ellipses
%%