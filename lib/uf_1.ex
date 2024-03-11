defmodule Uf1 do
  def make(n) do
    uf = Enum.to_list(0..(n - 1))
    {uf, length(uf)}
  end

  def find({reps, _}, x), do: Enum.at(reps, x)
  def find(reps, x), do: Enum.at(reps, x)

  def union({reps, groups}, x, y) do
    rx = find(reps, x)
    ry = find(reps, y)

    if rx == ry do
      {reps, groups}
    else
      new_reps =
        Enum.map(reps, fn
          ^rx ->
            ry

          other ->
            other
        end)

      {new_reps, groups - 1}
    end
  end
end
