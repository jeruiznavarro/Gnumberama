subroutine start()
	implicit none
	common 
	character(1)::input_character!this will be used to pass orders to the program
	write(*,'set title "Welcome to Gnumberama!\nTo start a new game press n, to load an old game press l"')
	read(*,*) input_character
end subroutine start