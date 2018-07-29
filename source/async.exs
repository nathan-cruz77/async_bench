1..10_000
|> Enum.map(fn _ -> Task.async(fn -> :timer.sleep(1_000) end) end)
|> Enum.map(fn t -> Task.await(t, 10_000) end)
