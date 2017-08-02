# JPEG-Compression

### Procedures for JPEG encoding
1. Divide the image into 8x8 blocks
2. Subtract 128 elements of the 8x8 block from the previous step
3. Apply DCT to each block
4. Divide each block applied DCT by Normalization Matrix Q (it can be divided into 2 * Q or 3 * Q, 5 * Q, and N * Q, not just Q)
5. Zigzag coding with the elements in the block
6. Because the DC coefficient (the first element in each block) is very large, (DC coefficient of the current block - DC coefficient of the previous block) to reduce the value
7. Huffman Coding for each block

### Procedures for JPEG decoding
* Perform jpeg encoding in reverse order

### Result (for N = 1, 2, 3, 5, 10)
1. Show JPEG decoded image and original image
2. Compression rate calculation (When calculating the compression ratio, do not include the LUT used for Huffman coding)
3. PSNR(Peak Signal to Noise Ratio) calculation by comparing JPEG decoded image with original image
4. Graph of compression ratio and PSNR

* N = 1
![result_n1](https://github.com/jhlee1108/jpeg-compression/blob/master/results/result_n1.PNG)
* N = 2
![result_n2](https://github.com/jhlee1108/jpeg-compression/blob/master/results/result_n2.PNG)
* N = 3
![result_n3](https://github.com/jhlee1108/jpeg-compression/blob/master/results/result_n3.PNG)
* N = 5
![result_n5](https://github.com/jhlee1108/jpeg-compression/blob/master/results/result_n5.PNG)
* N = 10
![result_n10](https://github.com/jhlee1108/jpeg-compression/blob/master/results/result_n10.PNG)
* Graph of compression ratio and PSNR (X-axis = N)
![graph](https://github.com/jhlee1108/jpeg-compression/blob/master/results/graph.PNG)
