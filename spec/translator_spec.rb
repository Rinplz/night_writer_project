require './lib/translator'

RSpec.describe Translator do

  before (:each) do
    @translated_string1 = Translator.new("a")
    @translated_string2 = Translator.new("hello world")
    @translated_string3 = Translator.new("the quick brown fox jumps over the lazy dog")
  end

  it 'can translate 1 letter to braille' do
    expect(@translated_string1.translate_to_braille).to eq("0.\n..\n..\n")
  end

  it 'can translate more than 1 letter to braille' do
    expect(@translated_string2.translate_to_braille).to eq("0.0.0.0.0....00.0.0.00\n00.00.0..0..00.0000..0\n....0.0.0....00.0.0...\n")
  end

  it 'can format an input for braille' do
    expect(@translated_string1.format_for_braille).to eq(['a'])
    expect(@translated_string3.format_for_braille).to eq(['the quick brown fox jumps over the lazy ', 'dog'])
  end

  it 'can format a single input for roman' do
    expect(@translated_braille.format_for_roman).to eq(['0.\n..\n..\n'])
  end
end
