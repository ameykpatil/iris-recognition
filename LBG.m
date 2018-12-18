function[CB,X]=LBG(b)

%b=imread('C:\Documents and Settings\neesha\Desktop\BE\programs\002.bmp');

% b = double(imread('001.bmp'));

% x1 = imread('001.bmp');
x1 = double(b);

e = .01;
X = im2col(x1,[2 2],'distinct'); %each column is vector

d=size(X,1); % Dimension
N=size(X,2); % Number of vectors
M=mean(X,2); % Mean Vector
% % % % mean(A,2) is a column vector containing the 
% % % % mean value of each row.
CB=[M*(1+e) M*(1-e)]; 
LC=size(CB,2); % Current size of the codebook
% % % % Distance Calculation

while 1
    
[minIndx, dst]= VQIndex(X,CB); % Find the closest codewords to each data vector

% % % % % Find the Centroids (Mean of each Cluster)
for i=1:LC
     Ind= find(minIndx==i);
     if Ind~=0
        CB(:,i)= mean(X(:,Ind),2);
     end
end
          
CB=[CB*(1+e) CB*(1-e)];
LC=size(CB,2);
if LC == 256
     break;
end  
end
end
% ---------reconsruction code----------
% [minIndx,dst] = VQIndex(X,CB);
% 
% for i=1:size(minIndx,2)
%     Img(:,i) = CB(:,minIndx(i)); % stego is index based cover image
% end
% % 
% newImage = col2im(Img,[2 2],[256 256],'distinct');
% subplot(1,2,1)
% imshow(uint8(x1));
% subplot(1,2,2);
% imshow(uint8(newImage));

% end