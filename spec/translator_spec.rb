require './lib/translator'

RSpec.describe Translator do

  before (:each) do
    @translated_string1 = Translator.new("a")
  end

  it 'can translate 1 letter' do
    expect(@translated_string1.translate).to eq('O . \n. . \n. . ')
  end
end
