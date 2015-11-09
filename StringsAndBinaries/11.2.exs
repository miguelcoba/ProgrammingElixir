defmodule Anagram do
	def anagram?(word1, word2) when length(word1) !== length(word2), do: false
	def anagram?(word1, word2) do
		w1 = word1 |> List.to_string |> String.downcase |> String.to_char_list |> Enum.sort
		w2 = word2 |> List.to_string |> String.downcase |> String.to_char_list |> Enum.sort

		w1 === w2
	end
end