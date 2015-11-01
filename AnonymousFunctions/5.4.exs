prefix = fn first ->
	fn second ->
		"#{first} #{second}"
	end
end

mrs = prefix.("Mrs")
mrs.("Smith")

prefix.("Elixir").("Rocks")
