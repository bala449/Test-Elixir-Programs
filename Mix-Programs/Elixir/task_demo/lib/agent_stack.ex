defmodule AgentStack do
  use Agent

  def start() do
    Agent.start(fn -> [] end, name: __MODULE__)
  end

  def push(item) do
    Agent.update(__MODULE__, fn list -> [item | list] end)
  end

  def pop() do
    h = Agent.get(__MODULE__, fn list -> hd(list) end)
    Agent.update(__MODULE__, fn list -> tl(list) end)
    h
  end

  # Stope the Agent
  def stop(), do: Agent.stop(__MODULE__)
end
