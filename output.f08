subroutine output(matrix,matrix_rows,file_unit_specifier)
	implicit none!all variables must be declared
	integer(4),intent(in)::file_unit_specifier!this is the amount of rows that the matrix has at a certain moment
	integer(4)::i=0!first auxiliary index for the matrix
	integer(4)::j=0!second auxiliary index for the matrix
	integer(4),intent(inout)::matrix_rows!this is the amount of rows that the matrix has at a certain moment
	integer(4),intent(inout)::matrix(matrix_rows,9)!all the number cells are here
	do j=1,9
		do i=1,matrix_rows
			write(file_unit_specifier,*) dble(i)-5.d-1,dble(j)-5.d-1,matrix(i,j)!writing the matrix to file
		end do
	end do
	write(*,*) 'set cbrange [0:9]'!this is necessary to force gnuplot to show the message
	write(*,*) 'set palette defined ( 0.0 "#FFFFFF", 1.0 "#FF0000", 2.0 "#BF3F00", 3.0 "#7F7F00", 4.0 "#3FBF00", 5.0 "#00FF00", 6.0 "#00BF3F", 7.0 "#007F7F", 8.0 "#003FBF", 9.0 "#0000FF" )'!this is necessary to force gnuplot to show the message
	write(*,*) 'set view map'!this is necessary to force gnuplot to show the message
	write(*,*) "plot 'matrix_output.dat' u 1:2:3 with image, 'matrix_output.dat' u 1:2:(strcol(3)) w labels"!this is necessary to force gnuplot to show the message
	return
end subroutine output