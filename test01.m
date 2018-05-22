clear;
N = 100; %序列长度
M = 10000000; %样本个数
for i=1:M %产生M个长度为N的白噪声样本
    X(:,i) = randn(1,N);
end
%用直接法估计功率谱P
for i=1:M
    P(:,i) = abs(fft(X(:,i))).^2/N;
end
%计算P的平均值
P_total = zeros(N,1);
for i=1:M
    P_total = P_total + P(:,i);
end
P_mean = P_total./M;
plot(P_mean)
%计算直接估计功率P的方差
P_var_total = zeros(N,1);
for i=1:M
    P_var_total = P_var_total + (P(:,i) - P_mean).^2;
end
P_var = P_var_total./(M-1);
hold;
plot(P_var,'red')
