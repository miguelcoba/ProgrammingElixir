defmodule MyList do
	def sum(list), do: _sum(list)

	defp _sum([]), do: 0
	defp _sum([head | tail]), do: head + _sum(tail)
end