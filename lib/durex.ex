defmodule Durex do
  @moduledoc """
  Parse durations, such as `"1s"`, to its numerical millisecond value, e.g. `1_000`,
  so you can do things such as:

  ```
  "1s"
  |> Durex.ms!()
  |> Process.sleep()
  ```

  ## Examples

      iex> Durex.ms "3s"
      {:ok, 3_000}

      iex> Durex.ms "1h"
      {:ok, 3600_000}

      # Works with float too
      iex> Durex.ms "0.5s"
      {:ok, 500}

      iex> Durex.ms "1.5h"
      {:ok, 5400_000}

      # Cannot ms duration less than 1ms | 1.0ms
      iex> Durex.ms "0.5ms"
      :error

      # Fractional durations in ms will be truncated
      iex> Durex.ms "1.5ms"
      {:ok, 1}

  Of course, there is also the bang version `ms!/1`:

      # Bang version available
      iex> Durex.ms! "3s"
      3_000

  #### Supported units

    * `ms` (for millisecond)
    * `s` (for second)
    * `m` (for minute)
    * `h` (for hour)
    * `d` (for days)
    * `w` (for week)

  #### Performance Notes

    * Parsing durations which include integers is about 4x faster
      than their version containing floats.
      So instead of parsing "0.5s", use "500ms" for maximum performance.

    * To benchmark, run: `$ mix run bench/ms.exs`

  """

  @type duration :: bitstring

  defmacrop s_to_ms(s), do: quote(do: 1_000 * unquote(s))
  defmacrop m_to_ms(m), do: quote(do: 1_000 * 60 * unquote(m))
  defmacrop h_to_ms(h), do: quote(do: 1_000 * 60 * 60 * unquote(h))
  defmacrop d_to_ms(d), do: quote(do: 1_000 * 60 * 60 * 24 * unquote(d))
  defmacrop w_to_ms(w), do: quote(do: 1_000 * 60 * 60 * 24 * 7 * unquote(w))

  @doc "Parse duration as milliseconds"
  @spec ms(duration) :: {:ok, pos_integer} | :error
  def ms(duration) when is_bitstring(duration) do
    case Integer.parse(duration) do
      {ms, "ms"} when ms >= 1 ->
        {:ok, ms}

      {s, "s"} when s > 0 ->
        {:ok, s_to_ms(s)}

      {m, "m"} when m > 0 ->
        {:ok, m_to_ms(m)}

      {h, "h"} when h > 0 ->
        {:ok, h_to_ms(h)}

      {d, "d"} when d > 0 ->
        {:ok, d_to_ms(d)}

      {w, "w"} when w > 0 ->
        {:ok, w_to_ms(w)}

      _ ->
        case Float.parse(duration) do
          {ms, "ms"} when ms >= 1.0 -> {:ok, trunc(ms)}
          {s, "s"} when s > 0.0 -> {:ok, trunc(s_to_ms(s))}
          {m, "m"} when m > 0.0 -> {:ok, trunc(m_to_ms(m))}
          {h, "h"} when h > 0.0 -> {:ok, trunc(h_to_ms(h))}
          {d, "d"} when d > 0.0 -> {:ok, trunc(d_to_ms(d))}
          {w, "w"} when w > 0.0 -> {:ok, trunc(w_to_ms(w))}
          _ -> :error
        end
    end
  end

  @doc "Parse duration but raise if it fails"
  @spec ms!(duration) :: pos_integer
  def ms!(duration) do
    case ms(duration) do
      {:ok, ms} -> ms
      :error -> raise ArgumentError, "cannot parse #{inspect(duration)}"
    end
  end
end
