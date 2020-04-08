function [masks,dataRemains]=getConsensusSets(data,numModels,diffThresh)
    cols=size(data,2);
    masks=cell(numModels,1);
%     ConsensusSets=cell(numModels,1);
    dataRemains=cell(numModels,1);
    mask=ones(1,cols);
    for i=1:numModels
        mask_picked=zeros(1,cols);
        if i>1
            for j=1:i-1
               mask_picked=mask_picked+masks{j,1};
            end
        end
        mask=mask.*(~mask_picked);
        [maskInlier,dataRemain]=getConsensusSet(data,mask,diffThresh);
        masks{i,1}=maskInlier;
        dataRemains{i,1}=dataRemain;     
    end       
end


function [maskInlier,dataRemain]=getConsensusSet(data,mask,diffThresh)
    index=find(mask~=0);
    nums=size(index,2);
    dataRemain=zeros(2,nums);
    maskInlier=zeros(1,size(data,2));
    for ii=1:nums
        dataRemain(:,ii)=data(:,index(1,ii));
    end
    if(nums>=5)
        modelMatrix= getModelMatrix(dataRemain);
        A=modelMatrix(1,1);
        B=modelMatrix(2,1);
        C=modelMatrix(3,1);
        D=modelMatrix(4,1);
        E=modelMatrix(5,1);
        for ii=1:nums
            x2=dataRemain(1,ii)^2;
            xy=dataRemain(1,ii)*dataRemain(2,ii);
            y2=dataRemain(2,ii)^2;
            x=dataRemain(1,ii);
            y=dataRemain(2,ii);
            diff=abs(A*x2+B*xy+C*y2+D*x+E*y+1);
            if diff<=diffThresh
               maskInlier(1,index(1,ii))=1;
            end
        end
    end
end



