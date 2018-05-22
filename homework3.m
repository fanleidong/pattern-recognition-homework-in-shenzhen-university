%实验3
clear;
u = [0 0]; %均值
sigma = [1 0;0 1]; %协方差矩阵
[X,Y] = meshgrid(-5:0.1:5,-5:0.1:5); % 在XOY平面产生网格
p = mvnpdf([X(:),Y(:)],u,sigma);
p = reshape(p,size(X));
mesh(X,Y,p); %以X Y 为自变量，p为因变量画三维网线图
