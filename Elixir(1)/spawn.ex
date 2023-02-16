defmodule Spawn do
  def test1 do
    receive do
      _ -> IO.puts("test1 message")
    end
  end

  def test2 do
    receive do
      :hello -> IO.puts("test2 message")
    after
      10000 -> IO.puts("I am not receive any messages previous 10s")
    end
    test2()
  end

  def test3 do
    receive do
      value -> IO.puts(value)
      Process.sleep(2500)
      send(self(), value + 1)
    end
    test3()
  end

  def test4 do
    receive do
      value -> IO.puts(value)
      Process.sleep(2500)
      send(self(), value * 2)
    end
    test4()
  end

  def greet do
    receive do
      {:hello, who} -> IO.puts("Hello, #{who}!")
      {:bye, who} -> IO.puts("Goodbye, #{who}!")
      :quit -> exit("Asked to quit")
    end
    greet()
  end

end

defmodule Listener do
  def start do
    spawn(fn -> loop() end)
  end

  def loop do
    receive do
      {:message, contents} -> IO.puts("Received message: #{inspect(contents)}")
      :quit -> exit("exited")
    end

    loop()
  end
end

# This is Listener Module. It's Used to Receive Message from other server
# We create sender program in server side. Sender program...
# pid = Listener.start      This line start the sender program
# send pid, {:message, "first"}     This line send message to client side. Client side receiver receice this message.
# [{:message, "first"}, {:message, "second"}, {:message, "third"}, :quit] |> Enum.each(& (send pid, &1))
