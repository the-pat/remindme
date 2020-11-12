defmodule Remindme.Web.Router do
  import Plug.Conn

  require Logger

  def init(options) do
    # initialize options
    options
  end

  def call(conn, _opts) do
    Logger.info(":web :: hit")

    conn
    |> put_resp_content_type("text/plain")
    |> send_resp(200, "Hello world")
  end
end
