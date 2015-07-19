subroutine check_empty_rows(matrix,matrix_rows,first_row,second_row)
	implicit none!all variables must be declared
	logical::first_row_empty=.false.!if all the cells in the first row are zero this will be true
	logical::second_row_empty=.false.!if all the cells in the second row are zero this will be true
	integer(4)::bigger_row=0!this variable keeps the biggest row out of the two
	integer(4),intent(in)::first_row!row of the first player-select cell
	integer(4)::i=0!auxiliary counter
	integer(4)::j=0!auxiliary counter
	integer(4),intent(inout)::matrix(matrix_rows,9)!all the number cells are here
	integer(4),intent(inout)::matrix_rows!this is the amount of rows that the matrix has at a certain moment
	integer(4),intent(in)::second_row!row of the second player-select cell
	integer(4)::smaller_row=0!this variable keeps the smallest row out of the two
	do i=1,9
		if(matrix(first_row,i)/=0)then
			first_row_empty=.false.!the first row is not empty
			go to 10!and there is no need to keep looking for non-null cells here
		else
			first_row_empty=.true.!the row has only null cells
		end if
		if(matrix(second_row,i)/=0)then
			second_row_empty=.false.!the second row is not empty
			go to 10!and there is no need to keep looking for non-null cells here
		else
			second_row_empty=.true.!the row has only null cells
		end if
	end do
	if(first_row_empty.and.second_row_empty)then
		smaller_row=min0(first_row,second_row)!finding the row closer to the bottom
		bigger_row=max0(first_row,second_row)!finding the row closer to the top
		do i=bigger_row+1,matrix_rows
			do j=1,9
				matrix(i-1,j)=matrix(i,j)!moving all the rows one place down
			end do
		end do
		matrix_rows=matrix_rows-1!now there's one less row
		do i=smaller_row+1,matrix_rows
			do j=1,9
				matrix(i-1,j)=matrix(i,j)!moving all the rows one place down
			end do
		end do
		matrix_rows=matrix_rows-1!now there's one less row
	else if(first_row_empty)then
		do i=first_row+1,matrix_rows
			do j=1,9
				matrix(i-1,j)=matrix(i,j)!moving all the rows one place down
			end do
		end do
		matrix_rows=matrix_rows-1!now there's one less row
	else if(second_row_empty)then
		do i=second_row+1,matrix_rows
			do j=1,9
				matrix(i-1,j)=matrix(i,j)!moving all the rows one place down
			end do
		end do
		matrix_rows=matrix_rows-1!now there's one less row
	end if
10	return
end subroutine check_empty_rows