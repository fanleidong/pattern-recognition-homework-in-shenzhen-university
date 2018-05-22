clear;
N = 1000; %���г���
M = 100; %��������
for i=1:M %����M������ΪN�İ���������
    u(:,i) = randn(1,N);
end
%����һ��ARϵͳ
b = 1;
a = [1,-0.7];
for i=1:M
    x(:,i) = filter(b,a,u(:,i)); %����M�������ź�x(n)
end
%��ֱ�ӷ����ƹ�����P
for i=1:M
    P(:,i) = abs(fft(x(:,i))).^2/N;
end
%����P��ƽ��ֵ
P_total = zeros(N,1);
for i=1:M
    P_total = P_total + P(:,i);
end
P_mean = P_total./M;
plot(P_mean)
%����x(n)�����۹�����
k = 1:N;
w = k*2*pi/N;
P_ideal = abs(1-0.7*exp(-j*w)).^(-2);
hold;
plot(P_ideal,':') %�õ��߱�ʾ���۹�����
%����ֱ�ӹ��ƹ���P�ķ���
P_var_total = zeros(N,1);
for i=1:M
    P_var_total = P_var_total + (P(:,i) - P_mean).^2;
end
P_var = P_var_total./(M-1);
figure;
plot(P_var,'red')