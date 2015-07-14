require_relative './letter_probability'

class PronounceablePassword

  LETTERS = %w(a b c d e f g h i j k l m n o p q r s t u v w x y z)

  def initialize
    prob = LetterProbability.new
    prob.load_dictionary
    @prob_hash = prob.probability_hash
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
    best_match.first.first.split("").last
  end
end