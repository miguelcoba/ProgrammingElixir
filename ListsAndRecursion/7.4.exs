defmodule MyList do
	def span(from, to), do: _span(from, to)

	defp _span(from, to) when to < from, do: []
	defp _span(from, to) when from == to, do: [to]
	defp _span(from, to), do: [from | _span(from + 1, to)]
end