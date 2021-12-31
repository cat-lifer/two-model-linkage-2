function [allresults_S,out_S] = model_2 (Train_S,Test_S)
[normTrain_S,ps]=mapminmax(Train_S');
normtestinput_S = mapminmax('apply',Test_S',ps);

load('S.mat')
for i=1:100
    normtestoutput_S=sim(S{i},normtestinput_S);  %����
    testOutput_S=mapminmax('reverse',normtestoutput_S,ts); %�������ݵ�Ԥ����    
    preout_S(i,:) = abs(testOutput_S);   
end
testinput_S=mapminmax('reverse',normtestinput_S,ps);%�������ݷ���һ��
out_S=mean(preout_S);
allresults_S=[testinput_S' out_S'];
end
