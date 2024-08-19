function [xFinal,yFinal] = callCoupledRK4(callf1x,callf1y,tInitial,xInitial,yInitial,tFinal,deltaT)

t=tInitial:deltaT:tFinal;
n=length(t);
xFinal=zeros(1,n);
yFinal=zeros(1,n);
xFinal(1)=xInitial;
yFinal(1)=yInitial;
for i=2:n
    k1x=callf1x(xFinal(i-1),yFinal(i-1),t(i-1));
    k1y=callf1y(xFinal(i-1),yFinal(i-1),t(i-1));
    k2x=callf1x(xFinal(i-1)+k1x*deltaT/2,yFinal(i-1)+k1y*deltaT/2,t(i-1)+deltaT/2);
    k2y=callf1y(xFinal(i-1)+k1x*deltaT/2,yFinal(i-1)+k1y*deltaT/2,t(i-1)+deltaT/2);
    k3x=callf1x(xFinal(i-1)+k2x*deltaT/2,yFinal(i-1)+k1y*deltaT/2,t(i-1)+deltaT/2);
    k3y=callf1y(xFinal(i-1)+k2x*deltaT/2,yFinal(i-1)+k1y*deltaT/2,t(i-1)+deltaT/2);
    k4x=callf1x(xFinal(i-1)+k3x*deltaT,yFinal(i-1)+k3y*deltaT,t(i));
    k4y=callf1y(xFinal(i-1)+k3x*deltaT,yFinal(i-1)+k3y*deltaT,t(i));

    xFinal(i)=xFinal(i-1)+(k1x+2*k2x+2*k3x+k4x)/6*deltaT;
    yFinal(i)=yFinal(i-1)+(k1y+2*k2y+2*k3y+k4y)/6*deltaT;
end

return
end