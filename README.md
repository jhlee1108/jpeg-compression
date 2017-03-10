# JPEG-Compression

###Procedures for JPEG encoding
1. Divide the image into 8x8 blocks
2. Subtract 128 elements of the 8x8 block from the previous step
3. Apply DCT to each block
4. Divide each block applied DCT by Normalization Matrix Q (it can be divided into 2 * Q or 3 * Q, 5 * Q, and N * Q, not just Q)
5. Zigzag coding with the elements in the block
6. Because the DC coefficient (the first element in each block) is very large, (DC coefficient of the current block - DC coefficient of the previous block) to reduce the value
7. Huffman Coding for each block

###Procedures for JPEG decoding
* Perform jpeg encoding in reverse order

### Result (for N = 1, 2, 3, 5, 10)
1. Compression rate calculation (When calculating the compression ratio, do not include the LUT used for Huffman coding)
2. PSNR(Peak Signal to Noise Ratio) calculation by comparing JPEG decoded image with original image
3. Graph of compression ratio and PSNR
