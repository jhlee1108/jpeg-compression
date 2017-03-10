function out = JPEG_DECO(enco,tables,N)
Q = [16, 11, 10, 16, 24, 40, 51, 61;
    12, 12, 14, 19, 26, 58, 60, 55;
    14, 13, 16, 24, 40, 57, 69, 56;
    14, 17, 22, 29, 51, 87, 80, 62;
    18, 22, 37, 56, 68, 109, 103, 77;
    24, 35, 55, 64, 81, 104, 113, 92;
    49, 64, 78, 87, 103, 121, 120, 101;
    72, 92, 95, 98, 112, 100, 103, 99];
l=length(tables);
W=tables{l};
H=tables{l-1};
out = zeros(H,W);
a=1;
b=1;
for i=1:l-2,
    dict = tables{i};
    n = dict{257};
    e = enco(1:n);
    enco(1:n) = [];
    d = myhuffmandeco(e,dict);
    d = double(d) - 128;
    izd = izigzag(d);
    dq = izd.*(N*Q);
    idd = IDCT_2D(dq);
    d2 = round(idd+128);
    out(a:a+7,b:b+7) = uint8(d2);
    b = b + 8;
    if b > W
        b = 1;
        a = a + 8;
    end
    
end

out = uint8(out);
end