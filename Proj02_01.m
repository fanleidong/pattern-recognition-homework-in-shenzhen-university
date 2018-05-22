clear;
% ����2�鳤��Ϊ100�Ķ�ά������� ������[-10,10]*[-10,10]������Ӿ��ȷֲ�
n = 100; % ������
x1 = -10 + 20*rand(n,1); % ����������
y1 = -10 + 20*rand(n,1); % ����������
sample1 = [x1 y1]; % ģʽ1������
x2 = -10 + 20*rand(n,1); % ����������
y2 = -10 + 20*rand(n,1); % ����������
sample2 = [x2 y2]; % ģʽ2������
figure(1)
plot(x1,y1,'o');hold on;
plot(x2,y2,'+')

% pw1 = 0.5; pw2 = 0.5; %�������
pw1 = 0.4; pw2 = 0.6; %�������
m1 = [1 3]; m2 = [3 1]; %����ʵ���
% m1 = [1 3]; m2 = [2 2]; %��չʵ�飨e��
% m1 = [1 3]; m2 = [4 0]; %��չʵ�飨f��
% S1 = [1.5 0;0 1]; S2 = [1 0.5; 0.5 2];
S1 = [1.5 1;1 1]; S2 = [1 0.5; 0.5 2]; %��չʵ�飨g��
%%%���ȶ�ģʽ��1���������з���
right_1 = []; %�洢��ȷ���������������
wrong_1 = []; %�洢������������������
for i =1:1:100
    likelihood_1 = mvnpdf([x1(i) y1(i)],m1,S1);%ģʽ��1����Ȼ����
    likelihood_2 = mvnpdf([x1(i) y1(i)],m2,S2);%ģʽ��2����Ȼ����
    g1 = likelihood_1*pw1;
    g2 = likelihood_2*pw2;
    if g1 > g2
        right_1(end+1) = i;
    elseif g1 < g2
        wrong_1(end+1) = i;
    else
        fprintf(1,'��%d���㴦�ڷ������ϣ��޷����ߡ�\n',i);
    end
end
%%%Ȼ���ģʽ��2���������з���
right_2 = []; %�洢��ȷ���������������
wrong_2 = []; %�洢������������������
for i =1:1:100
    likelihood_1 = mvnpdf([x2(i) y2(i)],m1,S1);%ģʽ��1����Ȼ����
    likelihood_2 = mvnpdf([x2(i) y2(i)],m2,S2);%ģʽ��2����Ȼ����
    g1 = likelihood_1*pw1;
    g2 = likelihood_2*pw2;
    if g2 > g1
        right_2(end+1) = i;
    elseif g2 < g1
        wrong_2(end+1) = i;
    else
        fprintf(1,'��%d���㴦�ڷ������ϣ��޷����ߡ�\n',i);
    end
end
%%%������ȷ����İٷֱ�
ratio = (length(right_1)+length(right_2))/200

%%%�ڶ�άͼ���ò�ͬ��ɫ������ȷ����ʹ�����������
figure(2)
plot(x1(right_1(:)),y1(right_1(:)),'o'); hold on;
plot(x2(right_2(:)),y2(right_2(:)),'o'); hold on; %��ȷ�ĵ�
plot(x1(wrong_1(:)),y1(wrong_1(:)),'+'); hold on;
plot(x2(wrong_2(:)),y2(wrong_2(:)),'+'); hold on; %����ĵ�