function masks_out= multiRansac(data,numModels,diffThresh,iterNum) %[coefficients,dataInliers]
cols=size(data,2);
masks_pre=cell(numModels,1);
for i=1:numModels
    masks_pre{i,1}=zeros(1,cols);
end
for i=1:iterNum
[masks,dataRemains]=getConsensusSets(data,numModels,diffThresh);
% masks_out= updateConsensusSets(masks_pre,masks,data );
masks_pre=masks;
masks_out=masks;
end

