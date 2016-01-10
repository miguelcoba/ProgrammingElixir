Run the Fibonacci code on your machine. Do you get comparable timings? If your machine has multiple cores and/or processors, do you see improvements in the timing as we increase the application’s concurrency?

iex(43)> c("fib.exs")
[{37, 24157817}, {37, 24157817}, {37, 24157817}, {37, 24157817}, {37, 24157817}, {37, 24157817}]

 #   time (s)
 1     6.21
 2     3.46
 3     2.44
 4     2.34
 5     2.64
 6     1.69
 7     1.69
 8     1.70
 9     1.71
10     2.12
[Scheduler, FibSolver]

# The times are comparable. There are performance increases when 
# moving from 1 to 2, from 2 to 3 and from 5 to 6 processes