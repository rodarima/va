function new_image = histeresis(GRA, ANG, tmin, tmax)
	[n, m] = size(GRA);

	R = zeros(n, m);

	[pi, pj] = find(GRA >= tmax);

	lmax = [];

	for i = 1:length(pi),
%		printf('%d ', i);
%		fflush(stdout);
		aj = pj(i);
		ai = pi(i);
		
		dir = ANG(ai, aj);

		switch (dir)
			case 0
				v = [0 -1];
			case 45
				v = [-1 -1];
			case 90
				v = [-1 0];
			case 135
				v = [-1 +1];
			otherwise
				printf('ERROR\n');
		end;

		w = -v;

		%gp = GRA(ai, aj);
		R(ai, aj) = 1;
		
		if(any(1:n == (ai+v(2))) & any(1:m == (aj+v(1))))
			gv = GRA(ai+v(2), aj+v(1));
			if(gv > tmin)
				lmax = [lmax; ai+v(2), aj+v(1)];
			end;
		end;

		if(any(1:n == (ai+w(2))) & any(1:m == (aj+w(1))))
			gw = GRA(ai+w(2), aj+w(1));
			if(gw > tmin)
				lmax = [lmax; ai+w(2), aj+w(1)];
			end;
		end;
	end;

	vis = lmax;

	while length(lmax) > 0
		ai = lmax(1,1);
		aj = lmax(1,2);
%		printf('(%d,%d) ', ai, aj);
%		fflush(stdout);
		lmax = lmax(2:end, :);
		
		%gp = GRA(ai, aj);
		R(ai, aj) = 1;
		
		dir = ANG(ai, aj);

		switch (dir)
			case 0
				v = [0 -1];
			case 45
				v = [-1 -1];
			case 90
				v = [-1 0];
			case 135
				v = [-1 +1];
			otherwise
				printf('ERROR\n');
		end;

		w = -v;
		
		if(any(1:n == (ai+v(2))) & any(1:m == (aj+v(1))))
			gv = GRA(ai+v(2), aj+v(1));
			if(gv > tmin)
				if(R(ai+v(2), aj+v(1)) == 0)
					lmax = [lmax; ai+v(2), aj+v(1)];
				end;
			end;
		end;

		if(any(1:n == (ai+w(2))) & any(1:m == (aj+w(1))))
			gw = GRA(ai+w(2), aj+w(1));
			if(gw > tmin)
				if(R(ai+w(2), aj+w(1)) == 0)
					lmax = [lmax; ai+w(2), aj+w(1)];
				end;
			end;
		end;
		
	end;

	new_image = R;

	
endfunction


