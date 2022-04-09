function [cost, y, dcost] = RecCost(x, rs)
B = 1;
L = 1.01;
%m = size(rs,1);
y = L - B * rs * x;
dydx = - B * rs;
if (y < 0)
   y = 0;
   dydx = [0 0 0 0 0 0 0 0];
end
%cost = (1/m) * sum(y);
cost = y;
%dcost = (1/m) * sum(dydx)';
dcost = (dydx)';
end