% 
clear
format long g
%
addpath ../bie; addpath ../fmm; addpath ../files; 
%%
n     =  2^10;
%
thet = 0.25*pi;
r = 0.25;
Lc   = [0.6  ; 0.6*exp(i*thet)];  Lk = [1 ; 1];  thetv = [0  ;  thet];
%
map = PreImageStrSlit(Lc,Lk,thetv,r,n,1e-14,100);
et  = map.et;
etp = map.etp;
zet  = map.zet;
zetp = map.zetp;
%%
figure(1);
clf
set(groot,'defaultAxesTickLabelInterpreter','latex');
set(groot,'defaulttextinterpreter','latex');
set(groot,'defaultLegendInterpreter','latex');
hold on; box on
for k=1:length(Lc)
    crv = zet(1+(k-1)*n:k*n); crv(n+1)=crv(1);
    plot(real(crv),imag(crv),'b-','LineWidth',1.5)
end
grid on; grid('minor')
set(gca, 'XMinorTick','on'); set(gca, 'YMinorTick','on')
ax=gca; ax.GridAlpha=0.5; ax.MinorGridAlpha=0.5;
set(gca,'FontSize',18)
set(gca,'LooseInset',get(gca,'TightInset'))
axis equal
drawnow
axis([-0.0 1.2 -0.2 1.0])
xticks([0:0.2:1.2])
yticks([-0.2:0.2:1])
print -depsc FigApp2s
%%
figure(2);
clf
set(groot,'defaultAxesTickLabelInterpreter','latex');
set(groot,'defaulttextinterpreter','latex');
set(groot,'defaultLegendInterpreter','latex');
hold on; box on
for k=1:length(Lc)
    crv = et(1+(k-1)*n:k*n); crv(n+1)=crv(1);
    plot(real(crv),imag(crv),'b-','LineWidth',1.5)
end
grid on; grid('minor')
set(gca, 'XMinorTick','on'); set(gca, 'YMinorTick','on')
ax=gca; ax.GridAlpha=0.5; ax.MinorGridAlpha=0.5;
set(gca,'FontSize',18)
set(gca,'LooseInset',get(gca,'TightInset'))
axis equal
drawnow
axis([-0.0 1.2 -0.2 1.0])
xticks([0:0.2:1.2])
yticks([-0.2:0.2:1])
print -depsc FigApp2e
%%

