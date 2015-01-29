function Drawmap(Mapdata)
	global mapWidth;
	global mapHeight;
	global los;
	global atData;
	global sel;
	maxh=max(max(Mapdata));
	imgMap=uint8(zeros(mapHeight,mapWidth,3));
	for x=1:1:mapWidth
		for y=1:1:mapHeight
			if round(Mapdata(x,y))>0
				imgMap(y,x,2)=uint8(100+round(Mapdata(x,y)*150/maxh));
			else
				imgMap(y,x,3)=uint8(150);
			end
			cnt=0;
			if (los(x,y)==1)
				imgMap(y,x,1)=uint8(255);	%xy inversed?
			end
			if (los(x,y)==3)
				imgMap(y,x,1)=uint8(255);
				imgMap(y,x,2)=uint8(0);
				imgMap(y,x,2)=uint8(0);
			end
		end
	end


	global atDataLen;
	for i=1:atDataLen
		imgMap=drawDot(atData.UTMX(i),atData.UTMY(i),imgMap);
		if (sel(i)==true)
			imgMap=drawSel(atData.UTMX(i),atData.UTMY(i),imgMap);
		end
    end
    
	imgMap=drawContour(imgMap);

	mapColor=imgMap;
	im=imshow(mapColor);
	disp('Map Refreshed');
	Rightclick=uicontextmenu;
	uimenu(Rightclick,'label','Find Los Here','callback',@FindLOSherClick);
	uimenu(Rightclick,'label','menu2');
	set(gcf,'uicontextmenu',Rightclick);
	% set(gcf,'WindowButtonDownFcn',@ButttonDownFcn);
end



function ButttonDownFcn(hObject, eventdata, handles)  %src,event
	pt = get(gca,'CurrentPoint');
	global lastX;
	global lastY;
	global sel;
	global Map;
	x = pt(1,1);
	y = pt(1,2);
	lastX=round(x);
	lastY=round(y);
	fprintf('x=%f,y=%f\n',lastX,lastY);
	lP=updatePanel(lastX,lastY)
	if ~shiftPressed
		clearSelected;
	end
	if (lP~=0)
		sel(lP)=true;
		Drawmap(Map);
	end
end


function curSel=updatePanel(X,Y);
	global atDataLen;
	global atData;
	curSel=0;
	for ct=1:atDataLen
		[XX,YY]=map2image(atData.UTMX(ct),atData.UTMY(ct));
		if sqrt((XX-X)^2+(YY-Y)^2)<=10
			curSel=ct;
		end
	end
end

function shiftPressed=shiftPressed
	modifiers = get(gcf,'currentModifier'); %(Use an actual figure number if known)
	shiftPressed = ismember('shift',modifiers);
end


function imgout=drawDot(x2,y2,img);
	global Map;
	[x,y]=map2image(x2,y2);
	for xx=-4:4
		for yy=-4:4
			r=sqrt(xx^2+yy^2);
			if (r<=3)
				img(y+yy,x+xx,1)=uint8(255);
				img(y+yy,x+xx,2)=uint8(255);
				img(y+yy,x+xx,3)=uint8(255);
			end
		end
	end
	imgout=img;
end

function imgout=drawSel(x2,y2,img)
	global Map;
	[x,y]=map2image(x2,y2);
	for xx=-4:4
		for yy=-4:4
			r=sqrt(xx^2+yy^2);
			if (r<3)
				img(y+yy,x+xx,1)=uint8(0);
				img(y+yy,x+xx,2)=uint8(0);
				img(y+yy,x+xx,3)=uint8(0);
			end
		end
	end
	imgout=img;
end



function [Mapout] = drawContour(imgMap)
	global Map;
	global mapHeight;
	global mapWidth;
	for x=2:mapWidth-1
		for y=2:mapHeight-1
			if (((Map(x-1,y)<=0)&(Map(x,y)>0)) | ((Map(x+1,y)<=0)&(Map(x,y)>0)) | ((Map(x,y-1)<=0)&(Map(x,y)>0)) | ((Map(x,y+1)<=0)&(Map(x,y)>0)))
				imgMap(y,x,1)=uint8(0);
				imgMap(y,x,2)=uint8(0);
				imgMap(y,x,3)=uint8(0);
			end
		end
	end
	Mapout=imgMap;
end