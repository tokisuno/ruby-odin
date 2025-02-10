require 'csv'
require 'erb'
require 'date'
require 'google/apis/civicinfo_v2'

def clean_zipcode(zipcode)
  zipcode.to_s.rjust(5, '0')[0..4]
end

def find_largest_hashes(hash)
  puts hash.sort_by { |_, value| value }.to_h
end

def clean_phone(number)
  number = number.gsub(/\s+/, '').delete('()').delete('.').delete('-')

  bad = nil
  if number.length == 10
    number
  elsif number.length < 10
    bad
  elsif number.length == 11
    if number.split('')[0] == '1'
      number.split('')[1..].join
    else
      bad
    end
  else
    bad
  end
end

def registration_times(regdate)
  DateTime.strptime(regdate, '%m/%d/%y %H:%M')
end

def legislators_by_zipcode(zip)
  civic_info = Google::Apis::CivicinfoV2::CivicInfoService.new
  civic_info.key = 'AIzaSyClRzDqDh5MsXwnCWi0kOiiBivP6JsSyBw'

  begin
    civic_info.representative_info_by_address(
      address: zip,
      levels: 'country',
      roles: ['legislatorUpperBody', 'legislatorLowerBody']
    ).officials
  rescue Google::Apis::ClientError
    'You can find your representatives by visiting www.commoncause.org/take-action/find-elected-officials'
  end
end

def save_thank_you_letter(id, form_letter)
  Dir.mkdir('output') unless Dir.exist?('output')

  filename = "output/thanks_#{id}.html"

  File.open(filename, 'w') do |file|
    file.puts form_letter
  end
end

puts 'Event Manager Initialized'

contents = CSV.open(
  'event_attendees.csv',
  headers: true,
  header_converters: :symbol
)

dictionary = {}
days = {}

template_letter = File.read('form_letter.erb')
erb_template = ERB.new template_letter

contents.each do |row|
  id = row[0]
  name = row[:first_name]
  zipcode = clean_zipcode(row[:zipcode])
  legislators = legislators_by_zipcode(zipcode)

  phone_number = clean_phone(row[:homephone])
  reg_date = registration_times(row[:regdate])
  if !days.key?(:"#{Date::ABBR_DAYNAMES[reg_date.wday]}")
    days.merge!("#{Date::ABBR_DAYNAMES[reg_date.wday]}": 1)
  else
    days[:"#{Date::ABBR_DAYNAMES[reg_date.wday]}"] += 1
  end

  if !dictionary.key?(:"#{reg_date.hour}")
    dictionary.merge!("#{reg_date.hour}": 1)
  else
    dictionary[:"#{reg_date.hour}"] += 1
  end

  form_letter = erb_template.result(binding)
  save_thank_you_letter(id, form_letter)


end

find_largest_hashes(dictionary)
find_largest_hashes(days)
