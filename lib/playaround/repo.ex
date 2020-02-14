defmodule Playaround.Repo do
  use Ecto.Repo,
    otp_app: :playaround,
    adapter: Ecto.Adapters.Postgres
end
