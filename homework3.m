%ʵ��3
clear;
u = [0 0]; %��ֵ
sigma = [1 0;0 1]; %Э�������
[X,Y] = meshgrid(-5:0.1:5,-5:0.1:5); % ��XOYƽ���������
p = mvnpdf([X(:),Y(:)],u,sigma);
p = reshape(p,size(X));
mesh(X,Y,p); %��X Y Ϊ�Ա�����pΪ���������ά����ͼ
