clear
format long g
%
addpath ../bie; addpath ../fmm; addpath ../files; %addpath ../pcm
%%
%
n     =  2^10;
t     = (0:2*pi/n:2*pi-2*pi/n).';
%
m = 2;
%
zet0  =  exp(-i*t);
zet0p = -i*exp(-i*t);
%
[x,y] = meshgrid([-10:0.1:10]);
z = x+i*y;
z(abs(z)<2.02) = NaN+i*NaN;
[mr,mc] = size(z);
ac = NaN(size(z));
for k=1:mr
    for j=1:mc
        if abs(z(k,j))>=0
            zet1  =  z(k,j)+zet0;
            zet1p =  zet0p;
            zet =[]; zetp =[];
            zet   = [zet0  ; zet1  ];
            zetp  = [zet0p ; zet1p ];
            cappp = ancap(zet,zetp,n);
            [k j cappp]
            ac(k,j) = cappp;
        end
    end
end
%%
figure;
cvc  =  [1,1.6,1.8,1.9,1.94,1.96,1.97,1.98,1.987];
set(groot,'defaultAxesTickLabelInterpreter','latex');  
set(groot,'defaulttextinterpreter','latex');
set(groot,'defaultLegendInterpreter','latex');
%
[cnt1,cnt2] =  contour(x,y,ac,cvc,'b');
clabel(cnt1, 'manual','FontSize',15,'Color','k')
hold on; box on
% 
%
% crv = 2.055.*zet0; crv(n+1)  =  crv(1);
% fill(real(crv),imag(crv),'w')
crv = zet0; crv(n+1)  =  crv(1);
fill(real(crv),imag(crv),'b')
% 
set(gca,'FontSize',15)
set(gca,'LooseInset',get(gca,'TightInset'))
axis equal;
axis([-10 10 -10 10])
xticks([-10:2:10])
yticks([-10:2:10])
set(gcf,'Renderer','zbuffer')
print -depsc -r1000 Fig2disksc
%%