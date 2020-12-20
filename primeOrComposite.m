function primeOrComposite()  
    n=200;                                             % ���� 200*200 ���x�}
    value=2;                                           % �]�w��J�Ȫ���l��
    A=[];                                              % A �x�}�k�s
    B=[];                                              % B �x�}�k�s
    %-------------------------------------------------------------------
    % �� A �� 200*200 ���s�x�}
    for ii=1:n        
        for jj=1:n
            A(ii,jj)=0;
        end
    end
    %---------------------------------------------------------------------
    % �N�Ʀr�̶��ɰw��J�x�}
    N=n/2;
    A(N,N)=1;

    for ii=1:n
        if mod(ii,2)==0
            for jj=1:ii
                if N-jj~=0
                    A(N,N-jj)=value;
                    value=value+1;
                end
            end
            for jj=1:ii
                if (N-ii~=0)&&(N-jj~=0)
                    A(N-jj,N-ii)=value;
                    value=value+1;
                end
            end
            N=N-ii;
        else
            for jj=1:ii
                A(N,N+jj)=value;
                value=value+1;    
            end
            for jj=1:ii
                A(N+jj,N+ii)=value;
                value=value+1; 
            end
            N=N+ii;
        end
    end
    %------------------------------------------------------------------
    % �� B �� A ���W�� 200*200 ���x�}
    for ii=1:n
        for jj=1:n
            B(ii,jj)=A(ii,jj);
        end
    end
    %------------------------------------------------------------------
    % �N�Ҧ�����I��m�]���¦�, �D����I��m�]���զ�, �Ҥ��O�h�]���ź��
    mycolors=[1 1 1;0 0.9 0.79;0 0 0];              % �]�w�C��
    colormap(mycolors)                              % ���Φ�L
    for ii=1:n
        for jj=1:n
            B(ii,jj)=A(ii,jj);
            if B(ii,jj)==1
                B(ii,jj)=2;
            elseif pOrC(B(ii,jj))>0
                B(ii,jj)=1;
            else
                B(ii,jj)=3;
            end
        end
    end
    image(B)                      % ��ܹϹ�
end

% �P�_�O�_����ƪ�function
function s=pOrC(n)
    s=0;
    for ii=2:floor(sqrt(n))
        if mod(n,ii)~=0
            t=0;
        else
            t=1;
        end
        s=s+t;
    end
end