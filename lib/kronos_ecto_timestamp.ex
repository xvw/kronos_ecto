defmodule Kronos.Ecto.Timestamp do 

  @behaviour Ecto.Type

  def type, do: :datetime

  @doc """
  Handle casting to Kronos.Ecto.Timestamp
  """
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
    Kronos.to_datetime(t)
    |> or_error
  end
  

  defp or_error(value) do 
    case value do 
      {:ok, _} -> value 
      _ -> :error
    end
  end

end
