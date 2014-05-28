
function losout=findFineLOS(map,los,SX,SY,HT,HR)
	global mapWidth;
	global mapHeight;
	global xl;
	global yl;
	EarthDiameter=12756;
	D=EarthDiameter*1000;
	Thh=HT+map(SX,SY);
	los=ones(mapWidth+1,mapHeight+1);
	los=los*2;
	for x=1:1:mapWidth
		if abs(SX-x)>SY
			[xl,yl]=makeLine(SX,SY,x,1,abs(SX-x),xl,yl);
		else
			[xl,yl]=makeLine(SX,SY,x,1,SY,xl,yl);
		end
		los=fineLLOS(map,los,xl,yl,Thh,HR,D);
	end
disp('x upper');
	for x=1:1:mapWidth
		if abs(SX-x)>(mapHeight-SY)+1
			[xl,yl]=makeLine(SX,SY,x,mapHeight,abs(SX-x),xl,yl);
		else
			[xl,yl]=makeLine(SX,SY,x,mapHeight,mapHeight-SY+1,xl,yl);
		end
		los=fineLLOS(map,los,xl,yl,Thh,HR,D);
	end
disp('x lower');
	for y=1:1:mapHeight
		if abs(SY-y)>SX 
			[xl,yl]=makeLine(SX,SY,1,y,abs(SY-y),xl,yl); 
		else
			[xl,yl]=makeLine(SX,SY,1,y,SX,xl,yl);
		end
		los=fineLLOS(map,los,xl,yl,Thh,HR,D);
	end
disp('y left');
	for y=1:1:mapHeight
		if abs(SY-y)>(mapWidth-SX)+1
			[xl,yl]=makeLine(SX,SY,mapWidth,y,abs(SY-y),xl,yl);
		else
			[xl,yl]=makeLine(SX,SY,mapWidth,y,mapWidth-SX+1,xl,yl);
		end
		los=fineLLOS(map,los,xl,yl,Thh,HR,D);
    end
disp('y right');
losout=los;
end

function [xlout,ylout]=makeLine(X1,Y1,X2,Y2,N,xl,yl)
% 	if N<1
% 		N=1;
% 	end
 	xl=X1*ones(1,N);
 	yl=Y1*ones(1,N);
	if N>1 
		dx=(X2-X1)/(N-1);
		dy=(Y2-Y1)/(N-1);
	else
		dx=0;
		dy=0;
    end
    xlout=xl+[0:1:N-1]*dx;
	ylout=yl+[0:1:N-1]*dy;
end

function losout=fineLLOS(map,los,xl,yl,Thh,HR,D);
    global alpha;
	deltaW=100;
	deltaH=100;
	alpha=-power(10,10);
	if length(xl)>2 
		dR=sqrt(power((xl(1)-xl(2))*deltaW,2)+power((yl(1)-yl(2))*deltaH,2));
	else
		dR=1;	
    end

% %  C MODE BEGIN
%  losout=CfineLLOS(map,los,xl,yl,Thh,HR,D,dR); 
% %  C MODE END

%  MATLAB MODE BEGIN
	for ct=1:1:length(xl)
		kh=D*0.5*(1-cos(2*dR*ct/D));
		if Thh+alpha*(ct)<finemap(xl(ct),yl(ct),map)-kh
			 alpha=(finemap(xl(ct),yl(ct),map)-kh-Thh)/ct;
		end
		if Thh+alpha*ct<finemap(xl(ct),yl(ct),map)-kh+HR
			los(round(xl(ct)),round(yl(ct)))=1;
		else
			if (los(round(xl(ct)),round(yl(ct)))~=1)
				los(round(xl(ct)),round(yl(ct)))=0;
			end
		end
	end

	%oneBack undefined
	oneBack=true;

	for ct=1:1:length(xl)-1
        %if (oneBack)==true
		if (((finemap(xl(ct),yl(ct),map)>finemap(xl(ct+1),yl(ct+1),map))))
			los(round(xl(ct)),round(yl(ct)))=0;
		end
	end
	losout=los;
%  MATLAB MODE END   
    
end

function [finemap]=finemap(x,y,map)
%  TOO SLOW!
% 	global mapWidth;
% 	global mapHeight;
% 	width = 1:mapWidth;
% 	height = 1:mapHeight;
%     [Y,X]=meshgrid(height, width);
%     finemap=interp2(Y,X,map,y,x);
% LOST ACCURACY
finemap=map(round(x),round(y));
% LOST ACCURACY

% OLD WAY
% 	global mapWidth;
% 	global mapHeight;
% 	fx=floor(x);
% 	cx=ceil(x);
% 	fy=floor(y);
% 	cy=ceil(y);
% 	a=x-fx;
% 	b=y-fy;
% 	if cy>mapHeight
% 		cy=mapHeight;
% 		b=1;
% 	end
% 	if cx>mapWidth
% 		cx=mapWidth;
% 		a=1;
% 	end
% 	if fy < 1 
% 		fy=1;
% 		a=0;
% 	end
% 	if fx < 1
% 		fx = 1;
% 		b=0;
%     end
%     %round removed
% 	finemap=( (1-a)*(1-b)*map(fx,fy) )+a*(1-b)*map(cx,fy) + (1-a)*b*map(fx,cy) + a*b*map(cx,cy);
% OLD WAY
end

