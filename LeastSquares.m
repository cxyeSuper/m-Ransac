function coefficient= LeastSquares(data)
A=zeros(5,5);
x=data(1,:);
y=data(2,:);
x2=x.^2;
x3=x.^3;
x4=x.^4;
y2=y.^2;
y3=y.^3;
y4=y.^4;
A(1,1)=sum(x4);
A(1,2)=sum(x3.*y);
A(1,3)=sum(x2.*y2);
A(1,4)=sum(x3);
A(1,5)=sum(x2.*y);

A(2,1)=A(1,2);
A(2,2)=sum(x2.*y2);
A(2,3)=sum(x.*y3);
A(2,4)=sum(x2.*y);
A(2,5)=sum(x.*y2);

A(3,1)=A(1,3);
A(3,2)=A(2,3);
A(3,3)=sum(y4);
A(3,4)=sum(x.*y2);
A(3,5)=sum(y3);

A(4,1)=A(1,4);
A(4,2)=A(2,4);
A(4,3)=A(3,4);
A(4,4)=sum(x2);
A(4,5)=sum(x.*y);

A(5,1)=A(1,5);
A(5,2)=A(2,5);
A(5,3)=A(3,5);
A(5,4)=A(4,5);
A(5,5)=sum(y2);

B=zeros(5,1);
B(1,1)=-sum(x2);
B(2,1)=-sum(x.*y);
B(3,1)=-sum(y2);
B(4,1)=-sum(x);
B(5,1)=-sum(y);
coefficient=A\B;


