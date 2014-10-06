% Modifica el histograma de una imagen, para que el valor de gris g se encuentre
% entre min_n y max_n.

function new_image = histStrech(img, min_n, max_n)
	[my, mx] = size(img);
	f = uint8(zeros(my, mx));
	delta = double(max_n - min_n);
	for x = 1:mx,
		for y = 1:my,
			g = double(img(y, x));
			a = (delta * g);
			b = a / 255.0;
			f(y, x) = uint8(min_n + b);
		end;
	end;
	new_image = f;
endfunction
