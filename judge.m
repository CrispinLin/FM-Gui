function [x1]=judge(x)
    f=floor(x);
if (x-f<0.5) 
	x1=f;
elseif (x-f>0.5) 
    x1=f+1;
elseif(mod(x,2)<1)
    x1=f;
else
    x1=f+1;
end
