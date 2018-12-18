function[newImage]=recon(CB,fvector)
%   count = 1;
%   [m,n]=size(blocks);
%   [a,b]=size(cb);
%   temp=cb;
%   sums=1:b;
%   ibi=1:n;
%   bnew=m:n;
%   while(count <= n)
%       
%      for k=1:b
%         for j=1:m
%           temp(j,k)=blocks(j,count)-cb(j,k);
%           sums(k)= sums(k)+ temp(j,k);
%         end
%      end
%      
%       c=min(sums);
%         for i = 1:b
%             if c == sums(i)
%                 ibi(1,count)= i;
%             end
%         end
%       count=count+1;
%      
%   end
%   
%   count=1;
%   
%   while(count<=n)
%      x=ibi(count);
%      for j=1:m
%          bnew(j,count) = cb(j,x);
%      end
%          count=count+1;
%   end
% %   bnew = bnew';
%   img=col2im(bnew,[2 2],[256 256],'distinct');
%   


[minIndx,dst] = VQIndex(fvector,CB);

for i=1:size(minIndx,2)
    Img(:,i) = CB(:,minIndx(i));
end
% 
newImage = col2im(Img,[2 2],[256 256],'distinct');
% subplot(1,2,1)
% imshow(uint8(x1));
% subplot(1,2,2);
imshow(uint8(newImage));
end
