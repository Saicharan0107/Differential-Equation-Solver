function [xFinal] = callImplicit(callgx,tInitial,xInitial,tFinal,deltaT)
%x_i+1=x_i+k*t
t=tInitial:deltaT:tFinal;
n=length(t);
xFinal=zeros(1,n);
xFinal(1)=xInitial;
for i=2:n
    xFinal(i)=callgx(xFinal(i-1),t(i-1),deltaT);
end
return 
end