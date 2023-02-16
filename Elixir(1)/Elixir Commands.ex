IO.puts "test"					#print values

IO.inspect [1,2,3,4]    #print list and tuple

a = 1 							#define variable int (No need to declare datatype)

b = 2.5							#float

c = "string" 					#string

d = [1,2,3]						#list (use in longer values)

e = {1,2,3}  					#tuple (use in short values)

f = fn a - b end				#Anonymous Functions start with fn and end with end..
IO.puts f(10, 5)

g = [tamil: 45, english: 35]	#Named List

h = :test						#Atom (This is like string and more efficiet to string)

i = %{tamil: 54, english: 53}	#map (access values using i[:tamil])

div(12,5)						#Output 2 div function throw integer value of division

j = 12/5 						#Output 2.4 it returns float value of division

rem 13,5 						#brackets not necessary Output 3

### Operators

##and - &&

10 > 6 and 5 (10 > 6 && 5)		#and returns second parameter if condition is 												true #Output 5

10 < 6 and 5 					#Output False

##or - ||

10 > 6 or 5 					#or returns true if condition is true #Output true

10 < 6 or 5 					#Output 5

##not - !

(10 > 6)						#Output false

list = [1,2,3,4]
newlist = list ++ [5,6]			#It returns [1, 2, 3, 4, 5, 6]
newlist -- list 				#It returns [5, 6]

3 in [1,3,5,7]					#Its called checkmembership returns true

list = [1,2,3,4]
get first value using hd
iex> hd(list) 					#return 1 its call head
iex> tl(list)					#return [2,3,4] except head it's called tail

iex> [5 | [6,7,8]] 				#return [5,6,7,8] used to concat it's called cons operator

IO.puts("25) #{inspect(list)}")   #combine strings with list

iex> r ModuleName           #reload module without again compiling file..

Enum.all?([1, 2 , 3])       #all?1 returns true. because When an element has a falsy value (false or nil) iteration stops immediately and false is returned
Enum.all?([1, nil(or)false, 3]) #false

Enum.each(["one", "two", "three"], fn(x) -> IO.puts(x) end) #this function separate list values

Enum.min([5, 3, 0, -1])     #It returns -1 minimum value

Enum.max([5, 3, 0, -1])     #It returns 5 maximum value

Enum.reduce([5, 2, 3], fn(x, acc) -> x + acc end) #Its return 10. if you use + Its add inside data's
Enum.reduce([5, 2, 3], fn(x, acc) -> x * acc end) #Its return 30. if you use * its multiply values

##get values out tuples using pattern matching..

iex(18)> t = {100, "Peter", 25}
{100, "Peter", 25}
iex(22)> {id, name, age} = t
{100, "Peter", 25}
iex(23)> id
100
iex(24)> name
"Peter"
iex(25)> age
25

if you are intersted only in name then use simply underscore..

iex(26)> {_, name, _} = t
{100, "Peter", 25}
iex> name
"peter"

underscore is not be taken as a variable


## different get methods for tuples

i = %{"tamil" => 54, "english" => 53}
if we use => then use i["name"]
IO.puts i["english"]

person = %{id: 100, name: "Peter", age: 25}
if we use : then use i.name
IO.puts person.name

##Match any map with a name key on it

iex> %{name: p_name} = person
%{age: 25, id: 100, name: "Peter"}
iex> p_name
"Peter"

#Higher order function (when use anonymous function inside the named function is called HOF)

defmodule Sample do
  def sample(test, value) do
   value.(test)
  end
end

value = fn(x) -> "Your value is #{x}" end

Sample.sample("rest", value)
#Output "Your value is rest"


##Word lists
#The ~w sigil is used to generate lists of words (words are just regular strings).
#Inside the ~w sigil, words are separated by whitespace.

iex> ~w(foo bar bat)
["foo", "bar", "bat"]

### Match macto ###

iex> match?(1, 1)
    true
iex> match?({1, _}, {1, 2})
    true
iex> map = %{a: 1, b: 2}
iex> match?(%{a: _}, map)
    true
iex> a = 1
iex> match?(^a, 1)
    true

iex> list = [a: 1, b: 2, a: 3]
iex> Enum.filter(list, &match?({:a, _}, &1))
    [a: 1, a: 3]
iex> list = [a: 1, b: 2, a: 3]
iex> Enum.filter(list, &match?({:a, x} when x < 2, &1))
    [a: 1]


####  IMPORTANT  ####

def map([], _func), do: []
def map([head | tail], func) do
[func.(head) | map(tail, func)]
end
iex> ListProcessor.map [1,2,3,4], &(&1*&1)
[1, 4, 9, 16]


# Math deps

{:math, "~> 0.6.0"} # Its very usefull
