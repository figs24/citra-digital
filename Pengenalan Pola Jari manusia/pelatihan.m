clc;clear;close all;
 
%membaca file citra
image_folder = 'train';
filenames = dir(fullfile(image_folder, '*.jpg'));
total_images = numel(filenames);
 
%melakukan pengolahan citra terhadap seluruh file
for n = 1:total_images
    %membaca image
    full_name= im2double(imread(fullfile(image_folder, filenames(n).name)));
    % rgb to gray
    I=rgb2gray(full_name);
    %grayscale to biner
    K = imbinarize(I,0.55);
    %melakukan operasi komplemen
    K = imcomplement(K);
    %melakukan morfologi
    %1. filling holes
    K = imfill(K,'holes');
    %2.area opening
    K = bwareaopen(K,5000);
    %mengembalikan pengukuran untuk kumpulan properti untuk setiap komponen (objek) 
    %yang terhubung 8 dalam gambar biner, BW
    stats = regionprops(K,'Area','Perimeter','Eccentricity');
    area(n) = stats.Area;
    perimeter(n) = stats.Perimeter;
    metric(n) = 4*pi*area(n)/(perimeter(n)^2);
    eccentricity(n) = stats.Eccentricity;
end
 
%inisialisasi ciri data/membagi data
input = [metric;eccentricity];
target = zeros(1,70);
target(:,1:14) = 0;
target(:,15:28) =1;
target(:,29:42) =2;
target(:,43:56) =3;
target(:,57:70) =4;
 
%model Neural Network (NN)
net = newff(input,target,[140 70],{'logsig','logsig'},'trainlm');
net.trainParam.epochs = 1000;
net.trainParam.goal = 1e-6;
net = train(net,input,target);
output = round(sim(net,input));
%menyimpan variable net hasil Pelatihan
save net.mat net
 %menghitung akurasi
[m,n] = find(output==target);
akurasi = sum(m)/total_images*100