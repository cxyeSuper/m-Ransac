function [maskInL,coefficients]=getMask(data,numModels,diffThresh)
cols=size(data,2);
numInL=zeros(iterTimes,1);
maskInL=zeros(iterTimes,cols);
coefficients=cell(iterTimes,1);
for i=1:numModels
[coefMatrix,value]=getCoefMatrixandV(data);
 coefficient=coefMatrix\value;
 coefficients{i,1}=coefficient;
 A=coefficient(1,1);
 B=coefficient(2,1);
 C=coefficient(3,1);
 D=coefficient(4,1);
 E=coefficient(5,1);
 for j=1:cols
     x2=data(1,j)^2;
     xy=data(1,j)*data(2,j);
     y2=data(2,j)^2;
     x=data(1,j);
     y=data(2,j);
     diff=abs(A*x2+B*xy+C*y2+D*x+E*y+1);
     if diff<=diffThresh
         maskInL(i,j)=1;
         numInL(i,1)=numInL(i,1)+1;
     end       
end
end
end
    
         
            
            
            

    