% Generate Scatter Points
% interval:100
% input:null
% output:a vector for x and a vector for y
function [X,Y]=GenScatterPoints(map,x1,x2,y1,y2,d)
	% n=1;
	% for k=x1:d:x2
	% 	for l=y1:d:y2
	% 		if map(k,l)>=0
	% 			X(n)=k;
	% 			Y(n)=l;
	% 			n=n+1;
	% 		end
	% 	end
	% end
	[X,Y]=find(map(x1:d:x2,y1:d:y2)>0);
	X=((X-1)*d+x1)';
	Y=((Y-1)*d+y1)';
end