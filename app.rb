require_relative './lib/pronounceable_password'
pronounce = PronounceablePassword.new
pass_length = 5
password = ['t']
while password.length < pass_length do 
  password << pronounce.best_next_letter(password[password.length-1])
end
puts password.join ""
