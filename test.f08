program test
	implicit none
	!character(4)::a='-12'
	!integer(4)::i=0
	!read(a(1:1),*) i
	!write(*,*) i
	!read(a(2:2),*) i
	!write(*,*) i
	!read(a(1:2),*) i
	!write(*,*) i
	write(*,*) 'set title "Welcome to Gnumberama!\nTo start a new game press n, to load an old game press l."'!instructions for the player
	write(*,*) 'unset key'!this is necessary to force gnuplot to show the message
	write(*,*) 'set tic scale 0'!this is necessary to force gnuplot to show the message
	write(*,*) 'set grid'!the grid makes visualization easier
	write(*,*) 'set xrange [0:2]'!this is necessary to force gnuplot to show the message
	write(*,*) 'set yrange [0:2]'!this is necessary to force gnuplot to show the message
	write(*,*) "plot '-' lc rgb "//'"#FFFFFF"'!this is necessary to force gnuplot to show the message
	write(*,*) '-1 -1'!this is necessary to force gnuplot to show the message
	write(*,*) '1 1'!this is necessary to force gnuplot to show the message
	write(*,*) 'e'!this is necessary to force gnuplot to show the message
	read(*,*)
	write(*,*) 'set cbrange [0:9]'!this is necessary to force gnuplot to show the message
	write(*,*) 'set palette defined ( 0.0 "#FFFFFF", 1.0 "#FF0000", 2.0 "#BF3F00", 3.0 "#7F7F00", 4.0 "#3FBF00", 5.0 "#00FF00", 6.0 "#00BF3F", 7.0 "#007F7F", 8.0 "#003FBF", 9.0 "#0000FF" )'!this is necessary to force gnuplot to show the message
	write(*,*) 'set view map'!this is necessary to force gnuplot to show the message
	write(*,*) "plot 'test.dat' u 1:2:3 with image, 'test.dat' u 1:2:(strcol(3)) w labels"!this is necessary to force gnuplot to show the message
	read(*,*)
end program test