function[CB,fvector]=KPE(b)

% b = double(imread('001.bmp'));
[m,n] = size(b);
cols = (m*n)/4;
k1=1;
k2 = cols;

fvector = im2col(b,[2,2],'distinct');

% fvector = fvector';

M = mean(fvector,2);%mean of each row
centroid = M;
minele = min(centroid);
temp = M./minele;
CB = [centroid+temp centroid-temp];
LC = size(CB,2); % Current size of the codebook
%Distance Calculation
N = size(fvector,2);
% 
while 1

[minIndx, dst]= VQIndex(fvector,CB); % Find the closest codewords to
%each data vector

%%%%Find the Centroids (Mean of each Cluster)
for i=1:LC
     Ind=find(minIndx==i);
     centroid(:,i)=mean(fvector(:,Ind),2);
end

LCCEN=size(centroid,2);

NANFLAG = isnan(centroid);

p = 1;
while p <= size(centroid,2)
    if  NANFLAG(1,p) == 1
        centroid(:,p) = -1;
    end
    p = p+1;
end


CBTEMP = [];
M = [];
for i=1:LCCEN

    minele = min(centroid(:,i));
    if minele ~= 0
        temp = centroid(:,i)./minele;
    else
        temp(1:12) = 1;
    end

    M = [centroid(:,i)+temp centroid(:,i)-temp];
    CBTEMP = [CBTEMP M];
end

CB = CBTEMP;
LC = size(CB,2);

if LC == 256
    break;
end

% [newImage] = recon(CB,X);

end

