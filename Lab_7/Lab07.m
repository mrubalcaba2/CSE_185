%img = im2double(imread('cameraman.png'));
%img = im2double(imread('baboon.png'));
img = im2double(imread('checkboard.png'));


sigma = 1;
alpha = 0.04;
R_threshold = 1e-5*5;

%Step 1-5
final_corner_map = Harris_corner_detector(img, sigma, alpha, R_threshold);

%Step 6: Extract corners
[corner_y, corner_x] = find(final_corner_map);

figure, imshow(img); title('Final Result: Checkboard'); hold on;
result = plot(corner_x, corner_y, 'ro');
saveas(result ,'corners_checkboard.jpg');