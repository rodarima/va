function new_image = highboost_filter(P, r, a)
	[n, m] = size(P);

	R = zeros(n, m);
	V = zeros(2*r+1);

	% FIXME: Para máscaras de tamaño > 3x3 ?

	%sigma = 1.0;
	%[x,y] = meshgrid(-r:r, -r:r);
	%radsqrd = x.^2 + y.^2;
	%sigma2 = sigma^2;	
	%mask=-1/(pi*sigma2^2)*(1-radsqrd/(2*sigma2)).*exp(-radsqrd/(2*sigma2));
	%mask = mask-mean(mask(:));
	%mask(r+1,r+1)+=a;

	% Padding
	A = [repmat(P(1,:), r, 1); P; repmat(P(n,:), r, 1)];
	A = [repmat(A(:,1), 1, r), A, repmat(A(:,m), 1, r)];
	A = double(A);

	mask = -ones(2*r+1);
	mask(r+1,r+1) = a+((2*r+1)^2-1);


	for x = 1:m,
		for y = 1:n,
			V = A([y:y+2*r], [x:x+2*r]);
			V = V .* mask;
			R(y, x) = sum(V(:));
		end;
	end;

	new_image = R;
endfunction


