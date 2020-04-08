
function modelMatrix= getModelMatrix(data)
        coefMatrix=zeros(5,5);    
        while det(coefMatrix)==0
        [coefMatrix, value]=getCoefMatrix(data);
        end
        modelMatrix=coefMatrix\value;
 end


function [coefMatrix,value]=getCoefMatrix(data)
    cols=size(data,2);
    coefMatrix=zeros(5,5);
    value=zeros(5,1);
    counter=1;
    indexM=zeros(5,1);
    while size(unique(indexM),1)~=5||size(find(indexM==0),1)~=0
        index=floor(rand*cols);
        if index>0
            indexM(counter,1)=index;
            counter=counter+1;
        end
        if counter>5
            break;
        end
    end
    for i=1:5
        coefMatrix(i,1)=data(1,indexM(i,1))^2;
        coefMatrix(i,2)=data(1,indexM(i,1))*data(2,indexM(i,1));
        coefMatrix(i,3)=data(2,indexM(i,1))^2;
        coefMatrix(i,4)=data(1,indexM(i,1));
        coefMatrix(i,5)=data(2,indexM(i,1));
        value(i,1)=-1;
    end
end

