function [ res ] = Bayes( x, w1, w2, w3, h )
% 此函数是一个对三个类的贝叶斯分类器
% x 待分类的样本点；res 分类结果，取值为1,2,3；h 窗口宽度
pw1 = 1/3; pw2 = 1/3; pw3 = 1/3; %先验概率
p_1 = pw1*cal_pdf(w1,h,x);
p_2 = pw2*cal_pdf(w2,h,x);
p_3 = pw3*cal_pdf(w3,h,x);
if p_1 >=p_2 && p_1>=p_3
    res = 1;
elseif p_2>=p_1 && p_2>=p_3
    res = 2;
elseif p_3>=p_1 && p_3>=p_2
    res = 3;
else
    fprintf('处于分类面上，无法决策。\n');
end

