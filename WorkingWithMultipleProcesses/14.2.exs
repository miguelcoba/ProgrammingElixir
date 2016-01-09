defmodule Spawn2Processes do
	def answer do
		receive do
			{sender, msg} ->
				send sender, msg
		end
	end
end

pid1 = spawn(Spawn2Processes, :answer, [])
pid2 = spawn(Spawn2Processes, :answer, [])

send pid1, {self, "fred"}
send pid2, {self, "betty"}

receive do
	response ->
		IO.puts "Received: #{response}"
end

receive do
	response ->
		IO.puts "Received: #{response}"
end

# The sequence is non deterministic both in theory and in practice
# One way to make it deterministic is to chaing message reception and send
# next message until receiving the previous message (serialize sending 
# messages)