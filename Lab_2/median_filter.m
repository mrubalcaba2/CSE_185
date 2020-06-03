function output = median_filter(img, patch_size)
        img2 = zeros(size(img));
        shift_u = floor(patch_size(1)/2);
        shift_v = floor(patch_size(2)/2);
        
        for u = shift_u + 1:size(img, 2) - shift_u
            for v = shift_v + 1:size(img, 1) - shift_v
                x1 = u - shift_u;
                x2 = u + shift_u;
                y1 = v - shift_v;
                y2 = v + shift_v;
            
                patch = img(y1:y2, x1:x2);
                avg = median(patch(:));
                img2(v, u) = avg;
            end
        end
        output = img2;   
end