function new_image = canny_filter(P, sigma, tmin, tmax)
	[n, m] = size(P);
	
	imshow(P);
	printf('Original\n');
	fflush(stdout);
	pause(1);
	
	P = gauss_filter(P, sigma, 5);
	
	imshow(histStrech(P, 0, 255));
	printf('Gausiano\n');
	fflush(stdout);
	pause(1);
	
	[G, A] = sobel_filter(P);
	
	imshow(histStrech(G, 0, 255));
	printf('Gradiente de Sobel\n');
	fflush(stdout);
	pause(1);

	S = supression(G, A, tmin, tmax);

	imshow(S);
	printf('Supresión no máxima\n');
	fflush(stdout);
	pause(1);
	
	H = histeresis(S, A, tmin, tmax);
	H = histStrech(H, 0, 255);

	imshow(H);
	printf('Histeresis\n');
	fflush(stdout);
	pause(1);


	new_image = histStrech(H, 0, 255);
endfunction


