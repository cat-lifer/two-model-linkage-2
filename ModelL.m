close all; clear; clc; warning('off');
Train_L=xlsread('C:\Users\Uaena_HY\Desktop\���뼯\���ݿ�\153','Sheet3','B2:N154');
[normTrain_L,ps]=mapminmax(Train_L');

% ѵ���������ݵ���
normInset_L= normTrain_L;%���ö�

% ѵ������ʵ������뼰����
t = xlsread('C:\Users\Uaena_HY\Desktop\���뼯\���ݿ�\153','Sheet3','O2:O154'); %���ö�
t=t';
[t,ts]=mapminmax(t); %������ݹ�һ��

% ѵ����������ݵ���
normOutput_L=t;%���ö�


L=cell(1,100);
for n=1:100  %Ԥ��50�Σ�ȡƽ��ֵ��ģ����ʵ��Ԥ�����ʱʹ��

% ��������
RD=randperm(size(Train_L',2));
pec = round(size(Train_L',2)*0.95); %��������ȡ�����95%
normInput_L=normInset_L(:,RD(1:pec));  %145
normTarget_L=normOutput_L(1,RD(1:pec)); % 145
%%��������
net_L=newff(minmax(normInput_L),[10,1,1],{'tansig','tansig','purelin'},'traingdx');%˫����

%%Ȩֵ����ֵ
inputWeights=net_L.iW{1,1};
inputbias=net_L.b{1}; 
layerWeights=net_L.lW{2,1}; 
layerbias=net_L.b{2}; 

%%�����������
net_L.trainParam.epochs=8000;
net_L.trainParam.goal=1e-4;
net_L.trainParam.lr=0.01;
net_L.trainParam.show = 50;

%%ѵ������
net_L = init(net_L);
[ net_L, tr] = train( net_L,normInput_L,normTarget_L);
L{n}=net_L;
save('C:\Uaena_HY\DELL\Desktop\���뼯\���ٰ�����Ԥ��\L.mat','L');
end