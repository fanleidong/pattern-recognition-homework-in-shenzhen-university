%%%��С���Ͼ��������%%%
clear;
%ʵ������
w1 = [-5.01 -8.12 -3.68; -5.43 -3.48 -3.54; 1.08 -5.52 1.66; 0.86 -3.78 -4.11; -2.67 0.63 7.39;
    4.94 3.29 2.08; -2.51 2.09 -2.59; -2.25 -2.13 -6.94; 5.56 2.86 -2.26; 1.03 -3.33 4.33];
w2 = [-0.91 -0.18 -0.05; 1.30 -2.06 -3.53; -7.75 -4.54 -0.95; -5.47 0.50 3.92; 6.14 5.72 -4.85;
    3.60 1.26 4.36; 5.37 -4.63 -3.65; 7.18 1.46 -6.66; -7.39 1.17 6.30; -7.50 -6.32 -0.31];
w3 = [5.35 2.26 8.13; 5.12 3.22 -2.66; -1.34 -5.31 -9.87; 4.48 3.42 5.19; 7.11 2.39 9.21;
    7.17 4.33 -0.98; 5.75 3.97 6.65; 0.77 0.27 2.41; 0.90 -0.43 -8.71; 3.52 -0.36 6.43];
%�����ֵʸ����Э�������
m1 = mean(w1)'; m2 = mean(w2)'; m3 = mean(w3)';
S1 = cal_S(w1); S2 = cal_S(w2); S3 = cal_S(w3);
%���������������Ͼ���ֱ�Ϊ1��2��3ʱ��ͼ��
loc_temp = zeros(3,1);
loc = [];
for i = (m1(1)-2):0.1:(m1(1)+2)
    for j = (m1(2)-2):0.1:(m1(2)+2)
        for k = (m1(3)-2):0.1:(m1(3)-2)
            if abs((sqrt(([i j k]'-m1)'*inv(S1)*([i j k]'-m1)) - 1)) < 0.01
               loc_temp(1,1) = i; loc_temp(2,1) = j; loc_temp(3,1) = k; 
               loc(:,end+1) = loc_temp;
            end
        end
    end
end
plot3(loc(:,1),loc(:,2),loc(:,3))

%�����С���Ͼ�����������Բ��Ե���з���
test1 = [1 2 1]'; test2 = [5 3 2]'; test3 = [0 0 0]'; test4 = [1 0 0]'; test = [test1 test2 test3 test4];
D1 = mashi(test1,m1,m2,m3,S1,S2,S3); %������С���Ͼ�����������з���
D2 = mashi(test2,m1,m2,m3,S1,S2,S3);
D3 = mashi(test3,m1,m2,m3,S1,S2,S3);
D4 = mashi(test4,m1,m2,m3,S1,S2,S3);
%������Ե㵽�����ĵ�ŷʽ����
E1_1 = sqrt((test1 - m1)'*(test1 - m1)); 
E1_2 = sqrt((test1 - m2)'*(test1 - m2));
E1_3 = sqrt((test1 - m3)'*(test1 - m3));
E2_1 = sqrt((test2 - m1)'*(test2 - m1)); 
E2_2 = sqrt((test2 - m2)'*(test2 - m2));
E2_3 = sqrt((test2 - m3)'*(test2 - m3));
E3_1 = sqrt((test3 - m1)'*(test3 - m1)); 
E3_2 = sqrt((test3 - m2)'*(test3 - m2));
E3_3 = sqrt((test3 - m3)'*(test3 - m3));
E4_1 = sqrt((test4 - m1)'*(test4 - m1)); 
E4_2 = sqrt((test4 - m2)'*(test4 - m2));
E4_3 = sqrt((test4 - m3)'*(test4 - m3));
E1 = oushi(test1,m1,m2,m3); %������Сŷʽ������������з���
E2 = oushi(test2,m1,m2,m3);
E3 = oushi(test3,m1,m2,m3);
E4 = oushi(test4,m1,m2,m3);
%%%���ñ�Ҷ˹���������з���
pw1 = 1/3; pw2 = 1/3; pw3 = 1/3;
result = []; %%�洢������
for i =1:1:4
    likelihood_1 = mvnpdf(test(:,i),m1,S1);%ģʽ��1����Ȼ����
    likelihood_2 = mvnpdf(test(:,i),m2,S2);%ģʽ��2����Ȼ����
    likelihood_3 = mvnpdf(test(:,i),m3,S3);%ģʽ��3����Ȼ����
    g1 = likelihood_1*pw1;
    g2 = likelihood_2*pw2;
    g3 = likelihood_3*pw3;
    if g1 > g2 && g1>g3
        result(end+1) = 1;
    elseif g2 > g1 && g2>g3
        result(end+1) = 2;
    elseif g3>g1 && g3>g2
        result(end+1) = 3;
    else
        fprintf(1,'��%d���㴦�ڷ������ϣ��޷����ߡ�\n',i);
    end
end