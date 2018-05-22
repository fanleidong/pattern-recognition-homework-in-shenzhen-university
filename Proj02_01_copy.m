clear;
pw1 = 0.5; pw2 = 0.5; %�������
% pw1 = 0.4; pw2 = 0.6; %�������
m1 = [1 3]; m2 = [3 1]; %����ʵ���
% m1 = [1 3]; m2 = [2 2]; %��չʵ�飨e��
% m1 = [1 3]; m2 = [4 0]; %��չʵ�飨f��
% S1 = [1.5 0;0 1]; S2 = [1 0.5; 0.5 2];
S1 = [1.5 1;1 1]; S2 = [1 0.5; 0.5 2]; %��չʵ�飨g��

% ����2�鳤��Ϊ100�Ķ�ά�������
n = 100; % ������
sample1 = mvnrnd(m1,S1,n); % ģʽ1������
sample2 = mvnrnd(m2,S2,n); % ģʽ2������
subplot(1,2,1)
plot(sample1(:,1),sample1(:,2),'o');hold on;
plot(sample2(:,1),sample2(:,2),'+')
title('���������ɢ��ͼ')
sample = [sample1;sample2]; % ����(200��)

%%% ���������ñ�Ҷ˹��������200���������з��� %%%%
flag = []; % �������
likelihood_1 = mvnpdf(sample,m1,S1);%����ģʽ��1����Ȼ���ʺ����������Ȼ����
likelihood_2 = mvnpdf(sample,m2,S2);%����ģʽ��2����Ȼ���ʺ����������Ȼ����
g1 = likelihood_1*pw1; %����������
g2 = likelihood_2*pw2;
for i=1:1:200
    if g1(i) > g2(i) %�ȽϺ�����ʵĴ�С�������о�
        flag(end+1) = 1;
    elseif g1(i) < g2(i)
        flag(end+1) = 2;
    else
        fprintf(1,'��%d���㴦�ڷ������ϣ��޷����ߡ�\n',i);
end
end
%%%������ȷ����İٷֱ�
right_num = length(find(flag(1:100)==1))+length(find(flag(101:200)==2)); %��ȷ����ĸ���
ratio = right_num/200

%%%�ڶ�άͼ���ò�ͬ�ı�ǻ�����ȷ����ʹ�����������
subplot(1,2,2)
right_loc = [find(flag(1:100)==1) find(flag(101:200)==2)+100]; %�洢��ȷ���������������
wrong_loc = [find(flag(1:100)==2) find(flag(101:200)==1)+100]; %�洢������������������
plot(sample(right_loc(:),1),sample(right_loc(:),2),'o'); hold on; %��ȷ�ĵ�
plot(sample(wrong_loc(:),1),sample(wrong_loc(:),2),'+');  %����ĵ�
title('o������ȷ���࣬+����������');