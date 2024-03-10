defmodule UnionFind do
  @moduledoc """
  Documentation for `UnionFind`.
  """
  use Application

  def start(_type, _args) do
    # code
    uf = Uf1.make(5)
    IO.inspect(uf)
    groups = length(uf)
    first = Uf1.union({uf, groups}, 2, 3)
    second = Uf1.union(first, 1, 4)
    third = Uf1.union(second, 4, 0)
    IO.inspect(first)
    IO.inspect(second)
    IO.inspect(third)
    IO.inspect(all(third, 0))
    IO.inspect(Uf1.find(third, 0))
    summary(third)

    Supervisor.start_link([], strategy: :one_for_one)
  end

  def all({reps, _groups}, x) do
    r = Uf1.find(reps, x)

    Enum.flat_map(0..(length(reps) - 1), fn i ->
      if Uf1.find(reps, i) == r do
        [i]
      else
        []
      end
    end)
  end

  def summary({reps, _groups}) do
    Enum.reduce(0..(length(reps) - 1), [], fn i, seen ->
      r = Uf1.find(reps, i)

      if r not in seen do
        Enum.map(i..(length(reps) - 1), fn j ->
          if Uf1.find(reps, j) == r do
            IO.write(j)
          else
            nil
          end
        end)

        IO.write("\n")
        [r | seen]
      else
        seen
      end
    end)
  end
end
