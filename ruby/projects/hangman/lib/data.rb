module DataManip
  def save_and_quit
    data = {
      "word": @word,
      "guesses": @guesses,
      "max_guesses": @max_guesses,
      "used_letters": @used_letters,
      "underscores": @underscores
    }
    json_data = JSON.generate(data)

    file_path = './data/saves/save.json'
    File.open(file_path, 'w') do |file|
      file.write(json_data)
    end

    @game = false
  end

  def load_save
    json_data = File.read('./data/saves/save.json')
    data = JSON.parse(json_data, symbolize_names: true)
    @word = data[:word]
    @guesses = data[:guesses]
    @max_guesses = data[:max_guesses]
    @used_letters = data[:used_letters]
    @underscores = data[:underscores]
    # data
  end
end
