defmodule TaskDemo.MixProject do
  use Mix.Project

  def project do
    [
      app: :task_demo,
      version: "0.1.0",
      elixir: "~> 1.13",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:httpoison, "~> 2.0"},
      {:ex_doc, "~> 0.12"},
      {:xml_json, "~> 0.3.0"},
      {:poison, "~> 5.0"}
    ]
  end
end
