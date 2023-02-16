IO.puts "1) " <> "Hello World"

a = 1
IO.puts "2) #{is_integer(a)}"

b = 2.5
IO.puts "3) #{b}"

_c = [1,2,3]

d = fn a, b -> a - b end
IO.puts "4) #{d.(10, 5)}"

#Mapping

i = %{tamil: 54, english: 53}
IO.puts "5) #{i[:tamil]}"

i = %{"tamil" => 54, "english" => 53}
IO.puts "6) #{i["english"]}"

person = %{id: 100, name: "Peter", age: 25}
IO.puts "7) " <> person.name

#get values out tuples using pattern matching..

t = {100, "Peter", 25}
{_, name,_} = t
IO.puts "8) " <> "value from tuple using pattern matching " <> name

#Interpolation

name = "John"
IO.puts "9) " <> "Hello, #{name}!"

#Switch Case

x = 3
case {1, x, 3} do
{4, 5, 6} -> IO.puts "10) " <> "This clause won't match"
{1, 2, 3} -> IO.puts "10) " <> "This clause will match and bind x to 2 in this clause"
_ -> IO.puts "10) " <> "This clause would match any value"
end

#Anonymous function

f = fn
x,y when x>0 -> x+y
x,y -> x*y
end
IO.puts "11) " <> "#{f.(5,10)}"

##cond condition

cond do
  2 + 2 == 5 -> IO.puts("12) " <> "this is not true")
  3 - 2 == 2 -> IO.puts("12) " <> "Nor this")
  3 + 3 == 6 -> IO.puts("12) " <> "It's True")
end

cond do
  2 + 2 == 5 -> IO.puts "13) " <> "This is never true"
  2 * 2 == 3 -> IO.puts "13) " <> "Nor this"
  true -> IO.puts "13) " <> "This is always true (equivalent to else)"
end

cond do
  2 + 2 == 5 -> IO.puts "14) " <> "This is never true"
  2 * 2 == 3 -> IO.puts "14) " <> "Nor this"
  true ->
    cond do
      5 + 5 == 9 -> IO.puts("14) " <> "not true")
      10 * 3 == 30 -> IO.puts("14) " <> "This is inside else")
      true -> IO.puts("14) " <> "No match")
    end
end

## if and unless condition

if true do
  IO.puts "15) " <> "If condition is this true, it returns This"
end

unless false do
  IO.puts "16) " <> "If condition is this false, it returns This"
end

##if else condition

x = 10
if x == 9 do
  IO.puts "17) " <> x + 1
else
  IO.puts "17) " <> "This is else output #{x * x}"
end

##Anonymous Function

add = fn x,y -> x+y end
IO.puts "18) #{add.(10,15)}"

##capture operator function
#it capture functions

print = &(IO.puts/1)
print.("19) This text printed using capture operator(&)")

#it create anonymous functions

sum = &(&1 + &2 + &3 + &4)
IO.puts "20) #{sum.(5, 10, 15, 20)}"

##Pattern Matching Functions

handle_result = fn
  {a} -> "#{a} value passed in this function"
  {a,b} -> "#{a}, #{b} values passed in this function"
  {c,a,b} -> "#{c}, #{a}, #{b} values passed in this function"
end
IO.puts "21) " <> handle_result.({"one", "two", "three"})

##Named functions

defmodule Math do
  def sum(a, b) do
     a + b
  end
  #One line named functions
  def sub(a, b), do: a - b
end

IO.puts "22) #{Math.sum(5, 6)}"
IO.puts "23) #{Math.sub(10, 5)}"

##Private functions

defmodule Greeter do
  # If the user does not specify a country, after the \\ value is used as the default.
  def hello(u_name, country \\ "India") do
    if u_name == "test" do
      "hello #{u_name}, Welcome to #{country}! " <> details()
    else
      "hello #{u_name}, Welcome to #{country}!"
    end
  end
  # Only accessable from Greeter module functions
  defp details do
    "Your pass test123"
  end
end

# IO.puts(Greeter.details())        ##It returns error because details() is private function..
IO.puts "24) #{Greeter.hello("test")}"

##Enum map function takes another function as a parameter

list = [1,2,3,4,5]
double = fn x -> x*2 end
d_list = Enum.map(list, double)
# IO.inspect d_list, label: "25)"
IO.puts("25) #{inspect(d_list)}")

##with condition

person1 = %{name: "test", age: 25}
with {:ok, name} <- Map.fetch(person1, :name),
    {:ok, age} <- Map.fetch(person1, :age) do
  IO.puts "26) #{name} is #{age} years old."
    else
      _ ->
        :error
end

## Enum functions

#Enum all? function It returns true or false

enum_all1 = Enum.all?(["foo", "bar", "hello"], fn(x) -> String.length(x) == 3 end)
IO.puts("27) #{enum_all1}")
#It returns false because it checks all values is true or false. if all values true it returns true
enum_all2 = Enum.all?(["foo", "bar", "hel"], fn(x) -> String.length(x) == 3 end)
IO.puts("28) #{enum_all2}")
#It returns true because all value string length is 3..

#Unlike the above function, Enum any? will return true if at least one item evaluates to true:

enum_any1 = Enum.any?(["foo", "baree", "hel"], fn(x) -> String.length(x) == 5 end)
IO.puts("29) #{enum_any1}")
#it returns true because baree string len is 5.

#Enum chunk_every

enum_chunk = Enum.chunk_every([1,2,3,4,5,6], 2)
IO.puts("30) #{inspect(enum_chunk)}")
#it returns [[1,2],[3,4],[5,6]]

#Enum map_every

enum_map_every = Enum.map_every(1..10, 2, fn x -> x + 1000 end)
IO.puts "31) #{inspect(enum_map_every)}"
#it returns [1001, 2, 1003, 4, 1005, 6, 1007, 8, 1009, 10]

#Enum Filter

enum_filter = Enum.filter([1, 2, 3, 4], fn(x) -> rem(x, 2) == 0 end)
IO.puts "32) #{inspect(enum_filter)}"
#it returns [2,4] only true values

#Enum reduce

enum_reduce1 = Enum.reduce([5, 2, 3], fn(x, acc) -> x + acc end)
IO.puts("33) #{enum_reduce1}")
#Its return 10. if you use + Its add inside data's
enum_reduce2 = Enum.reduce([5, 2, 3], fn(x, acc) -> x * acc end)
IO.puts("34) #{enum_reduce2}")
#Its return 30. if you use * its multiply values

#Enum Sort

enum_sort1 = Enum.sort([5, 6, 1, 3, -1, 4])
IO.puts("35) #{inspect(enum_sort1)}")
enum_sort2 = Enum.sort([:foo, "bar", Enum, -1, 4])
IO.puts("36) #{inspect(enum_sort2)}")

#Enum uniq

enum_uniq = Enum.uniq([1, 2, 3, 2, 1, 1, 1, 1, 1])
IO.puts("37) #{inspect(enum_uniq)}")
#it returns [1, 2, 3]


##Add new values in Map

person = %{name: "John", age: 25}
person = Map.put person, :skill, "Programming"
IO.puts("38) #{inspect(person)}")
#it return %{age: 25, name: "John", skill: "Programming"}

##Update Map values (also update values using Map.put)
#best update method

person = %{person | age: 30}
IO.puts("39) #{inspect(person)}")
#it return %{age: 30, name: "John", skill: "Programming"}


## Pattern Matching in Maps

p1 = %{name: "John", age: 17}
p2 = %{name: "Jane", age: 21}
can_drive? = fn
  %{age: age} when age < 18 -> false
  %{age: age} when age > 75 -> false
  _ -> true
end
IO.puts("39) #{can_drive?.(p1)}")
IO.puts("40) #{can_drive?.(p2)}")

%{age: age} = p1
IO.puts "41) #{age}"


## MapSet

s = MapSet.new [1,2,3]
IO.puts "42) #{inspect(MapSet.put s,4)}"

## for loop

IO.puts "44) #{inspect(for n <- 1..10, do: n * 2)}"
con1 = for n <- 1..10, rem(n, 2) == 0, do: n
IO.puts "45) #{inspect(con1)}"
con2 = for n <- 1..100, rem(n, 2) == 0, rem(n, 3) == 0, do: n
IO.puts "46) #{inspect(con2)}"
