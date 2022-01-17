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
{:ok, 1_000} = Durex.ms("1s")
{:ok, 500} = Durex.ms("0.5s")
500 = Durex.ms!("0.5s")

# Error
:error = Durex.ms("bla")
```

MIT License
