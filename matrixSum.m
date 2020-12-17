function matrixSum(n)
    if mod(n,2)~=0
        sum=1;
        if n==1
            disp(sum)
        else
            for ii=2:(n+1)/2
                sum=sum+(2*ii-1-2)^2*4+(2*ii-1-1)*10;
            end
            sum=sum+1;
            disp(sum)
        end 
    else
        sum=0;
        for ii=1:n/2
            sum=sum+(2*ii-2)^2*4+(2*ii-1)*10;
        end
        disp(sum)
    end
end