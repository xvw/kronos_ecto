defmodule Kronos.Ecto.Timestamp do 

  @behaviour Ecto.Type

  def type, do: :datetime

  @doc """
  Handle casting to Kronos.Ecto.Timestamp
  """
  def cast(raw_value)

  def cast(%DateTime{} = dt),     do: {:ok, dt}
  def cast(i) when is_integer(i), do: or_error(DateTime.from_unix(i))
  def cast(f) when is_float(f),   do: cast(round(f))
  
  def cast(string) when is_binary(string) do 
    case Integer.parse(string) do 
      {value, _} -> cast(value)
      :error -> :error
    end
  end
  def cast(t) do
    case t do 
      {Kronos, _, _, _, _} -> 
        or_error(Kronos.to_datetime(t))
      _ -> :error
    end
  end

  @doc """
  Load from the native Ecto representation
  """
  def load(input)

  def load(%DateTime{} = dt) do 
    {:ok, Kronos.from_datetime(dt)}
  end

  def load({{a, b, c}, {d, e, f, _}}), do: load({{a, b, c}, {d, e, f}})
  def load({{_, _, _}, {_, _, _}} = tpl) do 
    Kronos.new(tpl)
    |> or_error
  end
  def load(_), do: :error
  

  defp or_error(value) do 
    case value do 
      {:ok, _} -> value 
      _ -> :error
    end
  end

end
