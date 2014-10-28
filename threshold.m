function [_R] = threshold(P, tmin, tmax)
	_R = P .* (P>tmin & P<=tmax);
endfunction
