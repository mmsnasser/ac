% Example in Fig. 2 & Table 2 (page 360) in: 
% Malik Younsi & Thomas Ransford, Computation of Analytic Capacity and  
% Applications to the Subadditivity Problem, Computational Methods and 
% Function Theory, 13 (2013) 337-382
% 
clear
format long g
%
addpath ../bie; addpath ../fmm; 
%%
cent = [-9 -8  1  2  3  5  7  8  8-i  2+i  4+i  6+i  7+i  1+2i  2+2i  3+2i...
         5+2i  6+2i  7+2i  2+3i  4+3i  8+3i  1+4i  3+4i  5+4i];
%
rad  =  0.4;
m    =  length(cent);
%
n     =  2^9;
t     = (0:2*pi/n:2*pi-2*pi/n).';
%
for k=1:m
    zet(1+(k-1)*n:k*n,1)  = cent(k)+rad*exp(-i.*t);
    zetp(1+(k-1)*n:k*n,1) =      -i*rad*exp(-i.*t);
end
%
tic
cap = ancap(zet,zetp,n)
toc
%
%
%%
figure;
set(groot,'defaultAxesTickLabelInterpreter','latex');
set(groot,'defaulttextinterpreter','latex');
set(groot,'defaultLegendInterpreter','latex');
hold on; box on
for k=1:m
    crv = zet(1+(k-1)*n:k*n); crv(n+1)=crv(1);
    plot(real(crv),imag(crv),'b-','LineWidth',1.5)
    fill(real(crv),imag(crv),'b')
end
% grid on; grid('minor')
% set(gca, 'XMinorTick','on'); set(gca, 'YMinorTick','on')
% ax=gca; ax.GridAlpha=0.5; ax.MinorGridAlpha=0.5;
set(gca,'FontSize',18)
set(gca,'LooseInset',get(gca,'TightInset'))
axis equal
axis square
xticks([-10:4:10])
yticks([-10:4:10])
axis([-10 10 -10 10])
drawnow
print -depsc Fig25disks
%%