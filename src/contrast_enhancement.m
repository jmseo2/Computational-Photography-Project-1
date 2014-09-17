im = im2single(imread('../images/buildings.jpg'));
im = rgb2gray(im); % convert to grayscale

[imh, imw] = size(im);

%gamma correction
gamma = 1.5;
c = 1;
corrected = c * (im .^ gamma);

figure(1);
imshow(im);
figure(2);
imshow(corrected);

% histogram equalization
im2 = im2uint8(im);
h = imhist(im2);
c = cumsum(h);
N = imh * imw;
cmin = min(c);

for i = 1:imh
    for j = 1:imw
        intensity = im2(i, j);
        im2(i, j) = floor(255 * (c(intensity) - cmin) / (N - cmin));
    end
end

figure(3);
imshow(im2);
