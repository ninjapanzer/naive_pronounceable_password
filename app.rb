require_relative './lib/pronounceable_password'
require_relative './lib/letter_probability'
#prob = LetterProbability.new
#prob.load_dictionary
pronounce = PronounceablePassword.new './data/probability.csv'
pass_length = 10
starting_letter = PronounceablePassword::LETTERS.sample
password = [starting_letter]
while password.length < pass_length do 
  password << pronounce.best_next_letter(password[password.length-1])
end
puts password.join
