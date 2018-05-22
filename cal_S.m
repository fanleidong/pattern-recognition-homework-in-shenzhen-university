function [ S ] = cal_S( sample )
% 此函数的功能用于计算协方差
m = mean(sample);
m = m';
sample = sample';
sum = 0;
for i = 1:1:10
  sum = sum + (sample(:,i)-m)*(sample(:,i)-m)';
end
S = sum/10;
end

