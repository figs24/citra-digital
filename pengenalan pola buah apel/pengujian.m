clc; clear; close all; warning off all;

%apel merah
%membaca file citra
nama_folder='data uji/apel merah';
nama_file=dir(fullfile(nama_folder,'*.jpg'));
jumlah_file=numel(nama_file);

%menginisialisasi variable ciri merah dan target merah
ciri_merah=zeros(jumlah_file,3);
target_merah=cell(jumlah_file,1);

%melakukan pengolahan citra terhadap seluruh file
for n=1:jumlah_file
    %membaca file citra rgb
    Img=im2double(imread(fullfile(nama_folder,nama_file(n).name)));
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
    
    %mengisi variable ciri merah hasil ekstraksi
    ciri_merah(n,1)=Red;
    ciri_merah(n,2)=Green;
    ciri_merah(n,3)=Blue;
    %mengisi variable target merah dengan nama class
    target_merah{n}='apel merah';
    
    
    
end

%apel hijau
%membaca file citra
nama_folder='data uji/apel hijau';
nama_file=dir(fullfile(nama_folder,'*.jpg'));
jumlah_file=numel(nama_file);

%menginisialisasi variable ciri hijau dan target hijau
ciri_hijau=zeros(jumlah_file,3);
target_hijau=cell(jumlah_file,1);

%melakukan pengolahan citra terhadap seluruh file
for n=1:jumlah_file
    %membaca file citra rgb
    Img=im2double(imread(fullfile(nama_folder,nama_file(n).name)));
    %figure,imshow(Img);
    
    %konversi ke grayscale
    Img_gray=rgb2gray(Img);
    %figure,imshow(Img_gray);
    
    %grayscale to biner
    bw=imbinarize(Img_gray,0.6);
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
    
    %mengisi variable ciri merah hasil ekstraksi
    ciri_hijau(n,1)=Red;
    ciri_hijau(n,2)=Green;
    ciri_hijau(n,3)=Blue;
    %mengisi variable target merah dengan nama class
    target_hijau{n}='apel hijau';
    
    
    
end

%menyusun variable ciri latih dan target latih
ciri_uji=[ciri_merah;ciri_hijau];
target_uji=[target_merah;target_hijau];

%memanggil model KNN hasil pelatihan
load Mdl

%membaca class kluaran hasil pengujian
hasil_uji=predict(Mdl,ciri_uji);

%menghitung akurasi
jumlah_benar=0;
jumlah_data=size(ciri_uji,1);
for k=1:jumlah_data
    if isequal(hasil_uji{k},target_uji{k})
        jumlah_benar=jumlah_benar+1;
    end
end

akurasi_pengujian=jumlah_benar/jumlah_data*100


