function matrixClockwise(n)
    % 一個 n*n 矩陣, 數字由 1 從最中間順時鐘往外依序寫下
    % Input: n, a integer
    % Output: B, a matrix (n*n) 
    % 
    % example: 
    % >> n=5;
    % >> matrixClockwise(n)
    %
    value=2;                                           % 設定填入值的初始值
    A=[];                                              % A 矩陣歸零
    B=[];                                              % B 矩陣歸零
    %-------------------------------------------------------------------
    % 使 A 為 n*n 的零矩陣
    for ii=1:n        
        for jj=1:n
            A(ii,jj)=0;
        end
    end
    %---------------------------------------------------------------------
    % 將數字依順時針填入矩陣
    
    % 當 n 為偶數時執行
    if mod(n,2)==0
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
    %-------------------------------------------------------------------- 
    % 當 n 為奇數時執行
    else
        N=(n+1)/2;
        A(N,N)=1;

        for ii=1:n
            if mod(ii,2)==0
                for jj=1:ii
                    A(N,N-jj)=value;
                    value=value+1;
                end
                for jj=1:ii
                    A(N-jj,N-ii)=value;
                    value=value+1;
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
    end
    %------------------------------------------------------------------
    % 使 B 為 A 左上角 n*n 的矩陣
    for ii=1:n
        for jj=1:n
            B(ii,jj)=A(ii,jj);
        end
    end
    %------------------------------------------------------------------
    disp(B)                                      % 顯示 n*n 矩陣
end