test_data = [4, 3, 78, 2, 0, 2]

def bubble_sort(data)
  n = data.length
  for i in (0..n-1).each do
    for j in (0..n-i-1).each do
      break if n-1 == j
      if data[j] > data[j+1]
        data[j], data[j+1] = data[j+1], data[j]
      end
    end
  end
  puts data
end

bubble_sort(test_data)
