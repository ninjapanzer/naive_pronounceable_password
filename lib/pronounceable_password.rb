require 'csv'

class PronounceablePassword

  LETTERS = %w(a b c d e f g h i j k l m n o p q r s t u v w x y z)

  def initialize(probability_corpus)
    @probability_corpus = probability_corpus
    @probability = {}
  end

  def read_probabilities
    CSV.foreach(@probability_corpus, :headers => true, :col_sep => ',') do |row|
      @probability[row[0].to_s] = row[1].to_i
    end
    @probability
  end

  def possible_next_letters(letter)
    matches = LETTERS.map do |l|
      prob = @probability.fetch("#{letter}#{l}", 0)
      {"#{letter}#{l}" => prob}
    end
    possible_next_letters = matches.reject{ |x| x.first.last < 1 }
                                    .sort_by{ |x| x.first.last }
                                    .reverse!
    possible_next_letters
  end

  def most_common_next_letter(letter)
    first_probability = possible_next_letters(letter).first
    first_probability_chars = first_probability.keys.first.chars

    first_probability_chars.last
  end

  def common_next_letter(letter, sample_limit = 2)
    next_letters = possible_next_letters(letter).slice(0, sample_limit).sample
    next_letters.first.first.chars.last
  end
end
