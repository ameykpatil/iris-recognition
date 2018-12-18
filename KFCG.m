function[CB,fvector]=KFCG(b)

% clear all;
% clc;

% cimg = imread('005.bmp');
cimg = double(b);

fvector = im2col(cimg,[2,2],'distinct');
fvector=fvector';
%-------------------------------------------------------------------------%
CB(1,:) = mean(fvector);
N1 = 1;
i = 1;
m = 1;

Q1(1,1) = {fvector};

N = 256;

while N1 <= N/2
    for n=1:N1
     
        A=[];
        B=[];

        x1 = cell2mat(Q1(1,n));
        nrows = size(x1,1);
        
        for j = 1:nrows % all training vectors in x are considered
            if CB(n,i) <= x1(j,i)
                A = [ A ; x1(j,:)];
            else
                B = [ B ; x1(j,:)];
            end
        end
        

            Q(1,m) = {A};
            CBX(m,:) = mean(A);
         
            Q(1,m+1) = {B};
            CBX(m+1,:) = mean(B);
            m = m+2;
          
    end
 
    CB = CBX;
    N1 = 2*N1;
    m = 1;
    i = i+1;
    if i == 4
        i=1;
    end
    Q1 = Q;
end
clear CBX;

%-------------------------------------------------------------------------%

CB=CB';
fvector=fvector';

% [img]=recon(CB,fvector);
% 
% subplot(1,2,1);
% imshow(uint8(cimg));
% subplot(1,2,2);
% imshow(uint8(img));