Which of the following will match?

a = [1, 2, 3] 	# match, a = [ 1, 2, 3 ]
a = 4	# match
4 = a	# match
[a, b] = [ 1, 2, 3 ]	# no match. different number of values
a = [ [ 1, 2, 3 ] ]	# match, a = [[ 1, 2, 3 ]]
[a] = [ [ 1, 2, 3 ] ]	# match, a = [1, 2, 3]
[[a]] = [ [ 1, 2, 3 ] ]	# no match, a can't be matched to 1,2,3