% Cambia el tamaño de una imagen utilizando un factor de aumento

function new_image = neighbor_zoom2(img, f)
	[py, px] = size(img);

	nx = px*f;
	ny = py*f;
	nimg = uint8(zeros(ny, nx));

	for x = 1:nx,
		for y = 1:ny,
			nimg(y, x) = img(floor((y-1)/f)+1, floor((x-1)/f)+1);
		end;
	end;

	new_image = nimg;
endfunction


