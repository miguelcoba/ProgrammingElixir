defmodule Printer do
	def center(list) do
		col_width = String.length(Enum.max_by(list, fn x -> String.length(x) end))
		
		Enum.each(list, fn x -> _center(x, col_width) end)
	end

	defp _center(x, col_width) do
		l = String.length(x)
		IO.puts String.rjust(x, l + div((col_width - l), 2))
	end
end