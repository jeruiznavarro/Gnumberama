program gnumberama
	implicit none!all variables must be declared
	logical::game_over=.false.!this variable will be false until there are no more possible moves
	logical::increase=.false.!if true, more rows will be added
	character(1)::input_character='-'!this will be used to pass orders to the program
	integer(4)::i=0!first auxiliary index for the matrix
	integer(4)::j=0!second auxiliary index for the matrix
	integer(4)::matrix_file_unit_specifier=10!this can be passed as an argument so the file can be used in different subroutines
	integer(4)::matrix_rows=3!this is the amount of rows that the matrix has at a certain moment
	integer(4),allocatable::matrix(:,:)!all the number cells are here
	integer(4),allocatable::temporary_matrix(:,:)!when the matrix needs to add new entries, they are kept here while it is deallocated and allocated again with the right size
	open(matrix_file_unit_specifier,file='matrix_output.dat',status='scratch')!the matrix will be kept here so it can be read by gnuplot, then the file will be deleted after the program is terminated
	allocate(matrix(matrix_rows,9),temporary_matrix(matrix_rows,9))!initial dimensioning of the matrix
	call start(matrix,matrix_rows)!asking the player if a new game should start or if a game s to be loaded
	call output(matrix,matrix_rows,matrix_file_unit_specifier)!updating what the player sees in the screen
	do
		if(game_over)then
			call end_game()!the player is asked if a new game should start
		end if
		call prompt_player(matrix,matrix_rows,increase)!asking the player what s/he wants to do
		if(increase)then
			do j=1,9
				do i=1,matrix_rows
					temporary_matrix(i,j)=matrix(i,j)
				end do
			end do
			deallocate(matrix)
			allocate(matrix(matrix_rows+3,9))
			do j=1,9
				do i=1,matrix_rows
					matrix(i,j)=temporary_matrix(i,j)
					matrix(i+3,j)=nint(rand()*8.,4)+1
				end do
			end do
		end if
		call check_moves(matrix,matrix_rows)!checking if there are any more available moves
		call output(matrix,matrix_rows,matrix_file_unit_specifier)!updating what the player sees in the screen
	end do
	close(matrix_file_unit_specifier)!closing and getting rid of the temporary file
end program gnumberama