function[cb,blocks]=KMCG(b)

% clear all;
% clc;

% a = imread('001.bmp');

b = double(b);

[m,n] = size(b);
cols = (m*n)/4;
k1=1;
k2 = cols;

blocks = im2col(b,[2,2],'distinct');

cb(256,4) = 0;
count=1;
cl=1;

while(count<=4)
    k1=1;
   while(k2<(cols+1))
       cb(cl,count) = median(sort(blocks(count,k1:k2)));
        for i=1:4
           if i==count
               continue;
           else
               cb(cl,i)=blocks(i,(k2/2));
           end
       end
       cl=cl+1;
       k1=k2+1;
       k2=k2+cols/(2^(count-1));
   end
   k2=cols/(2^(count));
   count=count+1;
end

% cb(:,:)
cb=cb';
% cb(:,:)

% [img] =recon(cb,blocks);
% imshow(uint8(img))