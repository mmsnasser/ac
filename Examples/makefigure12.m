% 
clear
format long g
%
addpath ../bie; addpath ../fmm; addpath ../files; 
%%
n     =  2^10;
%
ep = 0.2;
Lc   = [1  ; i ; -1 ; -i];  Lk = [2-2*ep ; 2-2*ep ; 2-2*ep ; 2-2*ep ];  thetv = [pi/2  ;  0  ; pi/2  ;  0 ];
%
r   = 1;
map = PreImageStrSlit(Lc,Lk,thetv,r,n,1e-14,100);
et  = map.et;
etp = map.etp;
zet  = map.zet;
zetp = map.zetp;
%
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
axis([-1.5 1.5 -1.5 1.5])
xticks([-1.5:0.5:1.5])
yticks([-1.5:0.5:1.5])
print -depsc FigApp4s
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
axis([-1.5 1.5 -1.5 1.5])
xticks([-1.5:0.5:1.5])
yticks([-1.5:0.5:1.5])
print -depsc FigApp4c
%%
