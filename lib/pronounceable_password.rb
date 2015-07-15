require 'csv'

class PronounceablePassword

  LETTERS = %w(a b c d e f g h i j k l m n o p q r s t u v w x y z)

  def initialize(probability_corpus)
    @probability_corpus = probability_corpus
    @prob_hash = read_probabilities
  end

  def read_probabilities
    probability = {}
    CSV.foreach(@probability_corpus, :headers => true, :col_sep => ',') do |row|
      probability[row[0].to_s] = row[1].to_i
    end
    probability
  end

  def best_next_letter(letter)
    matches = LETTERS.map do |l|
      prob = @prob_hash.fetch("#{letter}#{l}", 0)
      {"#{letter}#{l}" => prob}
    end
    best_match = matches.sort_by{ |x| x.first.last }
                        .reject{ |x| x.first.last < 1 }
                        .reverse
                        .slice(0, 2)
                        .sample
    best_match.first.first.chars.last
  end
end