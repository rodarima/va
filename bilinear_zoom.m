function new_image = bilinear_zoom(P, f)
	[pn, pm] = size(P);

	rn = pn * f;
	rm = pm * f;

	zvf = rn / (pn - 1);
	zvc = rm / (pm - 1);
	
	znf = (rn - 1) / (pn-1);
	znc = (rm - 1) / (pm-1);
	
	vrf = (0:rn-1) / znf;
	vrc = (0:rm-1) / znc;
	
	vpf = floor((0:rn-1) / zvf) + 1;
	vpc = floor((0:rm-1) / zvc) + 1;

	vp2f = vpf+1;
	vp2c = vpc+1;

	R = uint8(zeros(rn, rm));
%	R = zeros(rn, rm);

	for x = 1:rm,
		for y = 1:rn,
			df = vrf(y) + 1 - vpf(y);
			dc = vrc(x) + 1 - vpc(x);
			S = double(P([vpf(y),vp2f(y)], [vpc(x), vp2c(x)]));
			D = [1-df, df] * S * [1-dc; dc];
			R(y, x) = uint8(round(D));

			%R(y, x) = D;
		end;
	end;

	new_image = R;
endfunction


