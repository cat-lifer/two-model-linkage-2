function [allresults_L,out_L] = model_1 (Train_L,Test_L)
[normTrain_L,ps]=mapminmax(Train_L');
normtestinput_L = mapminmax('apply',Test_L',ps);

% ѵ���������ݵ���
normInset_L= normTrain_L;%���ö�

% ѵ������ʵ������뼰����
t = xlsread('C:\Users\Uaena_HY\Desktop\���뼯\���ݿ�\153','Sheet3','O2:O154'); %���ö�
t=t';
[t,ts]=mapminmax(t); %������ݹ�һ��


load('L.mat')
for i=1:100
    normtestoutput_L=sim(L{i},normtestinput_L);
    testOutput_L=mapminmax('reverse',normtestoutput_L,ts);
    preout_L(i,:) = abs(testOutput_L);
end
testinput_L=mapminmax('reverse',normtestinput_L,ps);
out_L=mean(preout_L);
allresults_L=[testinput_L' out_L']; %�ɷ֣�1:11���¶ȣ�12��Ӧ����13��������14��
end