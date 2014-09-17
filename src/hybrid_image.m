function image = hybrid_image(im1, im2, cutoff_low, cutoff_high, hybrid_option)

fil1 = fspecial('Gaussian', 4 * cutoff_low + 1, cutoff_low);
fil2 = fspecial('Gaussian', 4 * cutoff_high + 1, cutoff_high);

im1_fil = imfilter(im1, fil1);
im2_fil = imfilter(im2, fil2);

% To extract high frequency, subtract the original image from the
% low pass filtered image
im2_fil = im2 - im2_fil;

% show two filtered images in grayscale
figure(2);
imshow(mat2gray(im1_fil));
figure(3);
imshow(mat2gray(im2_fil));

% depending on the parameter, average the image or add the image
if hybrid_option == 1
    image = im1_fil / 2.0 + im2_fil / 2.0;
elseif hybrid_option == 2
    image = im1_fil  + im2_fil;
else
    disp('Invalid option');
    return;
end

%display fft images
figure(4);
imagesc(log(abs(fftshift(fft2(im1)))));
figure(5);
imagesc(log(abs(fftshift(fft2(im2)))));
figure(6);
imagesc(log(abs(fftshift(fft2(im1_fil)))));
figure(7);
imagesc(log(abs(fftshift(fft2(im2_fil)))));
figure(8);
imagesc(log(abs(fftshift(fft2(image)))));

