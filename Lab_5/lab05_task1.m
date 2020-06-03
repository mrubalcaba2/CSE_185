%% Gaussian Pyramid
img = im2double(imread('lena.jpg'));
sigma = 2.0;
hsize = 7.0;
scale = 5.0;
I = img;
for s = 1:scale
    %Gaussian Filter
    I = gaussian_filter(I, hsize, sigma);
    %Save image
    imwrite(I, sprintf('Gaussian_scale%d.jpg', s));
    %Down-sampling
    I = imresize(I, 0.5);
end


%% Laplacian Pyramid
img = im2double(imread('lena.jpg'));
sigma = 2.0;
hsize = 7.0;
scale = 5.0;
I = img;
for s = 1:scale
    %Gaussian Filter
    filter_img = gaussian_filter(I, hsize, sigma);
    %Laplacian Filtering
    I = I - filter_img;
    %save or show image
    imwrite(I + 0.5, sprintf('Laplacian_scale%d.jpg', s));
    %down-sampling
    I = imresize(filter_img, 0.5);
end

%% Task 3 implementing normcorr template matching
I1 = im2double(imread('einstein1.jpg'));
template = im2double(imread('template.jpg'));
threshold = 0.5;

[result, match] = template_matching_normcorr(I1, template, threshold);

figure, imshow(rdivide(result, max(result(:))));
figure, imshow(match);

imwrite(rdivide(result, max(result)),'normCorr.jpg');
imwrite(match, 'normMatch.jpg');

