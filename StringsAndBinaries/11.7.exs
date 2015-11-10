defmodule Taxes do
	defp sales_tax(order, tax_rates) do
		total_amount = order[:net_amount]
		if List.keymember?(tax_rates, order[:ship_to], 0) do
			tax_amount = order[:net_amount] * tax_rates[order[:ship_to]]
			total_amount = order[:net_amount] + tax_amount
		end

		order ++ [total_amount: total_amount]
	end

	defp _reformat([a, b, c]) do 
		import String
		[ to_integer(a), to_atom(lstrip(b, ?:)), to_float(c) ]
	end

	defp _parse_headers(string) do
		import String
		string |> strip |> split(",") |> Enum.map(&to_atom/1) |> List.to_tuple
	end

	defp _build_order(row, headers) do
		data = row |> String.strip |> String.split(",") |> _reformat
		 List.zip([headers, data])
	end

	def process_file(filename, tax_rates) do
		File.open filename, [:read], fn file ->
			headers = _parse_headers(IO.read(file, :line))
			rows = IO.stream(file, :line)
			Enum.each rows, fn row ->
				order = _build_order(row, headers)
				IO.inspect sales_tax(order, tax_rates)
			end
		end
	end
end

tax_rates = [ NC: 0.075, TX: 0.08 ]

Taxes.process_file("orders.csv", tax_rates)