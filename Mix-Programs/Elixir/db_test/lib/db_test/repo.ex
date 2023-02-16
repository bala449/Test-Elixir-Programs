defmodule DbTest.Repo do
  use Ecto.Repo,
    otp_app: :db_test,
    adapter: Ecto.Adapters.Postgres
end
