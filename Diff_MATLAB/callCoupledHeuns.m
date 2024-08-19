function [xFinal,yFinal] = callCoupledHeuns(callf1x,callf1y,tInitial,xInitial,yInitial,tFinal,deltaT)
t=tInitial:deltaT:tFinal;
n=length(t);
xFinal=zeros(1,n);
yFinal=zeros(1,n);
xFinal(1)=xInitial;
yFinal(1)=yInitial;
for i=2:n
    k1x=callf1x(xFinal(i-1),yFinal(i-1),t(i-1));
    k1y=callf1y(xFinal(i-1),yFinal(i-1),t(i-1));
    k2x=callf1x(xFinal(i-1)+k1x*deltaT,yFinal(i-1)+k1y*deltaT,t(i));
    k2y=callf1y(xFinal(i-1)+k1x*deltaT,yFinal(i-1)+k1y*deltaT,t(i));
    xFinal(i)=xFinal(i-1)+(k1x+k2x)/2*deltaT;
    yFinal(i)=yFinal(i-1)+(k1y+k2y)/2*deltaT;
end

return
end