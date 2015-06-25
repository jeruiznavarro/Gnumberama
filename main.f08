program gnumberama
	implicit none!all variables must be declared
	logical::game_over=.false.!this variable will be false until there are no more possible moves
	character(1)::input_character='-'!this will be used to pass orders to the program
	real(4),allocatable::matrix(:,:)!all the number cells are here
	real(4),allocatable::temporary_matrix(:,:)!when the matrix needs to add new entries, they are kept here while it is deallocated and allocated again with the right size

	call start()!asking the player if a new game should start or if a game s to be loaded
	do
		if(game_over)then
			call end_game()!the player is asked if a new game should start
		end if
		call output()!
	end do
end program gnumberama