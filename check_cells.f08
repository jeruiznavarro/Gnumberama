subroutine check_cells(matrix,matrix_rows,first_column,first_row,second_column,second_row)
	implicit none!all variables must be declared
	logical::same_column=.false.!this variable is used to check if the two cells are in the same column
	logical::same_row=.false.!same as before but for rows instead of columns
	integer(4)::column_difference=0!how far appart the cells are in the x axis
	integer(4)::cycle_step=0!the step that will be used to check if there are no non-null cells between the given cells
	integer(4),intent(in)::first_column!this represents the column of the first number
	integer(4),intent(in)::first_row!same for the row
	integer(4)::i=0!auxiliary counter
	integer(4),intent(inout)::matrix(matrix_rows,9)!all the number cells are here
	integer(4),intent(inout)::matrix_rows!this is the amount of rows that the matrix has at a certain moment
	integer(4)::row_difference=0!how far appart the cells are in the y axis
	integer(4),intent(in)::second_column!same again for the second number
	integer(4),intent(in)::second_row!and for the row
	if((matrix(first_row,first_column)==matrix(second_row,second_column)).or.(matrix(first_row,first_column)+matrix(second_row,second_column)==10))then
		column_difference=first_column-second_column!difference between columns of the selected cells
		row_difference=first_row-second_row!difference between rows of the selected cells
		if(column_difference==0)then
			same_column=.true.!the cells are in the same column
		else
			same_column=.false.!and this case they aren't
		end if
		if((row_difference==0).or.(iabs(row_difference)==1)))then
			same_row=.true.!the cells are in the same row
		else
			same_row=.false.!and in this case they aren't either
		end if
		if(((iabs(column_difference)==1).and.same_row).or.(same_column.and.(iabs(row_difference)==1)))
			matrix(first_row,first_column)=0!this number is erased
			matrix(second_row,second_column)=0!just like this one
			call check_empty_rows(matrix,matrix_rows,first_row,second_row)!to avoid having rows where there are only zeros the matrix is updated
		else
			if(same_column)then
				cycle_step=isign(1,column_difference)!computing the step of the cycle
				do i=second_column,first_column,cycle_step
					if(matrix(first_row,i)/=0)go to 10.!if one of the cells between the two player-selected cells is non-null they can't cancel each other out
				end do
				matrix(first_row,first_column)=0!this number is erased
				matrix(second_row,second_column)=0!just like this one
				call check_empty_rows(matrix,matrix_rows,first_row,second_row)!to avoid having rows where there are only zeros the matrix is updated
				go to 20!no need to check the next if loop
			end if
10			if(same_row)then
				if(row_difference<0)then
					do i=first_column,1,-1
						if(matrix(first_row,i)/=0)go to 20.!if one of the cells between the two player-selected cells is non-null they can't cancel each other out
					end do
					do i=second_column,9,1
						if(matrix(second_row,i)/=0)go to 20.!if one of the cells between the two player-selected cells is non-null they can't cancel each other out
					end do
				else if(row_difference>0)then
					do i=first_column,9,1
						if(matrix(first_row,i)/=0)go to 20.!if one of the cells between the two player-selected cells is non-null they can't cancel each other out
					end do
					do i=second_column,1,-1
						if(matrix(second_row,i)/=0)go to 20.!if one of the cells between the two player-selected cells is non-null they can't cancel each other out
					end do
				end if
				matrix(first_row,first_column)=0!this number is erased
				matrix(second_row,second_column)=0!just like this one
				call check_empty_rows(matrix,matrix_rows,first_row,second_row)!to avoid having rows where there are only zeros the matrix is updated
			end if
20		end if
	end if
	return
end subroutine check_cells