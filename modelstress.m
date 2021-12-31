Train_S=xlsread('C:\Users\Uaena_HY\Desktop\代码集\数据库\newset_stress','153','B2:N154');
Test_S = xlsread('C:\Users\Uaena_HY\Desktop\Testset\DD6','Sheet4','B2:N14'); %成分+温度 寿命 
[allresults_S,out_S] = model_2(Train_S,Test_S);
allresults_S1=allresults_S; %成分 温度 预测寿命 预测应力
out_S1=out_S;