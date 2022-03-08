require './lib/translator'

RSpec.describe Translator do

  before (:each) do
    @translated_string1 = Translator.new("a")
    @translated_string2 = Translator.new("hello world")
  end

  it 'can translate 1 letter' do
    expect(@translated_string1.translate).to eq("0.\n..\n..\n")
  end

  it 'can translate more than 1 letter' do
    expect(@translated_string2.translate).to eq("0.0.0.0.0....00.0.0.00\n00.00.0..0..00.0000..0\n....0.0.0....00.0.0...\n")
  end
end
