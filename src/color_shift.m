im = im2single(imread('../images/brick2.jpg'));

figure(1);
imshow(im);

[imh, imw, dim] = size(im);

Lab1 = rgb2lab(im);
Lab2 = rgb2lab(im);

gamma1 = 1.05;
gamma2 = 0.5;

for i = 1:imh
    for j = 1:imw
        if Lab1(i, j, 2) > 0
            Lab1(i, j, 2) = Lab(i, j, 2)^gamma1;
        end
        
        if Lab2(i, j, 3) > 0
            Lab2(i, j, 3) = Lab2(i, j, 3)^gamma2;
        end
    end
end
rgb1 = lab2rgb(Lab1);
rgb2 = lab2rgb(Lab2);

figure(2);
imshow(rgb1);
figure(3);
imshow(rgb2);