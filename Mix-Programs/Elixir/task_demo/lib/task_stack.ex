defmodule TaskStack do
  def start do
    Task.start_link(fn -> stack_process([]) end)
  end

  def stack_process(list) do
    receive do
      {:push, item} ->
        stack_process([item | list])

      {:pop, caller} ->
        {head, tail} = get_head_and_tail(list)
        send(caller, head)
        stack_process(tail)
    after
      10_0000 -> exit(:no_op)
    end
  end

  defp get_head_and_tail([]), do: {:nothing, []}
  defp get_head_and_tail(list), do: {hd(list), tl(list)}
end
