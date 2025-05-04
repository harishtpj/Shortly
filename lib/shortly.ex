defmodule Shortly do
  use Plug.Router

  plug :match
  plug :dispatch

  get "/" do
    render(conn, :index, [site_title: "Hello", lst: [9, 18, 27]])
  end

  get "/:name" do
    send_resp(conn, 200, "Hello, #{name}")
  end

  match _ do
    send_resp(conn, 404, "OOPS!")
  end

  defp render(%{status: status} = conn, template, assigns \\ []) do
    content = apply(Shortly.Views, template, [assigns])
    send_resp(conn, (status || 200), content)
  end
end
