function [heuns]=callHuens(y1,yinitial,tinitial,deltat,tFinal);
t=tinitial:deltat:tFinal;
heuns=zeros(1,length(t));
heuns(1)=yinitial;
for i=2:length(heuns)
    k1=y1(t(i-1),heuns(i-1))*deltat;
    k2=y1(t(i),heuns(i-1)+k1*deltat);
    heuns(i)=heuns(i-1)+(k1+k2)*deltat/2;
end
return
end