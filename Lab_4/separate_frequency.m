function [low_pass_img, high_pass_img] = separate_frequency(img, ratio)

 %% apply FFT
 frequency_map = fft2(img);
 %% shift the frequency map
 frequency_map_shifted = fftshift(frequency_map);
 %% compute low-frequency mask
 height = ratio * size(img, 1);
 width = ratio * size(img, 2);
 
 mask = zeros(size(img));
 
 x1 = floor(size(img, 2)/2) - width;
 x2 = floor(size(img, 2)/2) + width;
 y1 = floor(size(img, 1)/2) - height;
 y2 = floor(size(img, 1)/2) + height;
 
 mask(y1:y2, x1:x2, :) = 1; 
 %% separate low-frequency and high-frequency maps
 low_frequency_map_shifted = frequency_map_shifted .* mask;
 high_frequency_map_shifted = frequency_map_shifted .* (1-mask);
 %% shift frequency maps back
low_frequency_map = ifftshift(low_frequency_map_shifted);
high_frequency_map = ifftshift(high_frequency_map_shifted);
 %% apply Inverse FFT
 low_pass_img = real(ifft2(low_frequency_map));
 high_pass_img = real(ifft2(high_frequency_map));