defmodule Issues.GithubIssues do
  @user_agent  [ {"User-agent", "Elixir dave@pragprog.com"} ]

  def fetch(user, project) do
    issues_url(user, project)
    |> HTTPoison.get(@user_agent)
    |> handle_response
  end
  def issues_url(user, project) do
    "https://api.github.com/repos/#{user}/#{project}/issues"
  end

  def handle_response({:error, %HTTPoison.Error{reason: error}}), do: {:error, error}
  def handle_response({:ok, %HTTPoison.Response{status_code: status, 
                                                body: body}}) when status >= 400 do
    {:error, :jsx.decode(body)}
  end
  def handle_response({:ok, %HTTPoison.Response{body: body}}), do: {:ok, :jsx.decode(body)}
end