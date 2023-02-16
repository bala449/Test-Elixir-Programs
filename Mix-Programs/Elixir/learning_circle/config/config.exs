import Config

config :learning_circle, LearningCircle.Repo,
  adapter: Ecto.Adapters.Postgres,
  database: "learning_circle_repo",
  username: "bala",
  password: "India123",
  hostname: "localhost"

config :learning_circle,
  ecto_repos: [LearningCircle.Repo]
