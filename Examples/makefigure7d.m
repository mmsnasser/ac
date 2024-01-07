clear
format long g
%
addpath ../bie; addpath ../fmm; addpath ../files; %addpath ../pcm
%%
%
n     =  2^10;
t     = (0:2*pi/n:2*pi-2*pi/n).';
%
m  =  4;
%
cent = 5.*exp(2i*pi*[1:m]/m);
zet0  = cent(1)+exp(-i*t);
zet0p = -i*exp(-i*t);
zet1  =  cent(2)+exp(-i*t);
zet1p = -i*exp(-i*t);
zet2  =  cent(3)+exp(-i*t);
zet2p = -i*exp(-i*t);
zet3  =  cent(4)+exp(-i*t);
zet3p = -i*exp(-i*t);
%
zetE   = [zet0  ; zet1 ; zet2 ; zet3 ];
zetEp  = [zet0p ; zet1p; zet2p; zet3p];
capE  = ancap(zetE,zetEp,n);
%%
[x,y] = meshgrid([-10:0.1:10]);
z = x+i*y;
for k=1:m
    z(abs(z-cent(k))<2.02) = NaN+i*NaN;
end
[mr,mc] = size(z);
ac = NaN(size(z));
for k=1:mr
    for j=1:mc
        if abs(z(k,j))>=0
            zet4  =  z(k,j)+exp(-i*t);
            zet4p =  -i*exp(-i*t);
            zet =[]; zetp =[];
            zet   = [zet0  ; zet1  ; zet2  ; zet3  ; zet4  ];
            zetp  = [zet0p ; zet1p ; zet2p ; zet3p ; zet4p ];
            cappp = ancap(zet,zetp,n);
            [k j cappp]
            ac(k,j) = cappp;
        end
    end
end
%%
figure;
cvc  =  [4.12,4.184,4.25,4.32,4.38,4.43,4.48,4.52,4.55];
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
crv = zet1; crv(n+1)  =  crv(1);
fill(real(crv),imag(crv),'b')
crv = zet2; crv(n+1)  =  crv(1);
fill(real(crv),imag(crv),'b')
crv = zet3; crv(n+1)  =  crv(1);
fill(real(crv),imag(crv),'b')
% 
set(gca,'FontSize',15)
set(gca,'LooseInset',get(gca,'TightInset'))
axis equal;
axis([-10 10 -10 10])
xticks([-10:2:10])
yticks([-10:2:10])
set(gcf,'Renderer','zbuffer')
print -depsc -r1000 Fig5disksc
%%