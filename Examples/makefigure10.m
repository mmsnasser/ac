% 
clear
format long g
%
addpath ../bie; addpath ../fmm; addpath ../files; 
%%
n     =  2^10;
%
epv = [0.01,0.025,0.05,0.1:0.05:0.9,0.95,0.975,0.99]';
%
for kk = 1:length(epv)
    ep = epv(kk);
    Lc   = [1  ; i ; -1 ; -i];  Lk = [2-2*ep ; 2-2*ep ; 2-2*ep ; 2-2*ep ];  thetv = [pi/2  ;  0  ; pi/2  ;  0 ];
    %
    r   = ep;
    map = PreImageStrSlit(Lc,Lk,thetv,r,n,1e-14,100);
    et  = map.et;
    etp = map.etp;
    zet  = map.zet;
    zetp = map.zetp;
    %
    cap(kk,1)  = ancap(et,etp,n);
%%
figure(1);
clf
set(groot,'defaultAxesTickLabelInterpreter','latex');
set(groot,'defaulttextinterpreter','latex');
set(groot,'defaultLegendInterpreter','latex');
hold on; box on
% for k=1:length(Lc)
%     crv = et(1+(k-1)*n:k*n); crv(n+1)=crv(1);
%     plot(real(crv),imag(crv),'b-','LineWidth',1.5)
% end
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
axis([-1.1 1.1 -1.1 1.1])
if ep==0.1
    print -depsc Fig4RecSqufig
end
%%
end
%%
excap = @(h)((h*gamma(1/4)^2)/(4*sqrt(pi^3)));
capsq = excap(2)
%%
UB = 2-2.*epv;
[epv cap UB]
%
figure;
clf
set(groot,'defaultAxesTickLabelInterpreter','latex');
set(groot,'defaulttextinterpreter','latex');
set(groot,'defaultLegendInterpreter','latex');
hold on; box on
plot(epv,cap,'-b','LineWidth',1.5)
plot(epv,UB,'--k','LineWidth',1.5)
plot(0,capsq,'or','MarkerfaceColor','r','MarkerSize',4)
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
% axis([0 1 0.2 0.6])
print -depsc Fig4RecSqu
%%
%%
