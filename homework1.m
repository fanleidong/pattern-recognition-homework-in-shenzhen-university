%一维区间[10,70]中，生成1000个均匀分布的随机数，然后统计并绘制这些数的直方图
clear;
r = 10 + (70-10).*rand(1000,1);
figure(1);
hist(r,10:70)

%二维区间[1,5]×[20,30]中，生成5000个均匀分布的二维随机点，并画出二维散点图
clear;
n = 5000; % 点的数量
x = 1 + (5-1)*rand(n,1); % 产生横坐标
y = 20 + (30-20)*rand(n,1); % 产生纵坐标
cxd = [x y]; % 生产随机点
figure(2);
plot(x,y,'o') % 绘图，从图可以大致看出均匀随机分布

%三维区间[10,50]×[30,60]×[10,15]中，生成10000个均匀分布的三维随机点，并绘制三维散点图
clear;
n = 10000;  %点的数量
x = 10 + (50-10)*rand(n,1);
y = 30 + (60-30)*rand(n,1);
z = 10 + (15-10)*rand(n,1);
cxd = [x y z];
figure(3);
plot3(x,y,z)