close all; clear; clc; warning('off');
%% ģ��1 ����Ԥ��
% ѵ����Ԥ����������ݵ���͹�һ��
Train_L=xlsread('C:\Users\Uaena_HY\Desktop\���뼯\���ݿ�\153','Sheet3','B2:N154');
Test_L = xlsread('C:\Users\Uaena_HY\Desktop\���뼯\Testset\Ԥ������','Sheet1','B2:N3'); 
[allresults_L,out_L] = model_1 (Train_L,Test_L);

%% ģ��2 Ӧ��Ԥ��
Train_S=xlsread('C:\Users\Uaena_HY\Desktop\���뼯\���ݿ�\newset_stress','153','B2:N154');
Test_S = allresults_L(:,[1:12 14]); %�ɷ�+�¶� ���� 
[allresults_S,out_S] = model_2(Train_S,Test_S);
allresults_S1=allresults_S; %�ɷ� �¶� Ԥ������ Ԥ��Ӧ��
out_S1=out_S;

%% ģ��3 ��������
S=out_S1';
L=out_L';
teststress = allresults_L(:,13);
final_results = adjust(S,L,allresults_S1,Train_S,teststress,allresults_L);%���ɷ�+�¶�+����Ӧ��+δ������ ��һ����֤Ӧ��  �������� ������֤Ӧ����