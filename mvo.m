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
 K = [];
 for x = 1:96

      for y = 1:8
        
           K(x,y) = M(x,y)/M(x+1,y);
      end

 end
 COVK = cov(K);
 n = length(GM);
 e = ones(n, 1);
 xx = [];
 rr = [];
 stdv = [];
 for R = 1.001:0.001:1.046
       cvx_begin
         variable x(n)
         minimize (x'*COVK*x)
         subject to
         GM * x >= R;
         e' * x == 1;
         x >= 0;
	cvx_end
 xx = [xx x];
 rr = [rr GM * x];
 stdv = [stdv sqrt(x' * COVK * x)];
 end
 figure(1);
 plot(stdv, rr);
 figure(2);
 area(xx');