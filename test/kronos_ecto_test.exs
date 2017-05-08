defmodule Kronos.EctoTest do
  use ExUnit.Case
  doctest Kronos.Ecto

  test "cast with a DateTime" do 
    dt = DateTime.from_unix!(0)
    assert Kronos.Ecto.Timestamp.cast(dt) == DateTime.from_unix(0)
  end

  test "cast with an integer" do 
    assert Kronos.Ecto.Timestamp.cast(12) == DateTime.from_unix(12)
  end

  test "cast with a float" do 
    assert Kronos.Ecto.Timestamp.cast(12.68) == DateTime.from_unix(13)
  end

  test "cast with a string" do 
    assert Kronos.Ecto.Timestamp.cast("127") == DateTime.from_unix(127)
  end

  test "cast with a Kronos.t" do 
    t = Kronos.new!(10098)
    assert Kronos.Ecto.Timestamp.cast(t) == DateTime.from_unix(10098)
  end

  test "cast with failure" do 
    assert Kronos.Ecto.Timestamp.cast("k") == :error
  end
  

  test "load from datetime" do 
    t = DateTime.from_unix!(10098)
    assert Kronos.Ecto.Timestamp.load(t) == Kronos.new(10098)
  end

  test "load from internal representation" do 
    t = {{2017, 4, 25}, {22, 21, 15}}
    assert Kronos.Ecto.Timestamp.load(t) == Kronos.new(1493158875)
  end

  test "load from internal representation 2" do 
    t = {{2017, 4, 25}, {22, 21, 15, 0}}
    assert Kronos.Ecto.Timestamp.load(t) == Kronos.new(1493158875)
  end
    
  test "load with error" do 
    assert Kronos.Ecto.Timestamp.load("k") == :error
  end

  test "dump dateTime" do 
    dt = DateTime.from_unix!(0)
    assert Kronos.Ecto.Timestamp.cast(dt) == DateTime.from_unix(0)
  end

  test "dump from Kronos" do 
    dt = Kronos.new!(45678)
    assert Kronos.Ecto.Timestamp.cast(dt) == DateTime.from_unix(45678)
  end

  test "dump failure" do 
    assert Kronos.Ecto.Timestamp.cast("d") == :error
  end
  


end
