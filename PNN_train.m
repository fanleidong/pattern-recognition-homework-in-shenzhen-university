function [ w1_, w2_, w3_  ] = PNN_train( w1,w2,w3 )
% �˺������ڶ������������� PNN ѵ��
% w1,w2,w3 ����
[c,n] = size(w1);
j = 0;% ��ʼ��

w1_ = zeros(c,n);
for i=1:1:n
   w1_(:,i) = w1(:,i)/norm(w1(:,i)); %��һ��
end
w2_ = zeros(c,n);
for i=1:1:n
   w2_(:,i) = w2(:,i)/norm(w2(:,i)); %��һ��
end
w3_ = zeros(c,n);
for i=1:1:n
   w3_(:,i) = w3(:,i)/norm(w3(:,i)); %��һ��
end
end

