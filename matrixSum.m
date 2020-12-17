function matrixSum(n)
    % 給定 n×n 的此種矩陣, 求其對角線 (a_i,i) 及反對角線 (a_n−i,i) 之總和
    % Input: n, an integer, 矩陣大小
    % Output: sum, an integer, 其對角線 (a_i,i) 及反對角線 (a_n−i,i) 之總和
    % 
    % example: 
    % >> n=5;
    % >> matrixSum(n)
    %---------------------------------------------------------------------------------
    % 當 n 為奇數時執行
    if mod(n,2)~=0
        sum=1;                                % 設定總和初始值
        if n==1                               % n=1 時執行
            disp(['Sum = ', num2str(sum)])    % 顯示結果
        else
            % 計算總和
            for ii=2:(n+1)/2
                sum=sum+(2*ii-1-2)^2*4+(2*ii-1-1)*10;
            end
            sum=sum+1;                        % 因為 1 重複算 2 次
            disp(['Sum = ', num2str(sum)])    % 顯示結果
        end 
    else
        sum=0;                                % 設定總和初始值
        % 計算總和
        for ii=1:n/2
            sum=sum+(2*ii-2)^2*4+(2*ii-1)*10;
        end
        disp(['Sum = ', num2str(sum)])        % 顯示結果
    end
end
