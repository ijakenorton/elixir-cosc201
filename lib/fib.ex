defmodule Fib do
  def fib(0), do: 0
  def fib(1), do: 1
  def fib(n) when n > 1, do: fib(n - 1) + fib(n - 2)

  def fibC(n), do: fibC(1, 1, n)
  def fibC(a, _b, 0), do: a
  def fibC(a, b, n), do: fibC(b, a + b, n - 1)
end
