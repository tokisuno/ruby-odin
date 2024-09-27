test_data = [17, 3, 6, 9, 15, 8, 6, 1, 10]

def stock_picker(data)
  start = 0
  final = 1
  sum = 0
  arr = []
  while final != data.length do
    if data[start] > data[final]
      start += 1
      final += 1
      next
    end
    arr.push(data[start])
    arr.push(data[final])
    start += 1
    final += 1
  end
  arr.uniq!
  arr.each_cons(2) do |start, final|
    if start < final
      next
    else
      arr.delete_at(arr.index(final))
    end
  end
  if arr[-2] > arr[-1] then arr.delete_at(arr.index(arr[-1])) end

  puts "Day ##{data.index(arr[0])} -> Day ##{data.index(arr[-1])}: +$#{arr[-1] - arr[0]} :)"
end

stock_picker(test_data)
