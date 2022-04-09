load retm.mat;
x = [0.1;
    0.15;
    0.2;
    0.05;
    0.09;
    0.16;
    0.11;
    0.14];
dcc = [];
xp = [];
L = 10100;
B = 10000;
for w = 1:3
for p = 1:100000
[cost, y, dc] = RecCost(x, retm(p,:));
%dcc = [dcc dc];
gamma = 1/p;
x = x - gamma*dc;
x = proj_unit_simplex(x);
%xp = [xp x];
end
sf = mean(max((L-B*retm*x),0))
end
%sf = mean(max((L-B*retm*x),0));