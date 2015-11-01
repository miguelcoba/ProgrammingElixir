print_fizz_buzz = fn n -> 
	fizz_buzz.(rem(n, 3), rem(n, 5), n)
end

IO.puts print_fizz_buzz.(10)
IO.puts print_fizz_buzz.(11)
IO.puts print_fizz_buzz.(12)
IO.puts print_fizz_buzz.(13)
IO.puts print_fizz_buzz.(14)
IO.puts print_fizz_buzz.(15)
IO.puts print_fizz_buzz.(16)
