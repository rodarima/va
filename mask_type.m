function new_mask = mask_type(tipo, r)
	n = 2*r+1;

	if strcmp(tipo, 'square')
		new_mask = ones(n);
	elseif strcmp(tipo, 'cross')
		m = zeros(n);
		m(:, r+1) = 1;
		m(r+1, :) = 1;
		new_mask = m;
	endif
endfunction


