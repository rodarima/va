function [_R] = supression(_GRA, _ANG, tmin, tmax)
	[n, m] = size(_GRA);

	r = 1;
	V = zeros(2*r+1);
	R = zeros(n, m);
%	R = -ones(n, m);
	
	% Padding
	GRA = [repmat(_GRA(1,:), r, 1); _GRA; repmat(_GRA(n,:), r, 1)];
	GRA = [repmat(GRA(:,1), 1, r), GRA, repmat(GRA(:,m), 1, r)];
	GRA = double(GRA);
	
	ANG = [repmat(_ANG(1,:), r, 1); _ANG; repmat(_ANG(n,:), r, 1)];
	ANG = [repmat(ANG(:,1), 1, r), ANG, repmat(ANG(:,m), 1, r)];
	ANG = double(ANG);

	[pi, pj] = find(_GRA > 0);

	for i = 1:length(pi),
		x = pj(i);
		y = pi(i);

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
			R(y, x) = pij;
%			else
%				R(y, x) = 0;
		end;
	end;

	_R = R;

endfunction
