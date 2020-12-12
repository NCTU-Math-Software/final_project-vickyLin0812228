function matrixClockwise(n)
    value=2;
    A=[];
    B=[];
    for ii=1:n
        for jj=1:n
            A(ii,jj)=0;
        end
    end
    
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
    
    for ii=1:n
        for jj=1:n
            B(ii,jj)=A(ii,jj);
        end
    end
    disp(B) 
end
