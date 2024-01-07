clear
format long g
%
addpath ../bie; addpath ../fmm; addpath ../files; %addpath ../pcm
%%
%
n     =  2^10;
t     = (0:2*pi/n:2*pi-2*pi/n).';
m     =  100;
%
%
for kk=1:50
    %
    r = []; z=[];ze=[];
r   =  0.2+0.6*rand(m,1);
%
z  = (20*rand(m,m)-10)+i*(20*rand(m,m)-10);
z=z(:);
mm = length(z);
%
for k=1:mm-1
    for j=k+1:mm
        if abs(z(k)-z(j))<1.65
            z(j)=NaN+i*NaN;
        end
        mm = length(z);
    end
end
ze=z(abs(z)>=0);
ze = ze(1:100);
%
zet = []; zetp=[]; zetE = []; zetpE=[]; zetF = []; zetpF=[]; 
for k=1:m
    zet0  =  ze(k)+r(k)*exp(-i*t);
    zet0p = -r(k)*i*exp(-i*t);
    zet=[zet;zet0];
    zetp = [zetp;zet0p];
end
% 
L = randi([1 99]);
for k=1:L
    zetE  = zet(1:L*n,1);
    zetpE = zetp(1:L*n,1);
end
for k=L+1:m
    zetF  = zet(L*n+1:m*n,1);
    zetpF = zetp(L*n+1:m*n,1);
end
%
% 
cap(kk,1) = ancap(zet,zetp,n);
capE(kk,1) = ancap(zetE,zetpE,n);
capF(kk,1) = ancap(zetF,zetpF,n);
%
%%
figure(1);
clf
set(groot,'defaultAxesTickLabelInterpreter','latex');
set(groot,'defaulttextinterpreter','latex');
set(groot,'defaultLegendInterpreter','latex');
hold on; box on
for k=1:L
    crv = zetE(1+(k-1)*n:k*n); crv(n+1)=crv(1);
    plot(real(crv),imag(crv),'b-','LineWidth',1.5)
    fill(real(crv),imag(crv),'b')
end
for k=1:m-L
    crv = zetF(1+(k-1)*n:k*n); crv(n+1)=crv(1);
    plot(real(crv),imag(crv),'r-','LineWidth',1.5)
    fill(real(crv),imag(crv),'r')
end
% grid on; grid('minor')
% set(gca, 'XMinorTick','on'); set(gca, 'YMinorTick','on')
% ax=gca; ax.GridAlpha=0.5; ax.MinorGridAlpha=0.5;
set(gca,'FontSize',18)
set(gca,'LooseInset',get(gca,'TightInset'))
axis equal
drawnow
%
xticks([-12:4:12])
yticks([-12:4:12])
axis([-12 12 -12 12])
% set(gcf,'Renderer','zbuffer')
% print -depsc -r1000 Fig100disksfig
%%

end
%%
rat1 = cap./(capE+capF)
rat2 = cap./sum(r)
%%
[rat1 rat2 ]
kv = [1:length(rat1)]';
%
figure(1);
clf
set(groot,'defaultAxesTickLabelInterpreter','latex');
set(groot,'defaulttextinterpreter','latex');
set(groot,'defaultLegendInterpreter','latex');
hold on; box on
plot(kv,rat1,'-ob','LineWidth',1.5)
% plot(kv,rat2,':dr','LineWidth',1.5)
% legend('$\gamma(E\cup F)/(\gamma(E)+\gamma(F))$','$\gamma(E\cup F)/\sum_{k=1}^mr_k$','Location','northwest')
%
xlabel('$j$')
grid on; grid('minor')
set(gca, 'XMinorTick','on'); set(gca, 'YMinorTick','on')
ax=gca; ax.GridAlpha=0.5; ax.MinorGridAlpha=0.5;
set(gca,'FontSize',18)
set(gca,'LooseInset',get(gca,'TightInset'))
drawnow
%
% xticks([-12:4:12])
% yticks([-12:4:12])
axis([0 50 0 1.2])
set(gcf,'Renderer','zbuffer')
print -depsc -r1000 Fig100disks
%%