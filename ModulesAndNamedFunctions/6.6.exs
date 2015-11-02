defmodule Chop do
	def guess(actual, a..b) do
		guess = div(a + b, 2)
		IO.puts "It is #{guess}" 
		do_guess(actual, a..b, guess)
	end

	def do_guess(actual, _, guess) when guess == actual do
		IO.puts guess
	end

	def do_guess(actual, _..b, guess) when guess < actual do
		guess(actual, (guess + 1)..b)
	end

	def do_guess(actual, a.._, guess) when guess > actual do
		guess(actual, a..(guess - 1))
	end
end