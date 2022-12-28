defmodule PipelineCli.Repo do
  use Ecto.Repo,
    otp_app: :pipeline_cli,
    adapter: Ecto.Adapters.Postgres
end
