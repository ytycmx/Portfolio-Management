M = csvread('all.csv', 1, 1, [1, 1, 97, 8]);
K = [];
 for x = 1:96

      for y = 1:8
        
           K(x,y) = M(x,y)/M(x+1,y);
      end

 end
GM = exp(mean(log(K)));
COVK = cov(K);
M = mean(K);
n = length(GM);
e = ones(n, 1);
xx = [];
rr = [];
mad = [];
for R = 1.0001:0.0001:1.0038
       cvx_begin
         variable x(n)
         minimize norm(K*x-M*x, 1)
                  subject to
         GM * x >= R;
         e' * x == 1;
         x >= 0;
	cvx_end
 xx = [xx x];
 rr = [rr GM * x];
 mad = [mad cvx_optval];
end
figure(1);
plot(mad, rr);
figure(2);
area(xx');