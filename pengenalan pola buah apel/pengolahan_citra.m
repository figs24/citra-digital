clc; clear; close all; warning off all;

%memanggil menu"browse file"
[nama_file,nama_folder]=uigetfile('*.jpg');

%jika ada nama file yang di pilih makan akan di ekseskusi
if ~isequal(nama_file,0)
    Img=im2double(imread(fullfile(nama_folder,nama_file)));
    %figure,imshow(Img);
    
    %konversi ke grayscale
    Img_gray=rgb2gray(Img);
    %figure,imshow(Img_gray);
    
    %grayscale to biner
    bw=imbinarize(Img_gray,0.5);
    %figure,imshow(bw);
    
    %melakukan operasi komplemen
    bw=imcomplement(bw);
    %figure,imshow(bw);
    
    %melakukan morfologi
    %1. filling holes
    bw=imfill(bw,'holes');
    %figure,imshow(bw);
    
    %2.area opening
    bw=bwareaopen(bw,100);
    %figure,imshow(bw);
    
    %ekstraksi ciri warna rgb
    R=Img(:,:,1);
    G=Img(:,:,2);
    B=Img(:,:,3);
    R(~bw)=0;
    G(~bw)=0;
    B(~bw)=0;
    RGB=cat(3,R,G,B);
    %figure,imshow(RGB);
    Red=sum(sum(R))/sum(sum(bw));
    Green=sum(sum(G))/sum(sum(bw));
    Blue=sum(sum(B))/sum(sum(bw));
    
    %melakukan penyusuna variable ciri uji
    ciri_uji=[Red,Green,Blue];
    
    %memanggil model KNN hasil pelatihan
    load Mdl

    %membaca class kluaran hasil pengujian
    hasil_uji=predict(Mdl,ciri_uji);
    
    %menampilkan citra asli dan class keluaran
    figure,imshow(Img)
    title({['Nama File: ',nama_file],['kelas keluaran: ',hasil_uji{1}]})
else
    return
end
    
    
    