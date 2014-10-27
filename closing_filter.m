function new_image = closing_filter(P, tipo, r)
	new_image = erode_filter(dilate_filter(P, tipo, r), tipo, r);
endfunction


