## pattern matching best example ##

iex> {:ok, result} = {:ok, 13}
{:ok, 13}
iex> result
13

iex> {:ok, result} = {:error, :oops}
** (MatchError) no match of right hand side value: {:error, :oops}

iex> [head | tail] = [1, 2, 3]
[1, 2, 3]
iex> head
1
iex> tail
[2, 3]

iex> [head | tail] = [1, 2, 3]
[1, 2, 3]
iex> head
1
iex> tail
[2, 3]
iex> list = [10 | tail]
[10,2,3]
iex> list
[10,2,3]

##another usage of pattern matching

iex> "Hello, " <> who = "Hello, world"
"Hello, world"
iex> who
"world"

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

##The pin operator##

iex> x = 1
1
iex> ^x = 2
** (MatchError) no match of right hand side value: 2


##elem function##

Use elem function to get values

iex> t = {100, "Peter", 25}
{100, "Peter", 25}
iex> elem(t, 0)
100
iex> elem t, 2
25
iex> elem t, 1
"Peter"

##Add values to list

iex> list = [1,2,3,4]
[1, 2, 3, 4]
iex> is_list list
true
iex> newlist = list ++ [5,6]
[1, 2, 3, 4, 5, 6]
iex> newlist -- list
[5, 6]

##Multi value list..

iex> [id: 101, name: "John", age: 23]
[id: 101, name: "John", age: 23]

##concat 

#when double qoutes
<>
#when single qoutes
++

##Interpolation

iex(26)> name = "John"
"John"
iex(27)> "Hello, #{name}!"
"Hello, John!"

##Elixir Functions can be
๏ Anonymous
๏ Named


##Switch case

iex> case {1, 2, 3} do
...>   {4, 5, 6} ->
...>     "This clause won't match"
...>   {1, x, 3} ->
...>     "This clause will match and bind x to 2 in this clause"
...>   _ ->
...>     "This clause would match any value"
...> end
"This clause will match and bind x to 2 in this clause"

iex> case {1, 2, 3} do
...>   {1, x, 3} when x > 0 ->
...>     "Will match"
...>   _ ->
...>     "Would match, if guard condition were not satisfied"
...> end
"Will match"