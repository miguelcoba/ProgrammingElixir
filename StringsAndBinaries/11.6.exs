defmodule Capitalize do
	def capitalize_sentences(string) do
		separator = ". "
		String.split(string, separator)
			|> Enum.map(&String.capitalize/1)
			|> Enum.join ". "
	end
end