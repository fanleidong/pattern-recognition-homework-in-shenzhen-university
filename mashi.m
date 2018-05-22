function [ output ] = mashi( x,m1,m2,m3,S1,S2,S3 )
% 此函数为最小马氏距离分类器
    g1 = -sqrt((x-m1)'*inv(S1)*(x-m1));
    g2 = -sqrt((x-m2)'*inv(S2)*(x-m2));
    g3 = -sqrt((x-m3)'*inv(S3)*(x-m3));
    if g1>=g2 && g1>=g3
        output = 1;
    elseif g2>=g1 && g2>=g3
        output = 2;
    elseif g3>=g1 && g3>=g2
        output = 3;
    else 
        fprintf('wrong\n')
    end
end

