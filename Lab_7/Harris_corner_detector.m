function corner_map = Harris_corner_detector(img, sigma, alpha, R_threshold)
hsize = 5;
kernel = fspecial('gaussian', hsize, sigma);
Dx = [1,0,-1]; Dy = [1;0;-1];

%Step 1: Image Gradients
gauss_img = imfilter(img, kernel, 'replicate');
figure, imshow(gauss_img);title('Gaussian Filter');
imwrite(gauss_img,'gaussian_checkboard.jpg');

Ix = imfilter(gauss_img, Dx, 'replicate'); 
Iy = imfilter(gauss_img, Dy, 'replicate');

figure, imshow(Ix + 0.5);title('Ix'); 
imwrite(Ix, 'Ix_checkboard.jpg');
figure, imshow(Iy + 0.5);title('Iy'); 
imwrite(Iy, 'Iy_checkboard.jpg');

%Step 2: Products of Gradients
Ixx = Ix .* Ix;
Iyy = Iy .* Iy;
Ixy = Ix .* Iy;

%Step 3: Matrix M
Sxx = imfilter(Ixx, kernel);
Syy = imfilter(Iyy, kernel);
Sxy = imfilter(Ixy, kernel);

%Step 4: Corner Response
R = ((Sxx .* Syy) - (Sxy .* Sxy)) - alpha*((Sxx + Syy).^2);
corner_response = imagesc(R);
saveas(corner_response,'corner_response_checkboard.jpg');
response_threshold = R>R_threshold;
figure, imshow(response_threshold);title('Threshold'); 
imwrite(response_threshold, 'corner_response_threshold_chckboard.jpg');

%Step 5: Non_maxima suppression
local_maxima = imregionalmax(R);
figure, imshow(local_maxima);title('Local Maxima'); 
imwrite(local_maxima, 'local_maxima_checkboard.jpg');
corner_map = response_threshold & local_maxima;
figure, imshow(corner_map);title('Corner Map'); 
imwrite(corner_map, 'corner_map_checkboard.jpg');


end

