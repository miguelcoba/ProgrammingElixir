defmodule CliTest do
	use ExUnit.Case
	doctest Issues.CLI

	import Issues.CLI, only: [ parse_args: 1,
		sort_into_ascending_order: 1,
		convert_to_list_of_hashdicts: 1 ]

	test ":help returned when -h and --help present in args" do
		assert parse_args(["-h", "something", "else"]) == :help
		assert parse_args(["--help", "something", "else"]) == :help
	end

	test "when three values given, three returned" do
		assert parse_args(["user", "project", "99"]) == { "user", "project", 99}
	end

	test "when two values given, uses default for count" do
		assert parse_args(["user", "project"]) == { "user", "project", 4 }
	end

	test "any other other options returns :help" do
		assert parse_args([]) == :help
		assert parse_args(["unique"]) == :help
		assert parse_args(["more", "than", "three", "values"]) == :help
	end

	test "sort ascending orders the correct way" do
		result = sort_into_ascending_order(fake_created_at_list(["c", "a", "b"]))
		issues = for issue <- result, do: issue["created_at"]
		assert issues == ~w{a b c}
	end

	defp fake_created_at_list(values) do
		data = for value <- values,
			do: [{"created_at", value}, {"other_data", "xxx"}]
		convert_to_list_of_hashdicts data
	end
end