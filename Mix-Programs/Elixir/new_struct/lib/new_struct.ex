defmodule NewStruct do
  defstruct [:name, :age]
end

defmodule Property do
  @doc """

  ## Examples

      iex> shirt = %Shirt{sku: "101", price: 75.0, prop: %Property{color: "red", size: "XL"}}
      %Shirt{price: 75.0, prop: %Property{color: "red", size: "XL"},sku: "101"}
      iex> put_in(shirt.prop.size, "L")
      %Shirt{price: 75.0, prop: %Property{color: "red", size: "L"},sku: "101"}
      iex> update_in(shirt.prop.color, &String.capitalize(&1))
      %Shirt{price: 75.0, prop: %Property{color: "Red", size: "XL"}, sku: "101"}
  """
  defstruct color: "", size: ""
end

defmodule Shirt do
  defstruct sku: "", price: 0.0, prop: %Property{}
end

##Examples
#iex>shirt = %Shirt{sku: "101", price: 75.0, prop: %Property{color: "red", size: “XL"}}
#%Shirt{price: 75.0, prop: %Property{color: "red", size: "XL"},sku: "101"}

#Let us change the size of this shirt to “L”
#put_in(shirt.prop.size, “L")

#Use the update_in function by passing a transformation
#update_in(shirt.prop.color, &String.capitalize(&1))
