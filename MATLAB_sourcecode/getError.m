function [ er_ratio ] = getError( Y,Yn )
error=1;
for i=1:1:length(Yn)
    if Y(i)~=Yn(i)
    error=error+1;
    end
end
er_ratio=error/length(Yn);
end