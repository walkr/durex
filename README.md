# Durex

[Documentation](https://hexdocs.pm/durex)

A small Elixir library for parsing durations, such as `"1s"`, to its numerical millisecond value, e.g. `1_000`.


## Installation

```elixir
def deps do
  [
    {:durex, "~> 0.1.0"}
  ]
end
```

## Usage

```elixir
# Success
{:ok, 1_000} = Durex.parse("1s")
{:ok, 500} = Durex.parse("0.5s")

# Error
:error = Durex.parse("bla")
```

MIT License

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at

