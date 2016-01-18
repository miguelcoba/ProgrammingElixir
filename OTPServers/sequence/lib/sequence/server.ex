defmodule Sequence.Server do
	use GenServer

	def handle_call(:next_number, _from, current_number) do
		{ :reply, current_number, current_number + 1 }
	end

	def handle_call({:set_number, new_number}, _from, _current_number) do
		{ :reply, new_number, new_number }
	end

	def handle_call({:factors, number}, _, _) do
		{ :reply, { :factors_of, number, factors(number) }, [] }
	end
end