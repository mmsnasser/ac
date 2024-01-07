% 
clear
format long g
%
addpath ../bie; addpath ../fmm; addpath ../files; 
%%
n     =  2^10;
%
thetcv = [0.01,0.025,0.05,0.075,0.1,0.15:0.05:1]';

%
for kk = 1:length(thetcv)
    thet = thetcv(kk)*pi;
    r = thetcv(kk);
    Lc   = [0.6  ; 0.6*exp(i*thet)];  Lk = [1 ; 1];  thetv = [0  ;  thet];
    %
    map = PreImageStrSlit(Lc,Lk,thetv,r,n,1e-14,100);
    et  = map.et;
    etp = map.etp;
    zet  = map.zet;
    zetp = map.zetp;
    %
    cap(kk,1)  = ancap(et,etp,n);
%
figure(1);
clf
set(groot,'defaultAxesTickLabelInterpreter','latex');
set(groot,'defaulttextinterpreter','latex');
set(groot,'defaultLegendInterpreter','latex');
hold on; box on
for k=1:length(Lc)
    crv = et(1+(k-1)*n:k*n); crv(n+1)=crv(1);
    plot(real(crv),imag(crv),'b-','LineWidth',1.5)
end
for k=1:length(Lc)
    crv = zet(1+(k-1)*n:k*n); crv(n+1)=crv(1);
    plot(real(crv),imag(crv),'r-','LineWidth',1.5)
end
grid on; grid('minor')
set(gca, 'XMinorTick','on'); set(gca, 'YMinorTick','on')
ax=gca; ax.GridAlpha=0.5; ax.MinorGridAlpha=0.5;
set(gca,'FontSize',18)
set(gca,'LooseInset',get(gca,'TightInset'))
axis equal
drawnow
%
end
%%
LB = 0.25+zeros(size(cap));
UB = 0.5+zeros(size(cap));
[thetcv LB cap UB]
%
figure;
clf
set(groot,'defaultAxesTickLabelInterpreter','latex');
set(groot,'defaulttextinterpreter','latex');
set(groot,'defaultLegendInterpreter','latex');
hold on; box on
plot(thetcv,cap,'-b','LineWidth',1.5)
plot(thetcv,LB,':k','LineWidth',1.5)
plot(thetcv,UB,'--k','LineWidth',1.5)
grid on; grid('minor')
set(gca, 'XMinorTick','on'); set(gca, 'YMinorTick','on')
ax=gca; ax.GridAlpha=0.5; ax.MinorGridAlpha=0.5;
set(gca,'FontSize',18)
set(gca,'LooseInset',get(gca,'TightInset'))
% axis equal
xlabel('$\varepsilon$')
ylabel('$\tilde\gamma(E_\varepsilon)$')
% legend('Case I','Case II','Case III','Location','north')
% My_LGD = legend;
% My_LGD.NumColumns = 3;
% xticks([-3:1:3])
% yticks([-3:1:3])
axis([0 1 0.2 0.6])
print -depsc FigFlap
%%
%%
