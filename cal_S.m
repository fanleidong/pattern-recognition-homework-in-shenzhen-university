function [ S ] = cal_S( sample )
% �˺����Ĺ������ڼ���Э����
m = mean(sample);
m = m';
sample = sample';
sum = 0;
for i = 1:1:10
  sum = sum + (sample(:,i)-m)*(sample(:,i)-m)';
end
S = sum/10;
end

