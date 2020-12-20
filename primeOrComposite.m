function primeOrComposite()  
    n=200;                                             % 此為 200*200 的矩陣
    value=2;                                           % 設定填入值的初始值
    A=[];                                              % A 矩陣歸零
    B=[];                                              % B 矩陣歸零
    %-------------------------------------------------------------------
    % 使 A 為 200*200 的零矩陣
    for ii=1:n        
        for jj=1:n
            A(ii,jj)=0;
        end
    end
    %---------------------------------------------------------------------
    % 將數字依順時針填入矩陣
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
    % 使 B 為 A 左上角 200*200 的矩陣
    for ii=1:n
        for jj=1:n
            B(ii,jj)=A(ii,jj);
        end
    end
    %------------------------------------------------------------------
    % 將所有質數點位置設為黑色, 非質數點位置設為白色, 皆不是則設為藍綠色
    mycolors=[1 1 1;0 0.9 0.79;0 0 0];              % 設定顏色
    colormap(mycolors)                              % 取用色盤
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
    image(B)                      % 顯示圖像
end

% 判斷是否為質數的function
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