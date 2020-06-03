function output = gaussian_filter(img, hsize, sigma)
    H = fspecial('gaussian', hsize, sigma);
    img2 = zeros(size(img));
    shift_u = floor(hsize / 2);
    shift_v = floor(hsize / 2);
    
    for i = shift_u + 1: size(img,2) - shift_u
        for j = shift_v + 1: size(img, 1) - shift_v
            x1 = i - shift_u;  
            y1 = j - shift_v;
            x2 = i + shift_u;  
            y2 = j + shift_v;
            
            patch = img(y1:y2, x1:x2);
            patch = patch(:);
            H = H(:);
            H = H';
            img2(j, i) = H*patch;
        end
    end
    output = img2;
end