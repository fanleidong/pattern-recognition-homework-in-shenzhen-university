%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%               利用PCA进行特征空间降维             %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear;
N = 1000;
mu = [10;15;15];
sigma = [90 2.5 1.2; 2.5 35 0.2;1.2 0.2 0.02];
X = mvnrnd(mu,sigma,N); %生成样本集合
figure(1); plot3(X(:,1),X(:,2),X(:,3),'*')
title('三维样本矢量');
m = mean(X)'; %均值向量
S = (N-1)*cov(X); %散布矩阵
[V,D] = eig(S); %计算散布矩阵S的特征值和特征向量（从小到大排列）
V = [V(:,3),V(:,2),V(:,1)];
D = [D(:,3),D(:,2),D(:,1)];%（从大到小排列）
y1 = V(:,1)'*(X'-repmat(m,1,N));
y2 = V(:,2)'*(X'-repmat(m,1,N));
y = [y1;y2];
figure(2); plot(y1,y2,'+');
title('集合Y的二维散点图')
temp = inv(V);
W = [temp(:,1),temp(:,2)];
Z = W*y + repmat(m,1,N);
figure(3); plot3(Z(1,:),Z(2,:),Z(3,:),'r*');
hold on; plot3(X(:,1),X(:,2),X(:,3),'+')
hold on; 
for i =1:1:N %%连线
    plot3([Z(1,i) X(i,1)],[Z(2,i) X(i,2)],[Z(3,i) X(i,3)],'--');
end
title('集合Z和集合X的三维数据散点图')
%%%计算误差的平方值
temp = X'-Z;
J = zeros(1,N);
for i =1:1:N
    J(i) = temp(:,i)'*temp(:,i);
end
he = sum(J);
junfang = he/N; %均方误差