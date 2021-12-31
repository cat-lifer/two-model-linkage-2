close all; clear; clc; warning('off');
Train_L=xlsread('C:\Users\Uaena_HY\Desktop\代码集\数据库\153','Sheet3','B2:N154');
[normTrain_L,ps]=mapminmax(Train_L');

% 训练输入数据导入
normInset_L= normTrain_L;%不用动

% 训练的真实输出导入及整理
t = xlsread('C:\Users\Uaena_HY\Desktop\代码集\数据库\153','Sheet3','O2:O154'); %不用动
t=t';
[t,ts]=mapminmax(t); %输出数据归一化

% 训练的输出数据导入
normOutput_L=t;%不用动


L=cell(1,100);
for n=1:100  %预测50次，取平均值，模拟真实的预测情况时使用

% 数据乱序
RD=randperm(size(Train_L',2));
pec = round(size(Train_L',2)*0.95); %抽样，抽取总体的95%
normInput_L=normInset_L(:,RD(1:pec));  %145
normTarget_L=normOutput_L(1,RD(1:pec)); % 145
%%创建网络
net_L=newff(minmax(normInput_L),[10,1,1],{'tansig','tansig','purelin'},'traingdx');%双隐层

%%权值和阈值
inputWeights=net_L.iW{1,1};
inputbias=net_L.b{1}; 
layerWeights=net_L.lW{2,1}; 
layerbias=net_L.b{2}; 

%%网络参数设置
net_L.trainParam.epochs=8000;
net_L.trainParam.goal=1e-4;
net_L.trainParam.lr=0.01;
net_L.trainParam.show = 50;

%%训练网络
net_L = init(net_L);
[ net_L, tr] = train( net_L,normInput_L,normTarget_L);
L{n}=net_L;
save('C:\Uaena_HY\DELL\Desktop\代码集\加速版寿命预测\L.mat','L');
end