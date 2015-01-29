function [T,D,B,R]=FormSubMat(Dis,gain,f)
	L=length(Dis);
	TD=Dis(1,2:L);
	BR=Dis(2:L,2:L);
	% cal B, R
	% for k=1:1:length(BR)
	%     OutdegreeBR(k)=length(find(BR(k,:)>0));
	% end
	OutdegreeBR=sum((BR>0)');
	N=length(BR)-1;
	c=3*(10^8);
	B=zeros(N,N);
	R=zeros(N,1);

% REWRITE FOR WITH MATRIX!

	for k=1:1:N
		for l=1:1:N
			if BR(k,l)>0 
				B(k,l)=1/(1+BR(k,l))*sqrt(gain^2/OutdegreeBR(k))*exp(-1i*2*pi*BR(k,l)/c*f);
			end
		end
		if BR(k,N+1)>0
			R(k,1)=1/(1+BR(k,N+1))*sqrt(gain^2/OutdegreeBR(k))*exp(-1i*2*pi*BR(k,N+1)/c*f);
		end
	end

	%cal T,D
	T=zeros(1,N);
	D=0;
	OutdegreeTD=length(find(TD>0));
	for k=1:1:N
		if TD(k)>0 
			T(1,k)=1/(1+TD(k))*sqrt(gain^2/OutdegreeTD)*exp(-1i*2*pi*TD(k)/c*f);
		end
	end
	if TD(N+1)>0
		D=1/(1+TD(N+1))*sqrt(gain^2/OutdegreeTD)/10*exp(-1i*2*pi*TD(N+1)/c*f);
	end
end