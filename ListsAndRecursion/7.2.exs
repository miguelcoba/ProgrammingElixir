defmodule MyList do
	def max([]), do: nil
	def max(list), do: _max(list, hd(list))

	defp _max([], value), do: value
	defp _max([head | tail], value) when head <= value, do: _max(tail, value)
	defp _max([head | tail], value) when head > value, do: _max(tail, head)
end