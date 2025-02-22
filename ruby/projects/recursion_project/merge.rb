# frozen_string_literal: true

# learn how tf merge-sort works again because it's been months
# LMAO

# a = [2, 8, 15, 18, 19, 25]
# b = [5, 9, 12, 17]
a = [9, 3, 7, 5, 6, 4, 8, 2]

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

# psuedocode based on youtube video
# (i am confused but it's getting there)
def msort(_arr, low = 0, high = 0, res = [])
  if low < high
    mid = (low + high) / 2
    msort(low, mid)
    msort(mid + 1, high)
    merge((low..mid), (mid + 1..high))
  end
  res
end

p msort(a)
