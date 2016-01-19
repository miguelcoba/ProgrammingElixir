defmodule Stack.Stash do
	use GenServer

	def start_link(current_stack) do
		{:ok, _pid} = GenServer.start_link(__MODULE__, current_stack)
	end

	def save_value(pid, current_stack) do
		GenServer.cast pid, {:save_value, current_stack}
	end

	def get_value(pid) do
		GenServer.call pid, :get_value
	end

	# GenServer implementation

	def handle_call(:get_value, _from, current_stack) do
		{:reply, current_stack, current_stack}
	end

	def handle_cast({:save_value, current_stack}, _current_stack) do
		{:noreply, current_stack}
	end
end