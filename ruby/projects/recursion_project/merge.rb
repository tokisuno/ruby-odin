# frozen_string_literal: true

# learn how tf merge-sort works again because it's been months
# LMAO

a = [9, 3, 7, 5, 6, 4, 8, 2]
b = [3, 2, 1, 13, 8, 5, 0, 1]
c = [105, 79, 100, 110]

def merge(list_a, list_b)
  size_a = list_a.size
  size_b = list_b.size
  list_c = []

  i = 0
  j = 0
  k = 0

  while i <= size_a - 1 && j <= size_b - 1
    if list_a[i] < list_b[j]
      list_c[k] = list_a[i]
      k += 1
      i += 1
    else
      list_c[k] = list_b[j]
      k += 1
      j += 1
    end
  end

  while i <= size_a - 1 && k <= (size_a + size_b)
    list_c[k] = list_a[i]
    i += 1
    k += 1
  end

  while j <= size_b - 1
    list_c[k] = list_b[j]
    j += 1
    k += 1
  end

  list_c
end

def merge_sort(arr)
  return arr if arr.length <= 1

  mid = arr.length / 2
  lhs = arr.take(mid)
  rhs = arr.drop(mid)
  left = merge_sort(lhs)
  right = merge_sort(rhs)

  merge(left, right)
end

p merge_sort(a)
p merge_sort(b)
p merge_sort(c)
