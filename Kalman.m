function Dis = Kalman(Disarry,over)
%reDisarry = Disarry;
reDisarry = reshapeArray (Disarry);
Q = 0.3;
R =0.001;
cc = [over,1];
%定义初始迭代参数
X_bar = zeros(cc);
Xbar = zeros(cc);
K = zeros(cc);
P_ = zeros(cc);
P = zeros(cc);

P(1) = 1;
Xbar(1) = 110;

%kalman核心算数
for n = 2:over
   %时间更新
   X_bar (n)=Xbar (n-1); %更新先验估计
   P_(n)=P (n-1)+Q;%更新先验估计误差协方差
  %状态更新
   K(n)=P_(n)/(P_(n)+R);
   Xbar(n)=X_bar (n)+K(n)*(reDisarry(n)-X_bar (n) );
   Dis(n,1) = Xbar(n);
   P(n)= (1-K(n) )*P_(n) ;
end

end