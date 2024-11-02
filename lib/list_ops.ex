defmodule ListOps do
  # Please don't use any external modules (especially List or Enum) in your
  # implementation. The point of this exercise is to create these basic
  # functions yourself. You may use basic Kernel functions (like `Kernel.+/2`
  # for adding numbers), but please do not use Kernel functions for Lists like
  # `++`, `--`, `hd`, `tl`, `in`, and `length`.

  @spec count(list) :: non_neg_integer
  def count([]), do: 0
  def count([_ | t]), do: 1 + count(t)


  @spec reverse(list) :: list
  def reverse([]), do: []
  def reverse([h | t]), do: append(reverse(t), [h])

  @spec map(list, (any -> any)) :: list
  def map([], _f), do: []
  def map([h | t], f), do: [f.(h) | map(t, f)]

  @spec filter(list, (any -> as_boolean(term))) :: list
  def filter([], _f), do: []
  def filter([h | t], f), do: if(f.(h), do: [h | filter(t, f)], else: filter(t, f))


  @type acc :: any
  @spec foldl(list, acc, (any, acc -> acc)) :: acc
  def foldl([], acc, _f), do: acc
  def foldl([h | t], acc, f), do: foldl(t, f.(h, acc), f)


  @spec foldr(list, acc, (any, acc -> acc)) :: acc
  def foldr([], acc, _f), do: acc
  def foldr([h | t], acc, f), do: f.(h, foldr(t, acc, f))


  @spec append(list, list) :: list
  def append([], b), do: b
  def append([h | t], b), do: [h | append(t, b)]


  @spec concat([[any]]) :: [any]
  def concat([]), do: []
  def concat([h | t]), do: append(h, concat(t))
end
