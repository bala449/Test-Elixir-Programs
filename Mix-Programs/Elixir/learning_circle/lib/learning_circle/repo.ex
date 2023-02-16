defmodule LearningCircle.Repo do
  use Ecto.Repo,
    otp_app: :learning_circle,
    adapter: Ecto.Adapters.Postgres
end
