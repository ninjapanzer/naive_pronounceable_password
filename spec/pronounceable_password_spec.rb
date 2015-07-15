require_relative './spec_helper'
require_relative '../lib/pronounceable_password'

describe 'Pronounceable Passwords' do

  before :each do
    @pronounce = PronounceablePassword.new './spec/fixtures/tiny_corpus.csv'
  end

  it 'will load the probability corpus csv' do
    probabilities = @pronounce.read_probabilities
    expect(probabilities['aa']).to equal 1
    expect(probabilities['kb']).to equal nil
    expect(probabilities['za']).to equal 26
  end

  it 'will pick the next best letter' do
    password = ['z']
    password << @pronounce.best_next_letter('z')
    expect(password).to eql ['z','a']
  end
end
