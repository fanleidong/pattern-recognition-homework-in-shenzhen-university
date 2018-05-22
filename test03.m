clear;
N = 1000; %序列长度
M = 100; %样本个数
for i=1:M %产生M个长度为N的白噪声样本
    u(:,i) = randn(1,N);
end
%产生一个AR系统
b = 1;
a = [1,-0.7];
for i=1:M
    x(:,i) = filter(b,a,u(:,i)); %产生M个输入信号x(n)
end
%用直接法估计功率谱P
for i=1:M
    P(:,i) = abs(fft(x(:,i))).^2/N;
end
%计算P的平均值
P_total = zeros(N,1);
for i=1:M
    P_total = P_total + P(:,i);
end
P_mean = P_total./M;
plot(P_mean)
%画出x(n)的理论功率谱
k = 1:N;
w = k*2*pi/N;
P_ideal = abs(1-0.7*exp(-j*w)).^(-2);
hold;
plot(P_ideal,':') %用点线表示理论功率谱
%计算直接估计功率P的方差
P_var_total = zeros(N,1);
for i=1:M
    P_var_total = P_var_total + (P(:,i) - P_mean).^2;
end
P_var = P_var_total./(M-1);
figure;
plot(P_var,'red')