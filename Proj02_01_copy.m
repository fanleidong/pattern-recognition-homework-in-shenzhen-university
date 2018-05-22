clear;
pw1 = 0.5; pw2 = 0.5; %先验概率
% pw1 = 0.4; pw2 = 0.6; %先验概率
m1 = [1 3]; m2 = [3 1]; %基本实验二
% m1 = [1 3]; m2 = [2 2]; %扩展实验（e）
% m1 = [1 3]; m2 = [4 0]; %扩展实验（f）
% S1 = [1.5 0;0 1]; S2 = [1 0.5; 0.5 2];
S1 = [1.5 1;1 1]; S2 = [1 0.5; 0.5 2]; %拓展实验（g）

% 生成2组长度为100的二维随机样本
n = 100; % 样本数
sample1 = mvnrnd(m1,S1,n); % 模式1的样本
sample2 = mvnrnd(m2,S2,n); % 模式2的样本
subplot(1,2,1)
plot(sample1(:,1),sample1(:,2),'o');hold on;
plot(sample2(:,1),sample2(:,2),'+')
title('随机样本的散点图')
sample = [sample1;sample2]; % 样本(200个)

%%% 下面是利用贝叶斯分类器对200个样本进行分类 %%%%
flag = []; % 用来标记
likelihood_1 = mvnpdf(sample,m1,S1);%代入模式类1的似然概率函数中求得似然概率
likelihood_2 = mvnpdf(sample,m2,S2);%代入模式类2的似然概率函数中求得似然概率
g1 = likelihood_1*pw1; %计算后验概率
g2 = likelihood_2*pw2;
for i=1:1:200
    if g1(i) > g2(i) %比较后验概率的大小，进行判决
        flag(end+1) = 1;
    elseif g1(i) < g2(i)
        flag(end+1) = 2;
    else
        fprintf(1,'第%d个点处于分类面上，无法决策。\n',i);
end
end
%%%计算正确分类的百分比
right_num = length(find(flag(1:100)==1))+length(find(flag(101:200)==2)); %正确分类的个数
ratio = right_num/200

%%%在二维图上用不同的标记画出正确分类和错误分类的样本
subplot(1,2,2)
right_loc = [find(flag(1:100)==1) find(flag(101:200)==2)+100]; %存储正确分类的样本点坐标
wrong_loc = [find(flag(1:100)==2) find(flag(101:200)==1)+100]; %存储错误分类的样本点坐标
plot(sample(right_loc(:),1),sample(right_loc(:),2),'o'); hold on; %正确的点
plot(sample(wrong_loc(:),1),sample(wrong_loc(:),2),'+');  %错误的点
title('o代表正确分类，+代表错误分类');