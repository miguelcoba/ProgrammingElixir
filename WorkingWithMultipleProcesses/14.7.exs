defmodule ParallelRandom do
	import :timer, only: [sleep: 1]

	def pmap(collection, fun) do
		me = self
		collection
		|> Enum.map(fn (elem) ->
				spawn_link fn -> 
					sleep :random.uniform(500)
					send me, { self, fun.(elem) }
				end
			end)
		|> Enum.map(fn (pid) ->
				receive do { _pid, result } -> result end
			end)
	end
end

# iex(41)> ParallelRandom.pmap 1..100, &(&1 * &1)
# [169, 324, 900, 625, 1024, 784, 1, 961, 1225, 1089, 1369, 1296, 1521, 4, 1444,
 # 2116, 1600, 2401, 9, 2025, 2704, 16, 3025, 3249, 25, 3600, 4624, 36, 5041,
 # 2209, 49, 5476, 2500, 64, 5776, 2601, 5929, 2916, 81, 6400, 3136, 100, 6889,
 # 7569, 3481, 7744, 3721, 121, 8100, 4356, ...]

# The problem is not noticed because the calculation of the function is
# very consistent in time. When we added a random duration to the 
# calculation, the receiving function receives the values in random order