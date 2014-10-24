function new_image = median_filter(P, r)
	[n, m] = size(P);

	R = uint8(zeros(n, m));
	V = zeros(2*r+1);

	% Padding
	A = [repmat(P(1,:), r, 1); P; repmat(P(n,:), r, 1)];
	A = [repmat(A(:,1), 1, r), A, repmat(A(:,m), 1, r)];

	for x = 1:m,
		for y = 1:n,
			V(:,:) = A([y:y+2*r], [x:x+2*r]);
			R(y, x) = median(V(:));
		end;
	end;

	new_image = R;
endfunction


