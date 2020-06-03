%img = im2double(imread('lines.png'));
%img = im2double(imread('hill.png'));
img = im2double(imread('bridge.png'));

edge_map = edge(rgb2gray(img), 'canny',0.1,3);

%Hough Transform (m,b)
[m,b] = hough_transform(edge_map);
x = 1:size(img,2);
y = (m*x)+ b;

%subplot(2,2,1);
figure, imshow(img); title('Hough Transform (m,b)'); hold on;
plot(x, y, 'LineWidth', 4, 'Color', 'red');
result = gcf;
saveas(result, sprintf('bridge_mb_line.png'));

%Hough Transform Polar(r,theta)
[r,theta] = hough_transform_polar(edge_map);
x = 1:size(img,2);
y = -(cos(theta)/sin(theta))*x + (r/(sin(theta)));

figure, imshow(img); title('Hough Transform (r,theta)'); hold on;
plot(x, y, 'LineWidth', 4, 'Color', 'blue');
result = gcf;
saveas(result, sprintf('bridge_polar_line.png'));


