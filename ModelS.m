close all; clear; clc; warning('off');
Train_S=xlsread('C:\Users\Uaena_HY\Desktop\���뼯\���ݿ�\newset_stress','153','B2:N154');
[normTrain_S,ps]=mapminmax(Train_S');
% ѵ���������ݵ���
normInset_S = normTrain_S;%���ö�

% ѵ������ʵ������뼰����
t = xlsread('C:\Users\Uaena_HY\Desktop\���뼯\���ݿ�\newset_stress','153','O2:O154');
t=t';
[t,ts]=mapminmax(t); %������ݹ�һ��
% ѵ����������ݵ���
normOutput_S=t;%���ö�

S=cell(1,100);
for s=1:100  %Ԥ��50�Σ�ȡƽ��ֵ��ģ����ʵ��Ԥ�����ʱʹ��
    % ��������
    RD=randperm(size(Train_S',2));% 95%������
    normInput_S=normInset_S(:,RD(1:145));
    normTarget_S=normOutput_S(1,RD(1:145));
    %%��������
    net_S=newff(minmax(normInput_S),[9,1],{'tansig','purelin'},'traingdx');
    %%Ȩֵ����ֵ
    inputWeights=net_S.iW{1,1};
    inputbias=net_S.b{1};
    layerWeights=net_S.lW{2,1};
    layerbias=net_S.b{2};
    
    %%�����������
    net_S.trainParam.epochs=1000;
    net_S.trainParam.goal=1e-4;
    net_S.trainParam.lr=0.1;
    net_S.trainParam.show = 50;
       
    %%ѵ������
    [ net_S, tr] = train( net_S,normInput_S,normTarget_S);
    S{s}=net_S;
    save('C:\Users\Uaena_HY\Desktop\���뼯\���ٰ�����Ԥ��\S.mat','S');
end
