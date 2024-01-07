clear
format long g
%
addpath ../bie; addpath ../fmm; addpath ../files; %addpath ../pcm
%%
%
n     =  2^11;
t     = (0:2*pi/n:2*pi-2*pi/n).';
%
zet0  =  exp(-i*t);
zet0p = -i*exp(-i*t);
%
epv  = [0.05,0.1:0.05:0.3,0.4:0.1:1,1.2:0.2:3.8,4:0.25:10]';
%
for kk=1:length(epv)
    ep    =  epv(kk);
    %
%
zet1  =  (1+ep)*(1+i)+zet0;
zet1p =  zet0p;
%
zet2  =  1.05*(-1+i)+zet0;
zet2p =  zet0p;
%
zet3  =  1.05*(1-i)+zet0;
zet3p =  zet0p;
%
zet4  =  1.05*(-1-i)+zet0;
zet4p =  zet0p;
%
zet   = [zet1  ; zet2  ; zet3  ; zet4  ];
zetp  = [zet1p ; zet2p ; zet3p ; zet4p ];
%
tic
cap(kk,1)  = ancap(zet ,zetp ,n);
toc
%
UB(kk,1) = 4*1;
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
drawnow
if ep ==0.7
    xticks([-3:1:3])
    yticks([-3:1:3])
    axis([-3 3 -3 3])
    set(gcf,'Renderer','zbuffer')
    print -depsc -r1000 Fig4cirCase3
end
%
end
%%
[epv cap UB]%
%
%
figure;
clf
set(groot,'defaultAxesTickLabelInterpreter','latex');
set(groot,'defaulttextinterpreter','latex');
set(groot,'defaultLegendInterpreter','latex');
hold on; box on
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