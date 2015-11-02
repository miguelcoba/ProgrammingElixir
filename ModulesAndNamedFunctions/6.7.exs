Convert a float to a string with two decimal digits. (Erlang)

Float.to_string 8.33432, [decimals: 2]

Get the value of an operating-system environment variable. (Elixir)

System.get_env("PATH")

Return the extension component of a file name (so return .exs if given "dave/test.exs"). (Elixir)

Path.extname("dave/test.exs")

Return the process’s current working directory. (Elixir)

System.cwd()

Convert a string containing JSON into Elixir data structures. (Just find; don’t install.)

# Using Poison https://github.com/devinus/poison
Poison.decode!(~s({"name": "Devin Torres", "age": 27}), as: Person)
#=> %Person{name: "Devin Torres", age: 27}

Execute a command in your operating system’s shell.

iex(19)> System.cmd("date", [])
{"Mon Nov  2 02:47:09 UTC 2015\n", 0}