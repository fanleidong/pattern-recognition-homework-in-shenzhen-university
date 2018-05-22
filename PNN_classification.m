function [ class ] = PNN_classification( x, w1_, w2_, w3_, sigma )
% 此函数的功能是利用 PNN 进行分类
% x 测试样本
g1 = 0; g2 = 0; g3 = 0;
net1 = w1_'*x;
for i=1:1:length(net1)
    g1 = g1 + exp((net1(i)-1)/(sigma*sigma));
end
net2 = w2_'*x;
for i=1:1:length(net2)
    g2 = g2 + exp((net2(i)-1)/(sigma*sigma));
end
net3 = w3_'*x;
for i=1:1:length(net3)
    g3 = g3 + exp((net3(i)-1)/(sigma*sigma));
end
if g1>=g2 && g1>=g3
    class = 1;
elseif g2>=g1 && g2>=g3
    class = 2;
elseif g3>=g1 && g3>=g2
    class = 3;
else
end
end

