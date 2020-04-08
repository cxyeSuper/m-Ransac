close all
clear
clc
alpha = linspace(0, 360, 50) .* (pi / 180); 
X=50*cos(alpha);
Y=30*sin(alpha);
% plot(X,Y,'c');
hold on
axis equal
% X=X+wgn(1,length(alpha),5^2,'linear'); 
% Y=Y+wgn(1,length(alpha),5^2,'linear');

beta=43*pi/180;
a1=40;
b1=30;
X1=a1*cos(alpha)*cos(beta)-b1*sin(alpha)*sin(beta)+40;
Y1=a1*cos(alpha)*sin(beta)+b1*sin(alpha)*cos(beta)+100;
% plot(X1,Y1,'LineWidth',1.5)
% X1=X1+wgn(1,length(alpha),5,'linear'); 
% Y1=Y1+wgn(1,length(alpha),5,'linear');

beta=43*pi/180;
a2=20;
b2=10;
X2=a2*cos(alpha)*cos(beta)-b2*sin(alpha)*sin(beta)+100;
Y2=a2*cos(alpha)*sin(beta)+b2*sin(alpha)*cos(beta)+30;
% plot(X1,Y1,'LineWidth',1.5)
% X2=X2+wgn(1,length(alpha),8,'linear'); 
% Y2=Y2+wgn(1,length(alpha),9,'linear');
% noise(1,:)=10*wgn(1,length(alpha),50,'linear');
% noise(2,:)=20*wgn(1,length(alpha),50,'linear');
hold on;
data=[X,X1,X2;Y,Y1,Y2];
% data=[X,X1;Y,Y1];
% data=[X1;Y1];
scatter(data(1,:),data(2,:));
% scatter(noize(1,:),noize(2,:));
maskInL1=zeros(10,size(data,2));
maskInL2=zeros(10,size(data,2));
masks_out= multiRansac(data,3,0.2,100);
% for i=1:20
%     [masks,dataRemains]=getConsensusSets(data,3,0.4);
%      maskInL1(i,:)=masks{1,1};
%      maskInL2(i,:)=masks{2,1};
% end
% [value,index]=max(sum(masks_out{1,1},2));
% coefficient=coefficients{index,1};
mask=masks_out{1,1};
index=find(mask==1);
dataInl1=zeros(2,size(index,2));
for i=1:size(index,2)
    dataInl1(:,i)=data(:,index(i));
end
coefficient= LeastSquares(dataInl1);

 A=coefficient(1,1);
 B=coefficient(2,1);
 C=coefficient(3,1);
 D=coefficient(4,1);
 E=coefficient(5,1); 
Xc = (B*E-2*C*D)/(4*A*C-B^2)
Yc = (B*D-2*A*E)/(4*A*C-B^2)
a2 = 2*(A*(Xc^2) + C*(Yc^2) + B*Xc*Yc -1)/(A + C + ((A-C)^2 + B^2)^0.5)
b2 = 2*(A*(Xc^2) + C*(Yc^2) + B*Xc*Yc -1)/(A + C - ((A-C)^2 + B^2)^0.5)
t= 1/2*atan (B/(A - C))
f=[(num2str(A)),'*x^2+',(num2str(B)),'*x*y+',(num2str(C)),'*y^2+',(num2str(D)),'*x+',(num2str(E)),'*y+1=0']
h=ezplot(f,[-100,100])

set(h,'Color','r','LineWidth',2)




% [value,index]=max(sum(sum(masks_out{2,1},2));
% coefficient=coefficients{index,1};
mask=masks_out{2,1};
index=find(mask==1);
dataInl2=zeros(2,size(index,2));
for i=1:size(index,2)
    dataInl2(:,i)=data(:,index(i));
end
coefficient= LeastSquares(dataInl2);

 A=coefficient(1,1);
 B=coefficient(2,1);
 C=coefficient(3,1);
 D=coefficient(4,1);
 E=coefficient(5,1); 
Xc = (B*E-2*C*D)/(4*A*C-B^2)
Yc = (B*D-2*A*E)/(4*A*C-B^2)
a2 = 2*(A*(Xc^2) + C*(Yc^2) + B*Xc*Yc -1)/(A + C + ((A-C)^2 + B^2)^0.5)
b2 = 2*(A*(Xc^2) + C*(Yc^2) + B*Xc*Yc -1)/(A + C - ((A-C)^2 + B^2)^0.5)
t= 1/2*atan (B/(A - C))
f=[(num2str(A)),'*x^2+',(num2str(B)),'*x*y+',(num2str(C)),'*y^2+',(num2str(D)),'*x+',(num2str(E)),'*y+1=0']
h=ezplot(f,[-100,100])

set(h,'Color','k','LineWidth',2)
% scatter(dataInl(1,:),dataInl(2,:),'r*')


mask=masks_out{3,1};
index=find(mask==1);
dataInl3=zeros(2,size(index,2));
for i=1:size(index,2)
    dataInl3(:,i)=data(:,index(i));
end
coefficient= LeastSquares(dataInl3);

 A=coefficient(1,1);
 B=coefficient(2,1);
 C=coefficient(3,1);
 D=coefficient(4,1);
 E=coefficient(5,1); 
Xc = (B*E-2*C*D)/(4*A*C-B^2)
Yc = (B*D-2*A*E)/(4*A*C-B^2)
a2 = 2*(A*(Xc^2) + C*(Yc^2) + B*Xc*Yc -1)/(A + C + ((A-C)^2 + B^2)^0.5)
b2 = 2*(A*(Xc^2) + C*(Yc^2) + B*Xc*Yc -1)/(A + C - ((A-C)^2 + B^2)^0.5)
t= 1/2*atan (B/(A - C))
f=[(num2str(A)),'*x^2+',(num2str(B)),'*x*y+',(num2str(C)),'*y^2+',(num2str(D)),'*x+',(num2str(E)),'*y+1=0']
h=ezplot(f,[-100,100])

set(h,'Color','m','LineWidth',2)

scatter(dataInl1(1,:),dataInl1(2,:),'r')
scatter(dataInl2(1,:),dataInl2(2,:),'k')
scatter(dataInl3(1,:),dataInl3(2,:),'m')