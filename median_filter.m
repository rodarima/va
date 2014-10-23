function new_image = median_filter(P, r)
	[n, m] = size(P);

	R = uint8(zeros(n, m));

	for x = r+1:(m-r),
		for y = r+1:(n-r),
			V = P([y-r:y+r], [x-r:x+r]);
			R(y, x) = median(V(:));
		end;
	end;
	
	for x = [1:r, m-r+1:m],
		for y = [1:r, n-r+1:n],
			vy = [max(1, y-r):min(m, y+r)]
			vx = [max(1, x-r):min(n, x+r)]
			V = P(vy, vx)
			R(y, x) = median(V(:));
		end;
	end;

	new_image = R;
endfunction


