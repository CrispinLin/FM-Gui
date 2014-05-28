
%color:int 3=orange 4=light blue
function losout=findCutoff(map,los,SX,SY,HT,Hr,Color,CutOff)
    global mapWidth;
	global mapHeight;
losout=los;
    for x=1:mapWidth
        for y=1:mapHeight
            d=sqrt((SX-x)^2+(SY-y)^2+(((map(SX,SY)+1)/100-(map(x,y)+1)/100))^2)*100;
            if (102.492-13.82*log10(HT)+(44.9-6.55*log10(HT))*log10(d))<CutOff 
                losout(x,y)=Color*losout(x,y);
            end
        end
    end
losout(losout==1)=0;
end