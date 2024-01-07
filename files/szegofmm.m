function y = szegofmm (zet,zetp,n)
% 
% January 26, 2023 by Mohamed Nasser
% 
% 
% PLEASE cite the FMMLIB2D toolbox whenever you use the function fbie.m. 
%
% Acknowledgments:
% I would like to thank Prof. Leslie Greengard and Prof. Zydrunas Gimbutas 
% for making the MATLAB toolbox FMMLIB2D publicly available.
%
% -------------------------------------------------------------------------
% 
Tzet     =  zetp./abs(zetp);  Tzet(zetp==0)=0;
a        = [real(zet.') ; imag(zet.')];
m        =  length(zet)/n-1;
%
rhs      =  1/(2*pi)+zeros(size(zet));
y        =  gmres(@(x)F(x),rhs,[],1e-14,100);
%
%
function y = F(x)
b1       = [abs(zetp).*conj(x)].';
[Ub1]    =  zfmm2dpart(5,(m+1)*n,a,b1,1);
Eb1      = (Ub1.pot).';
%
b2       = [abs(zetp).*Tzet.*x].';
[Ub2]    =  zfmm2dpart(5,(m+1)*n,a,b2,1);
Eb2      = (Ub2.pot).';
%
y        =  x+(1./(n*i)).*(-conj(Tzet).*conj(Eb1)+Eb2);
end
%
end