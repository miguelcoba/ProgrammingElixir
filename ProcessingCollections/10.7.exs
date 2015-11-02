defmodule MyList do
	def span(from, to), do: _span(from, to)

	defp _span(from, to) when to < from, do: []
	defp _span(from, to) when from == to, do: [to]
	defp _span(from, to), do: [from | _span(from + 1, to)]

	# I had to look for how to conscisely generate primes
	def primes(n) do
		range = span(2, n)
		# Sieve of Eratosthenes
		range -- (for a <- range, b <- range, a <= b, a*b <= n, do: a * b)
	end
end