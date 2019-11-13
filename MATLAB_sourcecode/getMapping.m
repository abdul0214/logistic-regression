function [ mapping ] = getMapping( Ys )
mapping=[];
for i=1:1:length(Ys)
mapping=[mapping,double(Ys(i))-64];
end

