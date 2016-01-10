When I introduced the interval server, I said it sent a tick “about every 2 seconds.” But in the receive loop, it has an explicit timeout of 2,000 ms. Why did I say “about” when it looks as if the time should be pretty accurate?
Because some times the receive will get a message and will process it, 
recursing and resetting the timeout. 
Some times won't get any message and will timeout in 20000 ms.
As more messages are received and the recursion continues, the time to 
send a tick will be 2000 plus the time it took to process each message and 
recurse. If a constant stream of messages arrives before 2 seconds have 
elapsed, it will never enter the after part and will never tick.