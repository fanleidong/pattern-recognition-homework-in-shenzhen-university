function [ w1_, w2_, w3_  ] = PNN_train( w1,w2,w3 )
% 此函数用于对三类样本进行 PNN 训练
% w1,w2,w3 样本
[c,n] = size(w1);
j = 0;% 初始化

w1_ = zeros(c,n);
for i=1:1:n
   w1_(:,i) = w1(:,i)/norm(w1(:,i)); %归一化
end
w2_ = zeros(c,n);
for i=1:1:n
   w2_(:,i) = w2(:,i)/norm(w2(:,i)); %归一化
end
w3_ = zeros(c,n);
for i=1:1:n
   w3_(:,i) = w3(:,i)/norm(w3(:,i)); %归一化
end
end

