Try the following in iex:
iex> [ 'cat' | 'dog' ]
['cat', 100, 111, 103]

Why does iex print ’cat’ as a string, but ’dog’ as individual numbers?

Because is creating a list where the first element is itself a list with values ?c, ?a, ?t and the rest of elements are the list with ?d, ?o, ?g (100, 111, 103). 
When printing the four elements, as the list contains not only ascii characters, (the first one is a list, not an ascii character), it is displayed as a lsit of values. But the first value is a list that has all ascii chars, so it prints it as a string, and the others as values