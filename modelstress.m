Train_S=xlsread('C:\Users\Uaena_HY\Desktop\���뼯\���ݿ�\newset_stress','153','B2:N154');
Test_S = xlsread('C:\Users\Uaena_HY\Desktop\Testset\DD6','Sheet4','B2:N14'); %�ɷ�+�¶� ���� 
[allresults_S,out_S] = model_2(Train_S,Test_S);
allresults_S1=allresults_S; %�ɷ� �¶� Ԥ������ Ԥ��Ӧ��
out_S1=out_S;