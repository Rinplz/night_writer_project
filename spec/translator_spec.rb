require './lib/translator'
require_relative 'spec_helper'

RSpec.describe Translator do

  before (:each) do
    @translated_string1 = Translator.new("a")
    @translated_string1_2 = Translator.new("A")
    @translated_string1_3 = Translator.new("A!")
    @translated_string2 = Translator.new("hello world")
    @translated_string3 = Translator.new("the quick brown fox jumps over the lazy dog")
    @translated_braille1 = Translator.new("0.\n..\n..")
    @translated_braille2 = Translator.new("0.0.0.0.0.\n00.00.0..0\n....0.0.0.\n")
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

  it 'can format a single braille letter for roman' do
    expect(@translated_braille1.format_for_roman).to eq(['0.','..','..'])
  end

  it 'can format more than 1 braille letter for roman' do
    expect(@translated_braille2.format_for_roman).to eq(['0.','00','..','0.','.0','..','0.','0.','0.','0.','0.','0.','0.','.0','0.'])
  end

  it 'can translate from braille' do
    expect(@translated_braille1.translate_to_roman).to eq("a")
    expect(@translated_braille2.translate_to_roman).to eq("hello")
  end

  it 'can translate 1 upcase letter to braille' do
    expect(@translated_string1_2.translate_to_braille).to eq("0.\n..\n..\n")
  end

  it 'can ignore punctuation' do
    expect(@translated_string1_3.translate_to_braille).to eq("0.\n..\n..\n")
  end

end
