img1 = im2double(imread('data/Army/frame10.png'));
img2 = im2double(imread('data/Army/frame11.png'));

I1 = rgb2gray(img1);
I2 = rgb2gray(img2);

window_size = 50;
k = 4;

w = floor(window_size/2);
shift = w + 10;


Ix_m = imfilter(I1, [1 -1; 1 -1], 'replicate');
Iy_m = imfilter(I1, [1 1; -1 -1], 'replicate');

u = zeros(size(I1)); u_next = zeros(size(I1));
v = zeros(size(I1)); v_next = zeros(size(I1));

for t = 1 : k
    for i = 1 + shift : size(Ix_m, 1) - shift
        for j = 1 + shift : size(Ix_m, 2) - shift
            % extract Ix, Iy, It from local window
            Ix = Ix_m(i-w : i+w, j-w : j+w);
            Iy = Iy_m(i-w : i+w, j-w : j+w);
            
            i2 = floor(i + v(i, j));
            j2 = floor(j + u(i, j));
            It = I1(i - w : i + w, j - w : j + w) - I2(i2 - w : i2 + w, j2 - w : j2 + w);
            
            % convert Ix, Iy, It to vectors
            Ix = Ix(:); Iy = Iy(:); It = It(:);
            
            % construct matrix A and vector b
            A = [Ix, Iy];
            b = - It;
            
            % solve A x = b
            x = A\b;
            u_next(i, j) = x(1);
            v_next(i, j) = x(2);
        end
    end
%% update flow
u = u + u_next;
v = v + v_next;
end
plot_flow(img2, u, v);
saveas(gcf, 'army_plot_flow.png');