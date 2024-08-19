function [xFinal,yFinal] = callCoupledEuler(callf1x,callf1y,tInitial,xInitial,yInitial,tFinal,deltaT)
t=tInitial:deltaT:tFinal;
n=length(t);
xFinal=zeros(1,n);
yFinal=zeros(1,n);
xFinal(1)=xInitial;
yFinal(1)=yInitial;
for i=2:n
    xFinal(i)=xFinal(i-1)+callf1x(xFinal(i-1),yFinal(i-1),t(i-1))*deltaT;
    yFinal(i)=yFinal(i-1)+callf1y(xFinal(i-1),yFinal(i-1),t(i-1))*deltaT;
end

return
end