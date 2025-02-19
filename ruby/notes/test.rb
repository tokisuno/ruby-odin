# frozen_string_literal: true
arr = [1, 2, 3]

# shut up lsp

arr.each_with_index do |v, k|
  puts "#{k}: #{v}"
end
