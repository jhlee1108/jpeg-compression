function out = IDCT_2D(in)

N = size(in,1);
M = size(in,2);
out = zeros(N,M);

for y=1:N
    out(y,:) = IDCT_1D(in(y,:));
end

for x=1:M
    out(:,x) = IDCT_1D(out(:,x)')';
end
