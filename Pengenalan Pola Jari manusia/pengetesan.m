clc;clear;close all;
 
%membaca file citra
image_folder = 'test';
filenames = dir(fullfile(image_folder, '*.jpg'));
total_images = numel(filenames);
 
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
 
%inisialisasi ciri data/pembagian data
input = [metric;eccentricity];
target = zeros(1,30);
target(:,1:6) = 0;
target(:,7:12) =1;
target(:,13:18) =2;
target(:,19:24) =3;
target(:,25:30) =4;
 
%memanggil model NN hasil pelatihan
load net
output = round(sim(net,input));
 
%menghitung akurasi
[m,n] = find(output==target);
akurasi = sum(m)/total_images*100