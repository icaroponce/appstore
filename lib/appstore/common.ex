defmodule AppStore.Common do

  defp parse_response({:ok, %HTTPoison.Response{body: body, status_code: 200}}) do
    data = body |> Poison.decode!
    try do
      results = data["results"]
      {:ok, results}
    rescue
      e -> {:error, e}
    end
  end

  # TODO: Improve this code
  defp parse_response({:ok, %HTTPoison.Response{status_code: 400}}), do: {:error, "BAD REQUEST"} 

  defp parse_response(_), do: :error

  def request(url) do
    result = url |> HTTPoison.get |> parse_response
    case result do
      {:ok, data} -> {:ok, data}
      {:error, message} -> {:error, message}
      :error -> :error
    end
  end

  defdelegate clean_app(app), to: AppStore.Struct_parser
end
