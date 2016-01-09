defmodule Chain do
	def counter(next_pid) do
		receive do
			n ->
				send next_pid, n + 1
		end
	end

	def create_processes(n) do
		last = Enum.reduce 1..n, self,
			fn (_, send_to) ->
				spawn(Chain, :counter, [send_to])
			end

		# start the count by sending
		send last, 0

		# and wait for the result to come back to us
		receive do
			final_answer when is_integer(final_answer) ->
				"Result is #{inspect(final_answer)}"
		end
	end

	def run(n) do
		IO.puts inspect :timer.tc(Chain, :create_processes, [n])
	end
end

#
# Results
#

# $ elixir --erl "+P 1000000" -r 12.1.exs -e "Chain.run(10)"
# {4262, "Result is 10"}

# $ elixir --erl "+P 1000000" -r 12.1.exs -e "Chain.run(100)"
# {4318, "Result is 100"}

# $ elixir --erl "+P 1000000" -r 12.1.exs -e "Chain.run(1000)"
# {12883, "Result is 1000"}

# $ elixir --erl "+P 1000000" -r 12.1.exs -e "Chain.run(10_000)"
# {100670, "Result is 10000"}

# $ elixir --erl "+P 1000000" -r 12.1.exs -e "Chain.run(400_000)"
# {2946674, "Result is 400000"}

# $ elixir --erl "+P 1000000" -r 12.1.exs -e "Chain.run(1_000_000)"
# {8020080, "Result is 1000000"}