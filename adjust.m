function final_results = adjust(S,L,allresults_S1,Train_S,teststress,allresults_L)

for i=1:size(S,1)
    
    if S(i,1)> teststress(i,1)+5    % 1100����5  1150����10
        disp(['�� ',num2str(i),' ���Ͻ�Ӧ�����ڲ���Ӧ��']);
        adjust = linspace(L(i,1)+10,L(i,1)+1000,1000)'; %linspace(����,����,����)
        Com = repmat(allresults_S1(i,1:11),1000,1); %�ɷ���
        T = repmat(allresults_S1(i,12),1000,1); %�¶���
        Newset= [Com T adjust];
        [allresults_S,out_S] = model_2 (Train_S,Newset);
        for row = 1:1000
            if  out_S(1,row) < teststress(i,1)+5
                row
                outstress(i,1) = out_S(1,row);
                final_adjust(i,1)= adjust(row,1)
                break
            elseif row == 1000
                disp(['Ӧ��Ԥ�ⲻ׼��������']);
                outstress(i,1) = S(i,1);
                final_adjust(i,1)= adjust(1,1)-5
                
            end
        end
        
    elseif  S(i,1)<teststress(i,1)-5
        disp(['�� ',num2str(i),' ���Ͻ�Ӧ��С�ڲ���Ӧ��']);
        adjust = linspace(L(i,1)-10,10,5000)'; %��������100�Σ�����Ϊ5,������
        Com = repmat(allresults_S1(i,1:11),5000,1); %�ɷ���
        T = repmat(allresults_S1(i,12),5000,1); %�¶���
        Newset= [Com T adjust];
        [allresults_S,out_S] = model_2 (Train_S,Newset);
        for row = 1:5000
            if out_S(1,row) > teststress(i,1)-5
                row
                outstress(i,1) = out_S(1,row);
                final_adjust(i,1)= adjust(row,1)
                break
            elseif row==5000
                disp(['Ӧ��Ԥ�ⲻ׼��������']);
                outstress(i,1) = S(i,1);
                final_adjust(i,1)= adjust(1,1)+5
                
            end
        end
        
    else
        disp(['�� ',num2str(i),' ���Ͻ��õ�']);
        final_adjust(i,1) = L(i,1)
        outstress(i,1) = S(i,1);
    end
end

final_results = [allresults_L S final_adjust outstress ];%���ɷ�+�¶�+����Ӧ��+δ������ ��һ����֤Ӧ��  �������� ������֤Ӧ����
end