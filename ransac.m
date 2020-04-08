function [dataInl,coefficient] = ransac(data,iterTimes,diffThresh)
[maskInL,coefficients]=getMask(data,iterTimes,diffThresh);
[value,index]=max(sum(maskInL,2));
% coefficient=coefficients{index,1};
mask=maskInL(index,:);
index=find(mask==1);
dataInl=zeros(2,value);
for i=1:value
    dataInl(:,i)=data(:,index(i));
end
coefficient= LeastSquares(dataInl);
