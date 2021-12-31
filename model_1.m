function [allresults_L,out_L] = model_1 (Train_L,Test_L)
[normTrain_L,ps]=mapminmax(Train_L');
normtestinput_L = mapminmax('apply',Test_L',ps);

% 训练输入数据导入
normInset_L= normTrain_L;%不用动

% 训练的真实输出导入及整理
t = xlsread('C:\Users\Uaena_HY\Desktop\代码集\数据库\153','Sheet3','O2:O154'); %不用动
t=t';
[t,ts]=mapminmax(t); %输出数据归一化


load('L.mat')
for i=1:100
    normtestoutput_L=sim(L{i},normtestinput_L);
    testOutput_L=mapminmax('reverse',normtestoutput_L,ts);
    preout_L(i,:) = abs(testOutput_L);
end
testinput_L=mapminmax('reverse',normtestinput_L,ps);
out_L=mean(preout_L);
allresults_L=[testinput_L' out_L']; %成分（1:11）温度（12）应力（13）寿命（14）
end