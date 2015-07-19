subroutine prompt_player(matrix,matrix_rows,increase)
	implicit none!all variables must be declared
	logical,intent(out)::increase!if true, more rows will be added
	character(6)::input_character='------'!this will be used to pass orders to the program
	integer(4)::first_column=0!this represents the column of the first number
	integer(4)::first_row=0!same for the row
	integer(4),intent(inout)::matrix(matrix_rows,9)!all the number cells are here
	integer(4),intent(inout)::matrix_rows!this is the amount of rows that the matrix has at a certain moment
	integer(4)::second_column=0!same again for the second number
	integer(4)::second_row=0!and for the row
	write(*,*) 'set title "Introduce the number of the number corresponding to the row of the first cell.\nYou can just type h to get help at any moment."'!instructions for the player
	write(*,*) 'replot'!updating the output
	read(*,*) input_character!reading player command
	if(input_character(1:1)=='h')call help()!getting help
10	read(input_character(1:6),*) first_row
	if((first_row>matrix_rows).or.(first_row<1))then
		write(*,*) 'set title "The number must be smaller than',matrix_rows,'and bigger than 0, try again."'!wrong input
		write(*,*) 'replot'!updating the output
		go to 10!cycling through this if loop till a valid input is obtained
	end if
	write(*,*) 'set title "Introduce the number of the number corresponding to the column of the first cell.\nYou can just type h to get help at any moment."'!instructions for the player
	write(*,*) 'replot'!updating the output
	read(*,*) input_character!reading player command
	if(input_character(1:1)=='h')call help()!getting help
20	read(input_character(1:6),*) first_column!reading player command
	if((first_column>9).or.(first_column<1))then
		write(*,*) 'set title "The number must be smaller than 10 and bigger than 0, try again."'!wrong input
		write(*,*) 'replot'!updating the output
		go to 20!cycling through this if loop till a valid input is obtained
	end if
	write(*,*) 'set title "Introduce the number of the number corresponding to the row of the second cell.\nYou can just type h to get help at any moment."'!instructions for the player
	write(*,*) 'replot'!updating the output
	read(*,*) input_character!reading player command
	if(input_character(1:1)=='h')call help()!getting help
30	read(input_character(1:6),*) first_row!reading player command
	if((second_row>matrix_rows).or.(second_row<1))then
		write(*,*) 'set title "The number must be smaller than',matrix_rows,'and bigger than 0, try again."'!wrong input
		write(*,*) 'replot'!updating the output
		go to 30!cycling through this if loop till a valid input is obtained
	end if
	write(*,*) 'set title "Introduce the number of the number corresponding to the column of the second cell.\nYou can just type h to get help at any moment."'!instructions for the player
	write(*,*) 'replot'!updating the output
	read(*,*) input_character!reading player command
	if(input_character(1:1)=='h')call help()!getting help
40	read(input_character(1:6),*) first_row!reading player command
	if((second_column>9).or.(second_column<1))then
		write(*,*) 'set title "The number must be smaller than 10 and bigger than 0, try again."'!wrong input
		write(*,*) 'replot'!updating the output
		go to 40!cycling through this if loop till a valid input is obtained
	end if
	call check_cells(matrix,matrix_rows,first_column,first_row,second_column,second_row)!checking if the selected move is valid
	write(*,*) 'set title "If you want more rows of numbers introduce m, if you want to quit introduce q."'!instructions for the player
	write(*,*) 'replot'!updating the output
	read(*,*) input_character!reading player command
	increase=.false.!just in case more rows are not requested
	if(input_character(1:1)=='m')then
		increase=.true.!more rows should be added to the matrix
	else if(input_character(1:1)=='q')then
		stop!quitting the game
	end if
	return
end subroutine prompt_player