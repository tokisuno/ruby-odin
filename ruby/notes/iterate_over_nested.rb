# teacher_mailboxes = [
#   ['Adams', 'Baker', 'Clark', 'Davis'],
#   ['Jones', 'Lewis', 'Lopez', 'Moore'],
#   ['Perez', 'Scott', 'Smith', 'Young']
# ]
#
# teacher_mailboxes.each_with_index do |row, row_index|
#   row.each_with_index do |teacher, column_index|
#     puts "Row:#{row_index} Column:#{column_index} = #{teacher}"
#   end
# end

test_scores = [[97, 76, 79, 93], [79, 84, 76, 79], [88, 67, 64, 76], [94, 55, 67, 81]]
test_scores.any? do |scores|
  scores.all? { |score| score > 80 }
end

vehicles = {
  alice: {year: 2019, make: "Toyota", model: "Corolla"},
  blake: {year: 2020, make: "Volkswagen", model: "Beetle"},
  caleb: {year: 2020, make: "Honda", model: "Accord"}
}
