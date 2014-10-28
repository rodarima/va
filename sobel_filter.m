function [_GRA, _ANG] = sobel_filter(P)
	[n, m] = size(P);

	GRA = zeros(n, m);
	ANG = zeros(n, m);
	r=1;
	V = zeros(2*r+1);

	% Sobel masks
	smx = [-1 0 1; -2 0 2; -1 0 1];
	smy = [1 2 1; 0 0 0; -1 -2 -1];

	% Padding
	A = [repmat(P(1,:), r, 1); P; repmat(P(n,:), r, 1)];
	A = [repmat(A(:,1), 1, r), A, repmat(A(:,m), 1, r)];
	A = double(A);

	%mask = -ones(2*r+1);
	%mask(r+1,r+1) = a+((2*r+1)^2-1);

	for x = 1:m,
		for y = 1:n,
			V = A([y:y+2*r], [x:x+2*r]);
			sx = sum((V .* smx)(:));
			sy = sum((V .* smy)(:));
			GRA(y, x) = sqrt(sx^2 + sy^2);
			if (sx == 0)
				ANG(y, x) = 90;
			else
				ANG(y, x) = atand(sy/sx);
			end;


		end;
	end;

	ANG = mod(round(mod(ANG, 180)/180*4), 4)*45;
	_GRA = histStrech(GRA, 0, 255);
	_ANG = ANG;
endfunction
