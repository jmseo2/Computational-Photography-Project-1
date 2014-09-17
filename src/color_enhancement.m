im = im2single(imread('../images/forest.jpg'));
hsv = rgb2hsv(im); % convert to hsv colorspace

[imh, imw] = size(im);

gamma = 0.6;
hsv(:, :, 2) = hsv(:, :, 2) .^ gamma;

figure(1);
imshow(im);
figure(2);
imshow(hsv2rgb(hsv));