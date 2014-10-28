function [_R] = supression(_GRA, _ANG, tmin, tmax)
	[n, m] = size(_GRA);

	r = 1;
	V = zeros(2*r+1);
	R = zeros(n, m);
%	R = -ones(n, m);
	
	_GRA = threshold(_GRA, tmin, tmax);

	% Padding
	GRA = [repmat(_GRA(1,:), r, 1); _GRA; repmat(_GRA(n,:), r, 1)];
	GRA = [repmat(GRA(:,1), 1, r), GRA, repmat(GRA(:,m), 1, r)];
	GRA = double(GRA);
	
	ANG = [repmat(_ANG(1,:), r, 1); _ANG; repmat(_ANG(n,:), r, 1)];
	ANG = [repmat(ANG(:,1), 1, r), ANG, repmat(ANG(:,m), 1, r)];
	ANG = double(ANG);


	for x = 1:m,
		for y = 1:n,
			if _GRA(y, x) == 0
				continue;
			end;
			switch (ANG(y+r, x+r))
				case 0
					v = [1 0];
				case 45
					v = [1 -1];
				case 90
					v = [0 -1];
				case 135
					v = [-1 -1];
				otherwise
					printf('ERROR\n');
			end;
			w = -v;
			v += [x y];
			w += [x y];
			vij = GRA(v(2)+r, v(1)+r);
			wij = GRA(w(2)+r, w(1)+r);
			pij = GRA(y+r, x+r);
			if((wij <= pij) && (pij > vij))
				R(y, x) = 1;
%			else
%				R(y, x) = 0;
			end;
		end;
	end;

	_R = R;

endfunction
