import Config

config :db_test, DbTest.Repo,
  database: "db_test_repo",
  username: "postgres",
  password: "India123",
  hostname: "localhost"

config :db_test,
  ecto_repos: [DbTest.Repo]
