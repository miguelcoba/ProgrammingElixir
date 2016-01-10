defmodule LinkedMessage do
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
		spawn_link(LinkedMessage, :sad_function, [self])
		sleep 500
		receive_messages
	end
end

LinkedMessage.run

# Without the Process.flag(:trap_exit, true) line, the exit(:boom) of 
# the child immediatly kills the parent and no message is received by parent
# With the Process.flag(:trap_exit, true) line, the exit(:boom) of 
# the child is correctly received by the parent. Additionally the :exit
# message is also received by the parent

# Does it matter that you weren’t waiting for the notification from the 
# child when it exited? No, it doesn't matter. As they are linked the 
# exiting of the child killed the parent too