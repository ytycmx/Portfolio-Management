load retm.mat;
m = size(retm,1);
k = 10;
xx = [];
muex = [];
final = [];
B = 10000;
L = 10100;
for p = 1:20
    [J, mu, c] = kmeans2(retm, k);
    q = c./m;
    cvx_begin
    variable x(8);
    variable y(k);
    minimize (q'*y)
    subject to
       y>=L-B*mu*x
       x>=0;
       sum(x) == 1;
       y>=0;
    cvx_end
    xx = [xx x];
    muex = [muex mu];
    final = [final mean(max(L-B*retm*x, 0))];
end