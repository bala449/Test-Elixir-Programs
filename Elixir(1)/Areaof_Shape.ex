defmodule AreaofShape do

  @doc "Get Input shape from user"
  def areaofshape do
    input_shape =IO.gets("Enter 1 to find Area of Square \nEnter 2 to find Area of Circle \nEnter 3 to find Area of Triangle \nEnter 4 to find Area of Rectangle \n") |> String.trim_trailing
    fill_shape(input_shape)
  end

  @doc "Fillter user selected value"
  def fill_shape(input_shape) do
    case input_shape do
      "1" -> areaofsquare()
      "2" -> areaofcircle()
      "3" -> areaoftriangle()
      "4" -> areaofrectangle()
      _ ->
        IO.puts "Please Enter valid Inputs : \n"
        areaofshape()
    end
  end

  @doc "Get the side from the user, then find area of square using a * a"
  def areaofsquare do
    side = IO.gets("Enter Sides of Square : ") |> String.trim_trailing |> validate
    area = side * side
    IO.puts("Area of Square is #{area}")
    acknowledgement()
  end

  @doc "Get the radius from the user, then find area of circle using 3.14159 * radius * radius"
  def areaofcircle do
    radius = IO.gets("Enter radius of Circle : ") |> String.trim_trailing |> validate
    area = 3.14159 * radius * radius
    IO.puts("Area of Circle is #{area}")
    acknowledgement()
  end

  @doc "Get the base and height from the user, then find area of triangle using base * height /2"
  def areaoftriangle do
    base = IO.gets("Enter base of Triangle : ") |> String.trim_trailing |> validate
    height = IO.gets("Enter height of Triangle : ") |> String.trim_trailing |> validate
    area = (base * height) / 2
    IO.puts("Area of Triangle is #{area}")
    acknowledgement()
  end

  @doc "Get the length and breadth from the user, then find area of rectangle using length * breadth"
  def areaofrectangle do
    length = IO.gets("Enter length of Rectangle : ") |> String.trim_trailing |> validate
    breadth = IO.gets("Enter breadth of Rectangle : ") |> String.trim_trailing |> validate
    area = length * breadth
    IO.puts("Area of Rectangle is #{area}")
    acknowledgement()
  end

  @doc "Check user continue or not"
  def acknowledgement do
    acknowledge = IO.gets("Do you want to calculate the area of another shape?(yes/no) : ") |> String.trim_trailing
    case acknowledge do
      "yes" -> areaofshape()
      "no" -> IO.puts("Thanks!")
      _ ->
        IO.puts("Please Enter valid Input \n")
        acknowledgement()
    end
  end

  @doc "Check the user input is integer or float"
  def validate(string_val) do
    if(String.contains?(string_val, ".")) do
      String.to_float(string_val)
    else
      String.to_integer(string_val)
    end
  end
end
