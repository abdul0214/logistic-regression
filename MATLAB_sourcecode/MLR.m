function [ B ] = MLR( X,Y )
Y_unique=unique(Y);
X=[ones(size(X,1),1),X];
d1=length(Y_unique);
d2=size(X,2);
B=zeros(d1,d2);
Y_unique=unique(Y);
for i=1:1:d1 
    Y_blr=getY_blr(Y,Y_unique(i));
    B(i,:)=getB(B(i,:),X,Y_blr);
end
end

function [ Bn ] = getB( B,X,Y )
Bo=zeros(size(X,2),1);
for i=1:8
W=getW(X,Bo);
Pi=getPi(Bo,X);
Bn=Bo + pinv(X'*W*X)*X'*(Y-Pi);
Bo=Bn;
end
Bn=Bo;
end


function [ Pi ] = getPi(Bo,X)
Pi=[];
S=size(X,1);
W=zeros(S(1));
for i=1:1:S(1)
P=(exp(Bo'*X(i,:)'));
P=P/(1+P);
Pi=[Pi,P];
end
Pi=Pi';
end

function [ W,Ps ] = getW( X,Bo )
Ps=[];
S=size(X);
W=zeros(S(1));
for i=1:1:S(1)
num=(exp(Bo'*X(i,:)'));
denom=1+num;
P=num/denom;
RP=1-P;
size(W);
W(i,i)=P*RP;
end  
end

function [ Y_blr ] = getY_blr(Y,i)
Y_blr=Y;
Y_blr(Y==i)=1;
Y_blr(Y~=i)=0;
end



