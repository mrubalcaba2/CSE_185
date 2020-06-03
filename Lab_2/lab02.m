%rotate 45 degrees with forward warping
img = imread('01.jpg');
img2 = zeros(300,400,3, 'uint8');
for y1 = 1:300
    for x1 = 1:400
        x2 = round(cosd(45)*(x1 - 200) + sind(45)*(y1 - 150) + 200);
        y2 = round(-sind(45)*(x1 - 200) + cosd(45)*(y1 - 150) + 150);
       
        if(y2 >= 1 && y2 <= 300 && x2 >= 1 && x2 <= 400)
        img2(y2,x2,:) = img(y1,x1,:);
        end
    end 
end
figure, imshow(img2);
imwrite(img2, 'rotate_0.jpg');

%rotate 45 degrees with backward piping
img = imread('01.jpg');
img2 = zeros(300,400,3,'uint8');
for y1 = 1:300
    for x1 = 1:400
        x2 = round(cosd(45)*(x1 - 200) + sind(45)*(y1 - 150) + 200);
        y2 = round(-sind(45)*(x1 - 200) + cosd(45)*(y1 - 150) + 150);
       
        if(y2 >= 1 && y2 <= 300 && x2 >= 1 && x2 <= 400)
        img2(y1,x1,:) = img(y2,x2,:);
        end
    end 
end
figure, imshow(img2);
imwrite(img2, 'rotate_1.jpg');

%use medianfilter.m for lena_noisy.jpg, patch size = 3
img = im2double(imread('lena_noisy.jpg'));

patch_size = [3,3];

%%%%%%%img2 = medfilt2(img, [3,3]);
figure, imshow(img2);
img_median = median_filter(img, patch_size);
imwrite(img_median, 'median_0.jpg');

%use medianfilter.m for lena_noisy.jpg, patch size = 5
img = im2double(imread('lena_noisy.jpg'));

patch_size = [5,5];

%img2 = medfilt2(img, [3,3]);
figure, imshow(img2);
img_median = median_filter(img, patch_size);
imwrite(img_median, 'median_1.jpg');





