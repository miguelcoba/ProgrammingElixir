defmodule MyList do
	# without accumulator
	def mapsum(list, func), do: _mapsum(list, func)

	defp _mapsum([], _), do: 0
	defp _mapsum([head | tail], func), do: func.(head) + _mapsum(tail, func)

	# with accumulator
	def mapsum_acc(list, func), do: _mapsum_acc(list, func, 0)

	defp _mapsum_acc([], _, total), do: total
	defp _mapsum_acc([head | tail], func, total), do: _mapsum_acc(tail, func, total + func.(head))
end