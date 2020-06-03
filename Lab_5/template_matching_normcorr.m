function[result, match] = template_matching_normcorr(I1, template, threshold)

    result = I1;
    shift_u = size(template,2);
    shift_v = size(template,1);
    for u = 1 + shift_u : size(I1, 2) - shift_u
        for v = 1 + shift_v : size(I1, 1) - shift_v
            x1 = u - floor(shift_u/2);
            x2 = u + floor(shift_u/2);
            y1 = v - floor(shift_v/2);
            y2 = v + floor(shift_v/2);
            patch = I1(y1:y2, x1:x2);

            patch_n = patch(:);
            template_n = template(:);
            
            patch_n = patch_n - mean(patch_n);
            template_n = template_n - mean(template_n);
            
            patch_n = patch_n/ norm(patch_n);
            template_n = template_n/norm(template_n);
            
            % Normalized Cross-Correlation
            value = (patch_n .* template_n);
            result(v, u) = value;
        end
    end
            match = (result > threshold);
            
end