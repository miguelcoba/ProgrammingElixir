defmodule MyEnum do

	def all?(collection), do: all?(collection, fn x -> !!x end)
	def all?([], _), do: true
	def all?([head|tail], fun), do: fun.(head) && all?(tail, fun)

	def each([], _), do: :ok
	def each([head | tail], fun) do
		fun.(head)
		each(tail, fun)
	end

	def filter([], _), do: []
	def filter([head | tail], fun) do
		if fun.(head) do
			[head] ++ filter(tail, fun)
		else
			filter(tail, fun)
		end
	end

	def split(collection, count) when count >= 0, do: _split(collection, [], count)
	defp _split([], acc, _), do: {acc, []}
	defp _split(rest, acc, 0), do: {acc, rest}
	defp _split([head|tail], acc, count), do: _split(tail, acc ++ [head], count - 1)

	def take(collection, n) when count >= 0, do: elem(split(collection, n), 0)
end