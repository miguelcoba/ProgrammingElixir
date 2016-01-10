defmodule MonitoredMessage do
	import :timer, only: [sleep: 1]

	def sad_function(parent_pid) do
		send parent_pid, "bye bye!"
		raise "boom"
	end

	def receive_messages do
		receive do
			msg ->
				IO.puts "MESSAGE_RECEIVED: #{inspect msg}"
			receive_messages
		after 1000 ->
			IO.puts "Nothing happened as far as I am concerned"
		end
	end

	def run do
		Process.flag(:trap_exit, true)
		spawn_monitor(MonitoredMessage, :sad_function, [self])
		sleep 500
		receive_messages
	end
end

MonitoredMessage.run

# Do the same, but have the child raise an exception. What difference do 
# you see in the tracing?
# The :DOWN message includes the uncatched exception info in the tuple 
# instead of the exit value

# MESSAGE_RECEIVED: "bye bye!"
# MESSAGE_RECEIVED: {:DOWN, #Reference<0.0.3.82>, :process, #PID<0.165.0>, {%RuntimeError{message: "boom"}, [{MonitoredMessage, :sad_function, 1, [file: '14.5b.exs', line: 6]}]}}
# Nothing happened as far as I am concerned