% Cambia el tamaño de una imagen utilizando un factor de aumento

function new_image = neighbor_zoom(img, f)
	[y, x] = size(img);
	
	factor_x = reshape(repmat(img'(:), 1, f)', x*f, y)';
	factor_y = reshape(repmat(factor_x, 1, f)', x*f, y*f)';

	new_image = factor_y;

endfunction


