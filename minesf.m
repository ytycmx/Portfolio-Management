load retm.mat
B = 10000;
L = 10100;
s = 1000;
cvx_begin
variable x(8);
variable y(s);
minimize ((1/s)*sum(y))
subject to
y >= L - B*retm(1:s,:)*x;
x>=0;
sum(x) == 1;
y>=0;
cvx_end
S = size(retm,1);
outofsample = mean(max(L - B * retm(s+1:S,:)*x,0));