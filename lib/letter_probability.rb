class LetterProbability
  attr_reader :probability_hash

  def initialize
    @probability_hash = {}
  end

  def load_dictionary
    file_source = 'data/noun.pnz'
    File.open(file_source).each do |line|
      max_length = line.length
      line.chars.each_with_index do |c, i|
        break if line[i+1] == "\n" 
        letter_pair = "#{c}#{line[i+1]}"
        probability = @probability_hash.fetch(letter_pair, 0)
        probability += 1
        @probability_hash[letter_pair] = probability
      end
    end
    IO.write('data/probability.pnz', @probability_hash)
    write_csv
  end

  def write_csv
    require 'csv'
    CSV.open("data/probability.csv", "wb",
      :write_headers=> true,
      :headers => ["letter pair", "count"]) do |csv|
        probability_hash.map {|h| csv << h.to_a}
      end
  end
end
