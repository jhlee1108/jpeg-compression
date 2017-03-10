function [enco,tables] = JPEG_ENCO(input,N)
Q = [16, 11, 10, 16, 24, 40, 51, 61;
    12, 12, 14, 19, 26, 58, 60, 55;
    14, 13, 16, 24, 40, 57, 69, 56;
    14, 17, 22, 29, 51, 87, 80, 62;
    18, 22, 37, 56, 68, 109, 103, 77;
    24, 35, 55, 64, 81, 104, 113, 92;
    49, 64, 78, 87, 103, 121, 120, 101;
    72, 92, 95, 98, 112, 100, 103, 99];
[H W] = size(input);
l=(H/8)*(W/8);
tables = cell(1,l);
n=1;
a=1;
for i=1:8:H,
    for j=1:8:W,
        block = input(i:i+7,j:j+7);
        b = double(block)-128;
        bd = DCT_2D(b);
        bq = round(bd./(N*Q));
        zb = zigzag(bq);
        zb128 = uint8(zb + 128);
        dict = myhuffmandict(zb128);
        e = myhuffmanenco(zb128,dict);
        dict{1,257} = length(e);
        tables{1,n} = dict;
        n = n + 1;
        for k=a:a+length(e)-1,
            enco(k) = e(k-a+1);
        end
        a = a + length(e);
    end
end
tables{n}=H;
tables{n+1}=W;
end