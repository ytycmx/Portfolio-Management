 M = csvread('all.csv', 1, 1, [1, 1, 97, 8]);
 a = [];
 for i= 1:12:97
     
      a = [a;M(i,:)];
 end
 N=[];
 for i = 1:8
       
      for j = 1:8

      N(i,j) = a(i,j)/a(i+1,j);
      end

 end
 GM = exp(mean(log(N)));
COV = cov(N);
n = length(GM);
e = ones(n, 1);
xx = [];
rr = [];
stdv = [];
for R = 1.001:0.001:1.046
       cvx_begin
         variable x(n)
         minimize (x'*COV*x)
          subject to
            GM * x >= R; 
            e' * x == 1;
       cvx_end
xx = [xx x];
rr = [rr GM * x];
stdv = [stdv sqrt(x' * COV * x)];
end
figure(1);
plot(stdv, rr);