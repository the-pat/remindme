defmodule Remindme.Bot do
  @moduledoc false

  use Application

  alias Alchemy.Client

  @impl true
  def start(_type, _args) do
    run =
      :remindme
      |> Application.fetch_env!(:token)
      |> Client.start()

    use Remindme.Commands
    run
  end
end
