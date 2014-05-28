
function [x1,y1]=map2image(x,y)
	xcorner=569724.6875;deltaW=100;mapWidth=724;
	x1=10;
	if (x>xcorner) & (x<xcorner+deltaW*mapWidth) 
		x1=round((x-xcorner)/deltaW);
	end
	ycorner=6808687.5;deltaH=100;mapHeight=1117;
	y1=10;
	if (y>=ycorner) & (y<ycorner+deltaH*mapHeight) 
		y1=round((ycorner-y)/deltaH)+1116;
	end
end