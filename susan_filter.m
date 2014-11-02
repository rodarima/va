function [_R] = susan_filter(P, rr, thre)
	[n, m] = size(P);

	R = zeros(n, m);
	r = ceil(rr);
	ms = 2*r+1;
	V = zeros(ms);
	MASK = zeros(ms);
	nmax = ms^2;
	beta = 3/4;

	for i = 1:ms,
		for j = 1:ms,
			dist = sqrt((r+1-i)^2 + (r+1-j)^2);
			if(dist <= rr)
				MASK(i,j) = 1;
			end;
		end;
	end;

	% Padding
	A = [repmat(P(1,:), r, 1); P; repmat(P(n,:), r, 1)];
	A = [repmat(A(:,1), 1, r), A, repmat(A(:,m), 1, r)];
	A = double(A);

	%mask = -ones(2*r+1);
	%mask(r+1,r+1) = a+((2*r+1)^2-1);

	for j = 1:m,
		for i = 1:n,
			V = A([i:i+2*r], [j:j+2*r]);
			pc = V(1+r, 1+r);
%			C = abs(V - pc) <= thre;
			C = exp(-((V - pc)/thre).^6);
			N = sum(C(:));

			g = beta*nmax;
			if(N < g)
				R(i, j) = g - N;
			end;
		end;
	end;

	_R = R;

endfunction
