require_relative './lib/pronounceable_password'
pronounce = PronounceablePassword.new
pass_length = 10
starting_letter = PronounceablePassword::LETTERS.sample
password = [starting_letter]
while password.length < pass_length do 
  password << pronounce.best_next_letter(password[password.length-1])
end
puts password.join ""
