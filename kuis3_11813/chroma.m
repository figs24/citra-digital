A = imread('2.jpg');

%chroma subsampling
Y=0.299*A(:,:,1)+0.587*A(:,:,2)+0.114*A(:,:,3);
Cb=-0.1687*A(:,:,1)-0.3313*A(:,:,2)+0.5*A(:,:,3)+128;
Cr=0.5*A(:,:,1)-0.4187*A(:,:,2)-0.0813*A(:,:,3)+128;

%MSE
Z =double(A);
Y2 = double(Y);
Cb2 = double(Cb);
Cr2 = double(Cr);
M=256;
N=256;
    %MSE for Y
    for y = 1:256
        for x = 1:256
            MSE = (1/(M*N))*((Z(x,y))-(Y2(x,y)))^2;
        end
    end
    %MSE for Cb
    for y = 1:256
        for x = 1:256
            MSE2 = (1/(M*N))*((Z(x,y))-(Cb2(x,y)))^2;
        end
    end
    %MSE for Cr
    for y = 1:256
        for x = 1:256
            MSE3 = (1/(M*N))*((Z(x,y))-(Cr2(x,y)))^2;
        end
    end
    
disp('MSE Y = ');  
disp(MSE);
disp('MSE Cb = ');  
disp(MSE2);
disp('MSE Cr = ');  
disp(MSE3);

%PSNR
psnrY = 20*log10(255/sqrt(MSE));
psnrCb = 20*log10(255/sqrt(MSE2));
psnrCr = 20*log10(255/sqrt(MSE3));




figure
subplot(221);imshow(A);title('ori image')
subplot(222);imshow(Y);title('Y components')
subplot(223);imshow(Cb);title('Cb components')
subplot(224);imshow(Cr);title('Cr components')