defmodule StructExa do
  def can_drive?(%NewStruct{age: age}) when age < 18, do: false
  def can_drive?(%NewStruct{age: age}) when age > 75, do: false
  def can_drive?(%NewStruct{}), do: true
  def get_older(%NewStruct{age: age} = person) do
    %NewStruct{person | age: age + 1}
  end

  def new(name, age) when is_binary(name)
  and is_integer(age) do
    %NewStruct{name: name, age: age}
  end
end
