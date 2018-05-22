function [ w ] = G_w( w1, w2 )
%   G_w 此函数用于计算三维空间数据的最优方向矢量
%   w 方向矢量
%   w1 w2 分别是两类样本数据
m1 = mean(w1); m2 = mean(w2);
S1 = zeros(length(m1)); S2 = S1;
for i=1:1:length(m1)
    S1 = S1 + (w1(i,:)-m1)'*(w1(i,:)-m1);
end
for i=1:1:length(m2)
    S2 = S2 + (w2(i,:)-m2)'*(w2(i,:)-m2);
end
Sw = S1 + S2;
w = inv(Sw)*(m1-m2)';
w = normc(w);
end

