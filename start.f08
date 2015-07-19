subroutine start(matrix,matrix_rows)
	implicit none!all variables must be declared
	character(1)::input_character!this will be used to pass orders to the program
	integer(4),intent(inout)::matrix(matrix_rows,9)!all the number cells are here
	integer(4),intent(inout)::matrix_rows!this is the amount of rows that the matrix has at a certain moment
	write(*,*) 'set title "Welcome to Gnumberama!\nTo start a new game press n, to load an old game press l."'!instructions for the player
	write(*,*) 'unset key'!this is necessary to force gnuplot to show the message
	write(*,*) 'set grid'!the grid makes visualization easier
	write(*,*) 'set xrange [1:10]'!setting the limits of the visualization
	write(*,*) 'set xrange [1:13]'!setting the limits of the visualization
	write(*,*) "plot '-' lc rgb "//'"#FFFFFF"'!this is necessary to force gnuplot to show the message
	write(*,*) '0 0'!this is necessary to force gnuplot to show the message
	write(*,*) 'e'!this is necessary to force gnuplot to show the message
10	read(*,*) input_character!reading player command
	if(input_character==l)then
		call load_game(matrix,matrix_rows)!loading an old game
	else if(input_character==n)then
		call new_game(matrix,matrix_rows)!starting a new game
	else
		write(*,*) 'set title "Wrong input, to start a new game press n, to load an old game press l."'!invalid input
		write(*,*) 'replot'!updating the output
		go to 10!cycling through this if loop till a valid input is obtained
	end if
	return
end subroutine start