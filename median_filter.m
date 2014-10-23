function new_image = median_filter(P, r)
	[n, m] = size(P);

	R = uint8(zeros(n, m));

	% Padding
	A = [repmat(P(1,:), r, 1); P; repmat(P(n,:), r, 1)]
	A = [repmat(A(:,1), 1, r), A, repmat(A(:,m), 1, r)]

	for x = 1:m,
		for y = 1:n,
			V = A([y-r+1:y+r+1], [x-r+1:x+r+1]);
			R(y, x) = median(V(:));
		end;
	end;

	new_image = R;
endfunction


