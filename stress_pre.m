Train_S=xlsread('C:\Users\Uaena_HY\Desktop\���뼯\���ݿ�\newset_stress','153','B2:N154');
Test_S = xlsread('C:\Users\Uaena_HY\Desktop\adjust','Sheet1','B2:N3'); %�ɷ�+�¶� ���� 
[allresults_S,out_S] = model_2(Train_S,Test_S);
allresults_S1=allresults_S; %�ɷ� �¶� Ԥ������ Ԥ��Ӧ��
predicted_S=out_S';