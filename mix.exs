defmodule Durex.MixProject do
  use Mix.Project

  def project do
    [
      app: :durex,
      version: "0.2.0",
      elixir: "~> 1.5",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      docs: docs(),
      package: package(),
      description: "Convert short string durations to their numerical millisecond value"
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
      {:dialyxir, "~> 1.1", only: [:dev], runtime: false},
      {:ex_doc, "~> 0.27", only: :dev},
      {:benchee, "~> 1.0", only: :dev}
    ]
  end

  defp package do
    [
      name: "durex",
      licenses: ["MIT License"],
      links: %{"GitHub" => "https://github.com/walkr/durex"},
      files: ["lib", "mix.exs", "README*", "LICENSE*"]
    ]
  end

  # Run "mix docs to generate documentation"
  defp docs do
    [main: "Durex", extras: ["README.md": [title: "README"]]]
  end
end
