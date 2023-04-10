defmodule MixTest.Repo do
  use Ecto.Repo,
    otp_app: :mix_test,
    adapter: Ecto.Adapters.Postgres
end
