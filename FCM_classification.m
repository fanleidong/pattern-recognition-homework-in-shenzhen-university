% �������ƣ�ģ��C��ֵ����
% ���������ڶ�n����ά��������C��ֵ���࣬���������Ϊclass_n��
% ���ߣ����׶�
% ʱ�䣺2016.11.29
clc;clear;close all % matlab��ʼ��
% ����ʵ������
class_n = input('�������������: '); % �����
if isempty(class_n)
    class_n = 2; % ����û�û������(class_n=null)����class_nΪĬ��ֵ2
end
disp(['����������: ',num2str(class_n)]); % ���û�������з���
class_n = int32(class_n); % ת����������Ϊ32λ���ͣ������û����븡����

n = input('������ÿһ������������: '); % ÿһ������������
if isempty(n)
    n = 100; % ����û�û������(n=null)����nΪĬ��ֵ100
end
disp(['ÿһ��������������: ',num2str(n)]); % ���û�������з���
n = int32(n); % ת����������Ϊ32λ���ͣ������û����븡����

x = []; y = []; % ���ڴ洢ʵ������
for i = 1:1:class_n % ����ʵ�����ݶ��Ǿ���rand�������ɵģ�����һ������
                    % �����Ǿ�����񻯵ģ�����Ҫ�ٽ��й�񻯲���
    xi = rand(1,n)*9 + rand*5; % rand*5����: �����������Ĳ���
    yi = rand(1,n)*9 + rand*5; 
    x = [x,xi];
    y = [y,yi];
end
% ����ǰ�ĳ�ʼ��
data = [x;y]'; % ��x y����һ�������У���Ϊʵ�����룬�������;ÿ�д洢һ������
iteration = 300; % ��������
m = 2; % ģ����Ȩָ��
num_data = size(data,1); % ��������
num_d = size(data,2); % ����ά�ȣ��ڱ�ʵ����Ϊ2
% ����rand�����������������ʼ�������Ⱦ���U��ÿһ�к�Ϊ1
U = rand(class_n,num_data); % U��class_n*num_data������.
                            % ��i�д洢��������i��ÿ�����е������ȣ�ÿһ�к�Ϊ1
col_sum = sum(U); % U��ÿһ�еĺ�
U = U./col_sum(ones(class_n,1),:); % �������Ⱦ���U��ÿһ���й�һ����ÿһ�к�Ϊ1��

% ����������ʼ
for i = 1:iteration
    % ���¾�������c,���ÿμ�PPT54ҳ���Ƶ���ʽ
    for j = 1:class_n
        u_ij_m = U(j,:).^m;
        sum_u_ij = sum(u_ij_m);
        c(j,:) = u_ij_m*data./sum_u_ij;
    end
    % ����Ŀ�꺯��J,����PPT58ҳ���Ƶ���ʽ
    temp1 = zeros(class_n,num_data);
    for j = 1:class_n
        for k = 1:num_data
            temp1(j,k) = U(j,k)^m*(norm(data(k,:)-c(j,:)))^2;
        end
    end
    J(i) = sum(sum(temp1));
    % ���������Ⱦ���U,����PPT58ҳ���Ƶ���ʽ
    for i = 1:class_n
        for k = 1:num_data
            sum1 = 0;
            for j = 1:class_n
                temp = (norm(data(k,:)-c(i,:))/norm(data(k,:)-c(j,:))).^(2/(m-1));
                sum1 = sum1 + temp;
            end
            U(i,k) = 1./sum1;
        end
    end
end
% ��ʾ
figure;
subplot(1,2,1),plot(J);title('Ŀ�꺯��');
[~,label] = max(U); %�ҵ���������
subplot(1,2,2);
gscatter(data(:,1),data(:,2),label,'brgmkc','xo*^+.');title('������')