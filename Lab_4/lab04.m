%% Task 1: Split Frequency
img = im2double(imread('lena.jpg'));
ratio = 0.1;
[low_pass_img, high_pass_img] = separate_frequency(img, ratio);
figure,imshow(low_pass_img);
figure,imshow(high_pass_img + 0.5);
imwrite(low_pass_img, 'lena_low_0.1.jpg');
imwrite(high_pass_img + 0.5, 'lena_high_0.1.jpg');

%% use a ratio of 0.2 instead to view split frequency
img = im2double(imread('lena.jpg'));
ratio = 0.2;
[low_pass_img, high_pass_img] = separate_frequency(img, ratio);
figure,imshow(low_pass_img);
figure,imshow(high_pass_img + 0.5);
imwrite(low_pass_img, 'lena_low_0.2.jpg');
imwrite(high_pass_img + 0.5, 'lena_high_0.2.jpg');

%% Task 2: Hybrid Image (low-freq marilyn/high-freq einstein)
name1 = 'marilyn.jpg';
name2 = 'einstein.jpg';

img1 = im2double(imread(name1));
img2 = im2double(imread(name2));
ratio = 0.08;
img_merged = hybrid_image(img1, img2, ratio);
figure, imshow(img_merged);
imwrite(img_merged, 'hybrid_1.jpg');

%% use any ratio for hybrid image (low-freq einstein/high-freq marilyn)
name1 = 'einstein.jpg';
name2 = 'marilyn.jpg';

img1 = im2double(imread(name1));
img2 = im2double(imread(name2));
ratio = 0.08;
img_merged = hybrid_image(img1, img2, ratio);
figure, imshow(img_merged);
imwrite(img_merged, 'hybrid_2.jpg');

%% try to display the color frequency map of new_york
img = im2double(imread('new_york.jpg'));
frequency_map = fftshift(fft2(img));
figure,imagesc(log(abs(frequency_map) +1)), colormap jet;
imwrite(img, 'new_york_frequency.jpg');

%% color frequency of flowers
img = im2double(imread('flowers.jpg'));
frequency_map = fftshift(fft2(img));
figure,imagesc(log(abs(frequency_map) +1)), colormap jet;
imwrite(img, 'flowers_frequency.jpg');





