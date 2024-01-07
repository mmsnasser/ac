function [cap,erri] = ancap(zet,zetp,n)
% 
% 
% 
%
%
%
h    =  2*pi/n;
psi  =  szegofmm(zet,zetp,n);
cap  =  h*sum(real(psi).*abs(zetp));
erri =  abs(sum(h*imag(psi).*abs(zetp)));
%
end