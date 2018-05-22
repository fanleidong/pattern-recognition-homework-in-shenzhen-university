function [ p ] = cal_pdf( w, h, x)
% 此函数用于计算三维数据类条件概率密度
% w 三维数据集; h 窗口宽度；x 所求概率密度的点
p = 0;
for i=1:1:10
    p = p + exp(-(x-w(:,i))'*(x-w(:,i))/(2*h*h));
end
p = p/10;
end

