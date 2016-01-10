defmodule MonitoredMessage do
	import :timer, only: [sleep: 1]

	def sad_function(parent_pid) do
		send parent_pid, "bye bye!"
		exit(:boom)
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

# Without the Process.flag(:trap_exit, true) line, the exit(:boom) of 
# the child doesn't kills the parent and the message is received by parent

# MESSAGE_RECEIVED: "bye bye!"
# MESSAGE_RECEIVED: {:DOWN, #Reference<0.0.3.40>, :process, #PID<0.141.0>, :boom}
# Nothing happened as far as I am concerned

# With the Process.flag(:trap_exit, true) line, the behavior is the same

# Does it matter that you weren’t waiting for the notification from the 
# child when it exited? No, it doesn't matter. The child dying has no 
# consequences for the parent