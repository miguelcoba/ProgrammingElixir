defmodule Stack.Server do
	use GenServer

	def start_empty do
		start_link([])
	end

	def shutdown do
		System.halt(1)
	end

	def start_with_random_data do
		start_link([1, "abc", 2, "cdf", 3])
	end

	def start_link(initial_values) do
		GenServer.start_link(__MODULE__, initial_values, name: __MODULE__)
	end

	def pop do
		GenServer.call(__MODULE__, :pop)
	end

	def push(value) do
		GenServer.cast(__MODULE__, {:push, value})
	end

	def status do
		:sys.get_status __MODULE__
	end

	def handle_call(:pop, _from, [head | tail]) do
		{ :reply, head, tail }
	end

	def handle_cast({:push, value}, stack) do
		{ :noreply, [value|stack]}
	end

	def format_status(_reason, [ _pdict, state ]) do
		[data: [{'State', "My current state is '#{inspect state}', and I'm happy"}]]
	end

	def terminate(reason, state) do
		IO.puts "Terminated with reason: #{reason}. Final state: #{state}"
	end
end
