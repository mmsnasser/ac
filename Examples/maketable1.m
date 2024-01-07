% Example in Fig. 1 & Table 1 (page 358) in: 
% Malik Younsi & Thomas Ransford, Computation of Analytic Capacity and  
% Applications to the Subadditivity Problem, Computational Methods and 
% Function Theory, 13 (2013) 337-382
% and in page 376.
% 
clear
%
addpath ../bie; addpath ../fmm; 
%%
n     =  2^9;
h     =  2*pi/n;
t     = (0:h:2*pi-h).';
%
cv    = [0.5 ; 1 ; 2 ; 3];
rv    = [0.1 ; 0.5 ; 1 ; 2];
%
for kk = 1:length(rv)
    for jj=kk:length(cv)
        c = cv(jj);
        r = rv(kk);
        %
        %
        zet1  =  c+r.*exp(-i.*t);
        zet1p = -i*r*exp(-i.*t);
        %
        zet2  = -c+r*exp(-i.*t);
        zet2p = -i*r*exp(-i.*t);
        %
        zet =[]; zetp =[];
        zet   = [zet1  ; zet2  ];
        zetp  = [zet1p ; zet2p ];
        %
        %
        cap(kk,jj) = ancap(zet,zetp,n);
        %
        p = c/r; q = (p-sqrt(p^2-1))/(p+sqrt(p^2-1));
        excap(kk,jj) = (r/2)*(1/sqrt(q)-sqrt(q))*theta(2,0,q,1e-16)^2;        
        %
    end
end
%
reror = abs(excap-cap)./excap;
%
format long 
cap
format short e
reror