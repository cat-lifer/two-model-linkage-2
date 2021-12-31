close all; clear; clc; warning('off');
Train_S=xlsread('C:\Users\Uaena_HY\Desktop\代码集\数据库\newset_stress','153','B2:N154');
[normTrain_S,ps]=mapminmax(Train_S');
% 训练输入数据导入
normInset_S = normTrain_S;%不用动

% 训练的真实输出导入及整理
t = xlsread('C:\Users\Uaena_HY\Desktop\代码集\数据库\newset_stress','153','O2:O154');
t=t';
[t,ts]=mapminmax(t); %输出数据归一化
% 训练的输出数据导入
normOutput_S=t;%不用动

S=cell(1,100);
for s=1:100  %预测50次，取平均值，模拟真实的预测情况时使用
    % 数据乱序
    RD=randperm(size(Train_S',2));% 95%的数据
    normInput_S=normInset_S(:,RD(1:145));
    normTarget_S=normOutput_S(1,RD(1:145));
    %%创建网络
    net_S=newff(minmax(normInput_S),[9,1],{'tansig','purelin'},'traingdx');
    %%权值和阈值
    inputWeights=net_S.iW{1,1};
    inputbias=net_S.b{1};
    layerWeights=net_S.lW{2,1};
    layerbias=net_S.b{2};
    
    %%网络参数设置
    net_S.trainParam.epochs=1000;
    net_S.trainParam.goal=1e-4;
    net_S.trainParam.lr=0.1;
    net_S.trainParam.show = 50;
       
    %%训练网络
    [ net_S, tr] = train( net_S,normInput_S,normTarget_S);
    S{s}=net_S;
    save('C:\Users\Uaena_HY\Desktop\代码集\加速版寿命预测\S.mat','S');
end
