function out = IDCT_1D(in)

N = size(in,2);
out = zeros(1,N);

for k=1:N
    sum = 0;
    for n=1:N
        if n==1
            sum = sum + (1/sqrt(N)) * in(n) * cos(pi*(2*k-1)*(n-1)/(2*N));
        else
            sum = sum + sqrt(2/N) * in(n) * cos(pi*(2*k-1)*(n-1)/(2*N));
        end
    end
    out(1,k) = sum;
end
