defmodule PipelineCli.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      PipelineCli.Repo,
      # Start the Telemetry supervisor
      PipelineCliWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: PipelineCli.PubSub},
      # Start the Endpoint (http/https)
      PipelineCliWeb.Endpoint
      # Start a worker by calling: PipelineCli.Worker.start_link(arg)
      # {PipelineCli.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: PipelineCli.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    PipelineCliWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
