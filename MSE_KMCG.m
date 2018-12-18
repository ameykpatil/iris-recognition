function[mse psnr]=MSE_KMCG(image1)

% image1 = imread('001.bmp');
% [CB1,fvector1]=KPE(image1);
% [img]=recon(CB1,fvector1);

image1 = double(image1);
[m n] = size(image1);
for i=1:5
    t = num2str(i);
    stname=strcat('img_kmcg',t,'.mat');
    x = importdata(stname);
    CB1 = cell2mat(x(1));
    fvector1 = cell2mat(x(2));
   [img]=recon(CB1,fvector1);
    
    answer =0;

    for j=1:m
        for k=1:n
            answer = answer + abs(img(j,k)-image1(j,k))*abs(img(j,k)-image1(j,k));
        end
    end
            mse(i) = answer/(m*n);
end


for i=1:5
   psnr(i) = 10*log10((255*255)/mse(i));
    
end


end