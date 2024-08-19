function [rk4]=callRK(y1,yinitial,tinitial,deltat,tFinal)
t=tinitial:deltat:tFinal;
rk4=zeros(1,length(t));
rk4(1)=yinitial;
for i=2:length(rk4)
    k1=y1(t(i-1),rk4(i-1))*deltat;
    k2=y1(t(i-1)+deltat/2,rk4(i-1)+k1*deltat/2);
    k3=y1(t(i-1)+deltat/2,rk4(i-1)+k2*deltat/2);
    k4=y1(t(i),rk4(i-1)+k3*deltat);

    rk4(i)=rk4(i-1)+(k1+2*k2+2*k3+k4)*deltat/6;
end

return
end
