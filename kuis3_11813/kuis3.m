I = imread('2.jpg');
J = imresize(I, 0.3);
subplot(2,2,1),imshow(I),title('Original');
subplot(2,2,2),imshow(J),title('Resize');