function [ w ] = G_w( w1, w2 )
%   G_w �˺������ڼ�����ά�ռ����ݵ����ŷ���ʸ��
%   w ����ʸ��
%   w1 w2 �ֱ���������������
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

