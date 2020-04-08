function masks_out1= updateConsensusSets(masks1,masks2,data )
    numModels=size(masks1,1);
    cols=size(data,2);
    masks_out=zeros(numModels,cols);
    masks_out1=cell(numModels,1);
    masks_1=zeros(numModels,cols);
    masks_2=zeros(numModels,cols);
    for i=1:numModels
        masks_1(i,:)=masks1{i,1};
        masks_2(i,:)=masks2{i,1};
    end
    masks=masks_2;
    w=1;
    while w<=numModels
      diffMask=masks_1(w,:)-masks(w,:);
     
    end
    
    for i=1:numModels
        masks_out1{i,1}= masks_out(i,:);
    end
end