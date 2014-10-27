function new_image = erode_filter(P, tipo, r)
	[n, m] = size(P);
	mask = mask_type(tipo, r);

	% Padding
	A = [repmat(P(1,:), r, 1); P; repmat(P(n,:), r, 1)];
	A = [repmat(A(:,1), 1, r), A, repmat(A(:,m), 1, r)];

	for x = 1:m,
		for y = 1:n,
			if (P(y, x) == 0)
				A([y:y+2*r], [x:x+2*r]) &= ~mask;
			end;
		end;
	end;

	new_image = A([1+r:n+r], [1+r:m+r]);
endfunction


