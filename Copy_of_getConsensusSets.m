function [ConsensusSets,masks,dataRemains]=Copy_of_getConsensusSets(data,numModels,diffThresh)
    cols=size(data,2);
    masks=cell(numModels,1);
    ConsensusSets=cell(numModels,1);
    dataRemains=cell(numModels,1);
    mask=ones(1,cols);
    modelMatrixs=getCoefMatrixandV(data,numModels);
    for i=1:numModels
        modelMatrix=modelMatrixs{i,1};
        if i==1
             mask=mask;
        end
        if i==2
            mask=mask.*(~( masks{i-1,1}));
        end
        if i==3
            mask=mask.*(~( masks{i-2,1}+masks{i-1,1}));
        end
        if i==4
            mask=mask.*(~( masks{i-3,1}+masks{i-2,1}+masks{i-1,1}));
        end
        if i==5
             mask=mask.*(~( masks{i-4,1}+masks{i-3,1}+masks{i-2,1}+masks{i-1,1}));
        end
        [maskInlier,dataRemain]=getConsensusSet(data,modelMatrix,mask,diffThresh);
        masks{i,1}=maskInlier;
        dataRemains{i,1}=dataRemain;
    end       
end


function [maskInlier,dataRemain]=getConsensusSet(data,modelMatrix,mask,diffThresh)
    index=find(mask~=0);
    nums=size(index,2);
    dataRemain=zeros(2,nums);
    maskInlier=zeros(1,size(data,2));
    A=modelMatrix(1,1);
    B=modelMatrix(2,1);
    C=modelMatrix(3,1);
    D=modelMatrix(4,1);
    E=modelMatrix(5,1);
    for ii=1:nums
        dataRemain(:,ii)=data(:,index(1,ii));
        x2=data(1,index(1,ii))^2;
        xy=data(1,index(1,ii))*data(2,index(1,ii));
        y2=data(2,index(1,ii))^2;
        x=data(1,index(1,ii));
        y=data(2,index(1,ii));
        diff=abs(A*x2+B*xy+C*y2+D*x+E*y+1);
        if diff<=diffThresh
           maskInlier(1,index(1,ii))=1;
        end
    end
end


