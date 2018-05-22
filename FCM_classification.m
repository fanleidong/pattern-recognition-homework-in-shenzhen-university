% 代码名称：模糊C均值聚类
% 本代码用于对n个二维样本进行C均值聚类，聚类类别数为class_n。
% 作者：范雷东
% 时间：2016.11.29
clc;clear;close all % matlab初始化
% 生成实验数据
class_n = input('请输入类别数量: '); % 类别数
if isempty(class_n)
    class_n = 2; % 如果用户没有输入(class_n=null)，赋class_n为默认值2
end
disp(['类别的数量是: ',num2str(class_n)]); % 对用户输入进行反馈
class_n = int32(class_n); % 转浮点数类型为32位整型，避免用户输入浮点数

n = input('请输入每一类样本的数量: '); % 每一类样本的数量
if isempty(n)
    n = 100; % 如果用户没有输入(n=null)，赋n为默认值100
end
disp(['每一类样本的数量是: ',num2str(n)]); % 对用户输入进行反馈
n = int32(n); % 转浮点数类型为32位整型，避免用户输入浮点数

x = []; y = []; % 用于存储实验数据
for i = 1:1:class_n % 由于实验数据都是经过rand函数生成的（量纲一样），
                    % 所以是经过规格化的，不需要再进行规格化操作
    xi = rand(1,n)*9 + rand*5; % rand*5功能: 随机产生类别间的差异
    yi = rand(1,n)*9 + rand*5; 
    x = [x,xi];
    y = [y,yi];
end
% 分类前的初始化
data = [x;y]'; % 将x y放入一个数组中，作为实验输入，参与分类;每行存储一个样本
iteration = 300; % 迭代次数
m = 2; % 模糊加权指数
num_data = size(data,1); % 样本个数
num_d = size(data,2); % 样本维度，在本实验中为2
% 利用rand函数生成随机数，初始化隶属度矩阵U，每一列和为1
U = rand(class_n,num_data); % U是class_n*num_data的数组.
                            % 第i列存储的是样本i在每个类中的隶属度，每一列和为1
col_sum = sum(U); % U的每一列的和
U = U./col_sum(ones(class_n,1),:); % 将隶属度矩阵U的每一进行归一化（每一列和为1）

% 迭代操作开始
for i = 1:iteration
    % 更新聚类中心c,利用课件PPT54页的推导公式
    for j = 1:class_n
        u_ij_m = U(j,:).^m;
        sum_u_ij = sum(u_ij_m);
        c(j,:) = u_ij_m*data./sum_u_ij;
    end
    % 计算目标函数J,利用PPT58页的推导公式
    temp1 = zeros(class_n,num_data);
    for j = 1:class_n
        for k = 1:num_data
            temp1(j,k) = U(j,k)^m*(norm(data(k,:)-c(j,:)))^2;
        end
    end
    J(i) = sum(sum(temp1));
    % 更新隶属度矩阵U,利用PPT58页的推导公式
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
% 显示
figure;
subplot(1,2,1),plot(J);title('目标函数');
[~,label] = max(U); %找到所属的类
subplot(1,2,2);
gscatter(data(:,1),data(:,2),label,'brgmkc','xo*^+.');title('分类结果')