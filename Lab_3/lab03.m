%implement sobel filter using Hy filter
img = im2double(imread('lena.jpg'));
Hy = [1, 0, -1; 2, 0, -2; 1, 0, -1];
img_sobel = sobel_filter(img, Hy);
figure, imshow(img_sobel);
imwrite(img_sobel, 'sobel_y.jpg');

%sobel filter using Hx filter
img = im2double(imread('lena.jpg'));
Hx = [1, 2, 1; 0, 0, 0; -1, -2, -1];
img_sobel = sobel_filter(img, Hx);
figure, imshow(img_sobel);
imwrite(img_sobel, 'sobel_x.jpg');

%Break 2D filter to 1D filter (column-row)
img = im2double(imread('lena.jpg'));
HY1 = [1, 2, 1; 1, 2, 1; 1, 2, 1];
HY2 = [1, 0, -1];
[rows,cols] = size(img);
img2 = zeros(rows+2, cols+2);
img2(1+1:rows+1,1+1:cols+1) = img;
output = zeros(rows+2, cols+2);
output2 = zeros(rows, cols);
for i = 1:rows
    for j = 1:cols
        output(i:i+2,j) = sum(HY1.*img2(i:i+2,j:j+2), 1);
        output2(i,j) = sum(HY2'.*output(i:i+2,j));
    end
end
figure, imshow(output2);
imwrite(img_sobel, 'sobel_cr.jpg');

%Break 2D filter to 1D filter (row-column)
img = im2double(imread('lena.jpg'));
HY1 = [1, 2, 1; 1, 2, 1; 1, 2, 1];
HY2 = [1, 0, -1];
[rows,cols] = size(img);
img2 = zeros(rows+2, cols+2);
img2(1+1:rows+1,1+1:cols+1) = img;
output = zeros(rows+2, cols+2);
output2 = zeros(rows, cols);
for i = 1:rows
    for j = 1:cols
        output(i:i+2,j) = sum(HY1.*img2(i:i+2,j:j+2), 2);
        output2(i,j) = sum(HY2'.*output(i:i+2,j));
    end
end
figure, imshow(output2);
imwrite(img_sobel, 'sobel_rc.jpg');

%Implement gaussian filter hsize = 5, sigma = 2
img = im2double(imread('lena.jpg'));
img_gaussian = gaussian_filter(img, 5, 2);
figure, imshow(img_gaussian);
imwrite(img_gaussian, 'gaussian_5.jpg');

%Implement gaussian filter hsize = 9, sigma = 4
img = im2double(imread('lena.jpg'));
img_gaussian = gaussian_filter(img, 9, 4);
figure, imshow(img_gaussian);
imwrite(img_gaussian, 'gaussian_9.jpg');