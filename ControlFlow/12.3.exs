defmodule Ok do
	def ok!(p) do
		case p do
			{:ok, data} -> data
			{_, error} -> raise "Error occurred: #{error}"
		end
	end
end