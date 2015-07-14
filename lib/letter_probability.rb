class LetterProbability
  attr_reader :probability_hash

  def initialize
    @probability_hash = {}
  end

  def load_dictionary
    file_source = 'data/noun.pnz'
    File.open(file_source).each do |line|
      max_length = line.length
      line.split("").each_with_index do |c, i|
        break if i+1 > max_length
        letter_pair = "#{c}#{line[i+1]}"
        probability = @probability_hash.fetch(letter_pair, 0)
        probability += 1
        @probability_hash[letter_pair] = probability
      end
    end
    IO.write('data/probability.pnz', @probability_hash)
  end
end
