data = [
  {
    name: 'James',
    age: 50,
    first_language: 'english',
    job_title: 'general manager'
  },
  {
    name: 'Jill',
    age: 32,
    first_language: 'italian',
    job_title: 'leet coder'
  },
  {
    name: 'Helen',
    age: 24,
    first_language: 'dutch',
    job_title: 'biscuit quality control'
  },
  {
    name: 'Bob',
    age: 64,
    first_language: 'english',
    job_title: 'table tennis king'
  },
  {
    name: 'Betty',
    age: 55,
    first_language: 'spanish',
    job_title: 'pie maker'
  }
]

name = 'Jill'
age = 32
job_title = 'leet coder'

match = data.find do |person|
  person[:name] == name && person[:age] == age && person [:job_title] == job_title
end

match&.fetch(:first_language)

# doing the same thing with pattern matching
## rubocup again doesn't know how to handle this
case data
in [*, { name: ^name, age: ^age, first_language: first_language, job_title: ^job_title }, *]
else
  first_language = nil
end

puts first_language
