function [I, dst]=VQIndex(X,CB) 
% Distance function
% Returns the closest index of vectors in X to codewords in CB
% In other words:
% I is a vector. The length of I is equal to the number of columns in X.
% Each element of I is the index of closest codeword (column) of CB to
% coresponding column of X

L=size(CB,2);%no of codevectors
N=size(X,2);%no of training vectors

%D=zeros(L,N);
for i=1:L
    D(i,:)=sqrt(sum((repmat(CB(:,i),1,N)-double(X)).^2,1));
%set dim to 1 to compute the sum of each column, 2 to sum
%rows, etc.
end
[dst I]=min(D);
%min across each column
%[C,I] = min(...) finds the indices
%of the minimum values of A, and returns them in output
%vector I. If there are several identical minimum values,
%the index of the first one found is returned.
