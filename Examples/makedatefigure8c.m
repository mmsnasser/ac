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
rv   = [1.5:0.25:20]';
%
for kk=1:length(rv)
    r = rv(kk);
    cent = r.*[1 i -1 -i];
    zet1  = cent(1)+exp(-i*t);
    zet1p = -i*exp(-i*t);
    zet2  =  cent(2)+exp(-i*t);
    zet2p = -i*exp(-i*t);
    zet3  =  cent(3)+exp(-i*t);
    zet3p = -i*exp(-i*t);
    zet4  =  cent(4)+exp(-i*t);
    zet4p = -i*exp(-i*t);
    %
    zet   = [zet1  ; zet2 ; zet3 ; zet4 ];
    zetp  = [zet1p ; zet2p; zet3p; zet4p];
    cap(kk,1)  = ancap(zet,zetp,n);
end
%%
[rv cap]
%
figure;
set(groot,'defaultAxesTickLabelInterpreter','latex');  
set(groot,'defaulttextinterpreter','latex');
set(groot,'defaultLegendInterpreter','latex');
%
plot(rv,cap./4,'-b','linewidth',1.5);
% 
set(gca,'FontSize',15)
set(gca,'LooseInset',get(gca,'TightInset'))
% axis([1 10 -10 10])
% xticks([-10:2:10])
% yticks([-10:2:10])
%%