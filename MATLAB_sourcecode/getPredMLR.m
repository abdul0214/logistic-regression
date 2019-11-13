function [ Y ] = getPredMLR( B,X )
X=[ones(size(X,1),1),X];
Y=[];
for i=1:size(X,1)
    c=[];
        num=exp(B*X(i,:)');
        denom=1+num;
        Pi=num./denom;
        c=Pi;
        [m,i]=max(c);
        Y=[Y;i];
end
end

