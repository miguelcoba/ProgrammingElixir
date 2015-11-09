defmodule Parse do
	def isPrintable([]), do: false
	def isPrintable(list) when is_list(list), do: Enum.all?(list, fn ch -> ch in ?\s..?~ end)
end