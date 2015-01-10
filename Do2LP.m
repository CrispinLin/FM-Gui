% Distance of 2 LOS Points
function Do2LP(map,X1,Y1,X2,Y2,HT,HR)
	[xl,yl]=makeLine(X1,Y1,X2,Y2)
	d=LOSDistance(map,xl,yl,HT,HR)
end

function [xlout,ylout]=makeLine(X1,Y1,X2,Y2)
	if abs(X1-X2)>abs(Y1-Y2)
		N=abs(X1-X2);
	else
		N=abs(Y1-Y2);
	end
 	xl=X1*ones(1,N+1);
 	yl=Y1*ones(1,N+1);
	if N>=1 
		dx=(X2-X1)/N;
		dy=(Y2-Y1)/N;
	else
		dx=0;
		dy=0;
    end
    xlout=xl+[0:1:N]*dx;
	ylout=yl+[0:1:N]*dy;
end



function Distance=LOSDistance(map,xl,yl,HT,HR);
    D=12756000;
    global alpha;
	deltaW=100;
	deltaH=100;
	alpha=-power(10,10);%what for?
	N=length(xl)    %not the same N

	if N<2
		Distance=0;
		return;
	end

	l =sqrt(power((xl(1)-xl(N))*deltaW,2)+power((yl(1)-yl(N))*deltaH,2))
	CosC=cos(l/D*2)
	a=D/2+finemap(xl(1),yl(1),map)+HT
	b=D/2+finemap(xl(N),yl(N),map)+HR
	c=sqrt(a^2+b^2-2*a*b*CosC)
	Distance=c;

	if N==2
		return;
	end

	CosB=(a^2+c^2-b^2)/(2*a*b);
	B=acos(CosB);
	SinB=sin(B);

	if N>2 
		dR=sqrt(power((xl(1)-xl(2))*deltaW,2)+power((yl(1)-yl(2))*deltaH,2));
		for ct=1:1:N-2
			HC=a*SinB/sin(pi-dR/D*2*ct-B);
			if HC<(D/2+finemap(xl(ct+1),yl(ct+1),map));
				Distance=0;
				return;
			end
		end
	end
end

function [finemap]=finemap(x,y,map)
	finemap=map(round(x),round(y));
end