subroutine new_game(matrix,matrix_rows)
	implicit none!all variables must be declared
	character(8)::datechar='--------'!this character variable stores the current date for the names of the output files
	character(10)::timechar='----------'!this character variable stores the current time for the names of the output files
	integer(4)::i=0!auxiliary counter
	integer(4)::j=0!auxiliary counter
	integer(4),intent(inout)::matrix(matrix_rows,9)!all the number cells are here
	integer(4),intent(inout)::matrix_rows!this is the amount of rows that the matrix has at a certain moment
	integer(4)::seed(8)=0!seed for the random number generator
	call date_and_time(date=datechar,time=timechar,values=seed)!creating a seed using the clock of the computer
	call srand(1000*seed(8)+3*seed(7)*seed(6)/10)!initializing the random number generator
	do j=1,9
		do i=1,matrix_rows
			matrix(i,j)=nint(rand()*8.,4)+1!generating the random initial values for the matrix between 1 and 9
		end do
	end do
	return
end subroutine new_game