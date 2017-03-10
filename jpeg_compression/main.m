function main
input = imread('Lena.bmp');
x = [1,2,3,5,10];

[enco,tables] = JPEG_ENCO(input,1);
output = JPEG_DECO(enco,tables,1);
y(1) = psnr(input,output);
temp = size(enco,1) * size(enco,2);
temp2 = size(input,1) * size(input,2);
z(1) = ((temp2 - temp) / temp2) * 100;
figure,subplot(1,2,1),imshow(input);
title('N=1');
subplot(1,2,2),imshow(output);
title('N=1');
disp('N=1');
whos input enco output tables

[enco,tables] = JPEG_ENCO(input,2);
output = JPEG_DECO(enco,tables,2);
y(2) = psnr(input,output);
temp = size(enco,1) * size(enco,2);
temp2 = size(input,1) * size(input,2);
z(2) = ((temp2 - temp) / temp2) * 100;
figure,subplot(1,2,1),imshow(input);
title('N=2');
subplot(1,2,2),imshow(output);
title('N=2');
disp('N=2');
whos input enco output tables

[enco,tables] = JPEG_ENCO(input,3);
output = JPEG_DECO(enco,tables,3);
y(3) = psnr(input,output);
temp = size(enco,1) * size(enco,2);
temp2 = size(input,1) * size(input,2);
z(3) = ((temp2 - temp) / temp2) * 100;
figure,subplot(1,2,1),imshow(input);
title('N=3');
subplot(1,2,2),imshow(output);
title('N=3');
disp('N=3');
whos input enco output tables

[enco,tables] = JPEG_ENCO(input,5);
output = JPEG_DECO(enco,tables,5);
y(4) = psnr(input,output);
temp = size(enco,1) * size(enco,2);
temp2 = size(input,1) * size(input,2);
z(4) = ((temp2 - temp) / temp2) * 100;
figure,subplot(1,2,1),imshow(input);
title('N=5');
subplot(1,2,2),imshow(output);
title('N=5');
disp('N=5');
whos input enco output tables

[enco,tables] = JPEG_ENCO(input,10);
output = JPEG_DECO(enco,tables,10);
y(5) = psnr(input,output);
temp = size(enco,1) * size(enco,2);
temp2 = size(input,1) * size(input,2);
z(5) = ((temp2 - temp) / temp2) * 100;
figure,subplot(1,2,1),imshow(input);
title('N=10');
subplot(1,2,2),imshow(output);
title('N=10');
disp('N=10');
whos input enco output tables

figure,plot(x,y);
title('psnr');

figure,plot(x,z);
title('compression');
end