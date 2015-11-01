If you assume the variable a initially contains the value 2, which of the following will match?

[ a, b, a ] = [ 1, 2, 3 ]	# no match, a changes value in same match
[ a, b, a ] = [ 1, 1, 2 ]	# no match, a change value in same match
a = 1	# match, rebind value
^a = 2	# match
^a = 1	# no match, a bound to 2 doesn't match 1
^a = 2 - a	# no match