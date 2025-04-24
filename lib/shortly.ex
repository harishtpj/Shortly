defmodule Shortly do
  use Plug.Router

  plug :match
  plug :dispatch

  get "/" do
    send_resp(conn, 200, "All set good!")
  end

  get "/:name" do
    send_resp(conn, 200, "Hello, #{name}")
  end

  match _ do
    send_resp(conn, 404, "OOPS!")
  end
end
