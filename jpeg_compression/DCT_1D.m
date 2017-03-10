function out = DCT_1D(in)

N = size(in,2);
out = zeros(1,N);

for k=1:N
    sum = 0;
    for n=1:N
        sum = sum + in(n) * cos((pi/(2*N))*(2*n-1)*(k-1));
    end
    if k==1
        sum = sum * (1/sqrt(N));
    else
        sum = sum * sqrt(2/N);
    end
    out(1,k) = sum;
end
