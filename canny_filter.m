function new_image = canny_filter(P, sigma, tmin, tmax)
	[n, m] = size(P);
	
	imshow(P);
	printf('Original\n');
	fflush(stdout);
	pause(3);
	
	P = gauss_filter(P, sigma, 5);
	
	imshow(histStrech(P, 0, 255));
	printf('Gausiano\n');
	fflush(stdout);
	pause(3);
	
	[G, A] = sobel_filter(P);
	
	imshow(histStrech(G, 0, 255));
	printf('Gradiente de Sobel\n');
	fflush(stdout);
	pause(3);

	S = supression(G, A, tmin, tmax);

	imshow(histStrech(S, 0, 255));
	printf('Borde\n');
	fflush(stdout);
	pause(3);

	new_image = histStrech(S, 0, 255);
endfunction


