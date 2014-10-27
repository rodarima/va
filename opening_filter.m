function new_image = opening_filter(P, tipo, r)
	new_image = dilate_filter(erode_filter(P, tipo, r), tipo, r);
endfunction


