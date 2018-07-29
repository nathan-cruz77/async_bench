defmodule Stopwatch do
  defmacro time_it(do: block) do
    quote do
      time_start = System.monotonic_time
      return_value = unquote(block)
      time_end = System.monotonic_time
      {return_value, div(time_end - time_start, 1_000_000)}
    end
  end
end

defmodule Runner do
  require Stopwatch

  def run(n) do
    1..n
    |> Enum.map(fn _ -> Task.async(fn -> :timer.sleep(1_000) end) end)
    |> Enum.map(fn t -> Task.await(t, 10_000) end)
  end

  def run_and_log(n \\ 10_000) do
    {_, elapsed} = Stopwatch.time_it do
      run(n)
    end

    IO.puts("Executed in #{elapsed}ms")
  end
end

Runner.run_and_log
