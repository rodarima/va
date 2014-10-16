% Modifica el histograma de una imagen, para que el valor de gris g se encuentre
% entre min_n y max_n.

function new_image = histStrech(img, min_n, max_n)
	[my, mx] = size(img);
	min_p = double(min(min(img)));
	max_p = double(max(max(img)));
	delta_n = double(max_n - min_n);
	delta_p = double(max_p - min_p);
	
%	Para optimizar la velocidad es conveniente leer:
%	https://www.gnu.org/software/octave/doc/interpreter/Vectorization-and-Faster-Code-Execution.html
%
%	for x = 1:mx,
%		for y = 1:my,
%			g = double(img(y, x));
%			t = (delta_n * (g - min_p)) / delta_p;
%			f(y, x) = uint8(min_n + t);
%		end;
%	end;

	f = uint8((delta_n * (double(img) - min_p)) / delta_p);

	new_image = f;
endfunction
