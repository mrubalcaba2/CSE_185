function [magnitude, orientation] = sobel_feature(img)

%horizontal edge
Hy = [1,2,1;0,0,0;-1,-2,-1];
%vertical edge
Hx = [1,0,-1; 2,0,-2; 1,0,-1];

%Sobel filtering

img1 = imfilter(img, Hy); 
img2 = imfilter(img, Hx);
            
magnitude = sqrt((img1.*img1)+(img2.*img2));
orientation = atan2(img1,img2);
            


end