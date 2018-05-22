clear;
% 生成2组长度为100的二维随机样本 样本在[-10,10]*[-10,10]区间服从均匀分布
n = 100; % 样本数
x1 = -10 + 20*rand(n,1); % 产生横坐标
y1 = -10 + 20*rand(n,1); % 产生纵坐标
sample1 = [x1 y1]; % 模式1的样本
x2 = -10 + 20*rand(n,1); % 产生横坐标
y2 = -10 + 20*rand(n,1); % 产生纵坐标
sample2 = [x2 y2]; % 模式2的样本
figure(1)
plot(x1,y1,'o');hold on;
plot(x2,y2,'+')

% pw1 = 0.5; pw2 = 0.5; %先验概率
pw1 = 0.4; pw2 = 0.6; %先验概率
m1 = [1 3]; m2 = [3 1]; %基本实验二
% m1 = [1 3]; m2 = [2 2]; %扩展实验（e）
% m1 = [1 3]; m2 = [4 0]; %扩展实验（f）
% S1 = [1.5 0;0 1]; S2 = [1 0.5; 0.5 2];
S1 = [1.5 1;1 1]; S2 = [1 0.5; 0.5 2]; %拓展实验（g）
%%%首先对模式类1的样本进行分类
right_1 = []; %存储正确分类的样本的坐标
wrong_1 = []; %存储错误分类的样本的坐标
for i =1:1:100
    likelihood_1 = mvnpdf([x1(i) y1(i)],m1,S1);%模式类1的似然概率
    likelihood_2 = mvnpdf([x1(i) y1(i)],m2,S2);%模式类2的似然概率
    g1 = likelihood_1*pw1;
    g2 = likelihood_2*pw2;
    if g1 > g2
        right_1(end+1) = i;
    elseif g1 < g2
        wrong_1(end+1) = i;
    else
        fprintf(1,'第%d个点处于分类面上，无法决策。\n',i);
    end
end
%%%然后对模式类2的样本进行分类
right_2 = []; %存储正确分类的样本的坐标
wrong_2 = []; %存储错误分类的样本的坐标
for i =1:1:100
    likelihood_1 = mvnpdf([x2(i) y2(i)],m1,S1);%模式类1的似然概率
    likelihood_2 = mvnpdf([x2(i) y2(i)],m2,S2);%模式类2的似然概率
    g1 = likelihood_1*pw1;
    g2 = likelihood_2*pw2;
    if g2 > g1
        right_2(end+1) = i;
    elseif g2 < g1
        wrong_2(end+1) = i;
    else
        fprintf(1,'第%d个点处于分类面上，无法决策。\n',i);
    end
end
%%%计算正确分类的百分比
ratio = (length(right_1)+length(right_2))/200

%%%在二维图上用不同颜色画出正确分类和错误分类的样本
figure(2)
plot(x1(right_1(:)),y1(right_1(:)),'o'); hold on;
plot(x2(right_2(:)),y2(right_2(:)),'o'); hold on; %正确的点
plot(x1(wrong_1(:)),y1(wrong_1(:)),'+'); hold on;
plot(x2(wrong_2(:)),y2(wrong_2(:)),'+'); hold on; %错误的点