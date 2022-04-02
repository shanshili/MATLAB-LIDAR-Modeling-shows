function Dis = Kalman2(Disarry,over)
%reDisarry = Disarry;
reDisarry = reshapeArray (Disarry);
Ddis = diff(reDisarry);
Ddis(over) = 0;
cc = [over,1];
%定义初始迭代参数
X_bar = zeros(cc);
Xbar = zeros(cc);
Kk = zeros(cc);
Xbar(1) = 110;

%kalman核心算数
for n = 2:over
   %时间更新
   X_bar (n)=Xbar (n-1); 
  %状态更新
   Kk(n) = fillmissing(abs(Ddis(n))/(abs(Ddis(n))+abs(Ddis(n-1))),'constant',0);
   Xbar(n)=X_bar (n)+Kk(n)*(reDisarry(n)-X_bar (n) );
   Dis(n,1) = Xbar(n);
end

end