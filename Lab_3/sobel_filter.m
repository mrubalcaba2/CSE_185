function filter = sobel_filter(img, kernel)
        img2 = zeros(size(img));
        
        for i = 2: size(img,2) - 1
            for j = 2: size(img, 1) - 1
                x1 = i - 1;  
                y1 = j - 1;
                x2 = i + 1;  
                y2 = j + 1;
                
                patch = img(y1:y2, x1:x2);
                patch = patch(:);
                kernel = kernel(:);  
                val = kernel.*patch;
                img2(j, i) = sum(val);
            end
        end
       filter = img2;   
 end