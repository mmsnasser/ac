% 
clear
format long g
%
addpath ../bie; addpath ../fmm; addpath ../files; 
%%
n     =  2^10;
%
for k=1:10
    % 
    q   = 1/3;
    m   = 2^k;
    % Centers of disks:
    w=[]; Lc=[];Lk=[];thet=[];
    w = 1;
    for p=1:k
        w  = [q.*w , q.*w+2-2*q];
    end
    Lc   = w.'-1; %centers of the slits
    Lk   = 2/(3^k)*ones(size(Lc));
    thet = zeros(size(Lc));
    %
    map = PreImageStrSlit(Lc,Lk,thet,1,n,1e-13,100);
    et  = map.et;
    etp = map.etp;
    zet  = map.zet;
    zetp = map.zetp;
    alpha = Lc(2);
    %
%%
figure(1);
clf
set(groot,'defaultAxesTickLabelInterpreter','latex');
set(groot,'defaulttextinterpreter','latex');
set(groot,'defaultLegendInterpreter','latex');
hold on; box on
for j=1:length(Lc)
    crv = et(1+(j-1)*n:j*n); crv(n+1)=crv(1);
    plot(real(crv),imag(crv),'b-','LineWidth',1.5)
end
for j=1:length(Lc)
    crv = zet(1+(j-1)*n:j*n); crv(n+1)=crv(1);
    plot(real(crv),imag(crv),'r-','LineWidth',1.5)
end
plot(real(alpha),imag(alpha),'pb')
grid on; grid('minor')
set(gca, 'XMinorTick','on'); set(gca, 'YMinorTick','on')
ax=gca; ax.GridAlpha=0.5; ax.MinorGridAlpha=0.5;
set(gca,'FontSize',18)
set(gca,'LooseInset',get(gca,'TightInset'))
axis equal
drawnow
%%
capn(k,1)  = ancap(et,etp,n);
excap(k,1) = 0.5*(2/3)^k;
%
end
%%
[capn excap abs(capn-excap)./excap]
%%
