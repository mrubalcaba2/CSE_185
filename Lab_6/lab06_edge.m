img = im2double((imread('lena.jpg')));

% compute gradient magnitude and orientation with Sobel filter
[magnitude, orientation] = sobel_feature(img);

% apply thresholding to detect edge
threshold = 0.3;
e = magnitude > threshold;
figure,imshow(e);

% use built-in function to detect edge
%e1 = img; % change img to sobel edge detection
e1 = edge(img, 'Sobel');
%e2 = img; % change img to canny edge detection
e2 = edge(img, 'Canny');

figure, imshow(e1); title('Sobel Edge');
figure, imshow(e2); title('Canny Edge');
imwrite(e1, 'lena_sobel_edge.jpg');
imwrite(e2,'lena_canny_edge.jpg');