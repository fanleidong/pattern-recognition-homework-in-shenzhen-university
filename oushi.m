function [ output ] = oushi( x,m1,m2,m3 )
%�˺���Ϊ��Сŷʽ���������
    E1 = -sqrt((x - m1)'*(x - m1)); 
    E2 = -sqrt((x - m2)'*(x - m2));
    E3 = -sqrt((x - m3)'*(x - m3));
    if E1>=E2 && E1>=E3
        output = 1;
    elseif E2>=E1 && E2>=E3
        output = 2;
    elseif E3>=E1 && E3>=E2
        output = 3;
    else 
        fprintf('wrong\n')
end

