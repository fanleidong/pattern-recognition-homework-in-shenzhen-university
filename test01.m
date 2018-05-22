clear;
N = 100; %���г���
M = 10000000; %��������
for i=1:M %����M������ΪN�İ���������
    X(:,i) = randn(1,N);
end
%��ֱ�ӷ����ƹ�����P
for i=1:M
    P(:,i) = abs(fft(X(:,i))).^2/N;
end
%����P��ƽ��ֵ
P_total = zeros(N,1);
for i=1:M
    P_total = P_total + P(:,i);
end
P_mean = P_total./M;
plot(P_mean)
%����ֱ�ӹ��ƹ���P�ķ���
P_var_total = zeros(N,1);
for i=1:M
    P_var_total = P_var_total + (P(:,i) - P_mean).^2;
end
P_var = P_var_total./(M-1);
hold;
plot(P_var,'red')
