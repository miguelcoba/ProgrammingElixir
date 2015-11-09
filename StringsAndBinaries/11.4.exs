defmodule MyMath do
	def calculate(expr_list) do
		expr_str = List.to_string(expr_list)
		tokens = Regex.run ~r{([0-9]+) *([\-\+\*\/]) *([0-9]+)}, expr_str, capture: :all_but_first
		_eval(tokens)
	end

	defp _eval([first, op, second]) do
		f = String.to_integer first
		s = String.to_integer second
		case op do
			"+" -> f + s
			"-" -> f - s
			"*" -> f * s
			"/" -> div(f, s)
		end
	end

	defp _eval(_), do: IO.puts "Wrong syntax. Must be op1 [+-*/] op2"
end