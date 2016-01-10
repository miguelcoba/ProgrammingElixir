defmodule LinkedMessage do
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
		spawn_link(LinkedMessage, :sad_function, [self])
		sleep 500
		receive_messages
	end
end

LinkedMessage.run

# Do the same, but have the child raise an exception. What difference do 
# you see in the tracing?
# The :exit message includes the uncatched exception info in the tuple 
# instead of the exit value

# MESSAGE_RECEIVED: "bye bye!"
# MESSAGE_RECEIVED: {:EXIT, #PID<0.109.0>, {%RuntimeError{message: "boom"}, [{LinkedMessage, :sad_function, 1, [file: '14.4.exs', line: 6]}]}}
# Nothing happened as far as I am concerned