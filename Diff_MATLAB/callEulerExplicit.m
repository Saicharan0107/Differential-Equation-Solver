function [eulerexplicit] = callEulerExplicit(y1, yinitial, xinitial, deltaX, xFinal)
x=xinitial:deltaX:xFinal;
eulerexplicit=zeros(1,length(x));
eulerexplicit(1)=yinitial;
for i=2:length(eulerexplicit)
    eulerexplicit(i)=eulerexplicit(i-1)+y1(x(i-1))*deltaX;
end
% eulerexplicit(2:end)=eulerexplicit(1:end-1)+y1(x(1:end-1))*deltaX;
return
end