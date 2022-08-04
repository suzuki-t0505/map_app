defmodule MapApp.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      MapApp.Repo,
      # Start the Telemetry supervisor
      MapAppWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: MapApp.PubSub},
      # Start the Endpoint (http/https)
      MapAppWeb.Endpoint
      # Start a worker by calling: MapApp.Worker.start_link(arg)
      # {MapApp.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: MapApp.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    MapAppWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
