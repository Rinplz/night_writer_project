require './lib/file_create'
require 'tempfile'
require 'pry'

RSpec.describe FileCreate do

  test_in_file1 = Tempfile.new('message.txt')
  test_in_file1.write('a')
  test_in_file2 = Tempfile.new('braille.txt')
  let(:arguements){[test_in_file1, 'braille.txt']}

  before (:each) do
    @file = FileCreate.new(arguements)
  end

  after do
    test_in_file1.unlink
  end

  it 'can create a new file' do
    expect(@file.create).to be_a(File)
  end

  it 'can call Translator' do
    expect(@file.edited_string('hello world')).to eq("0.0.0.0.0....00.0.0.00\n00.00.0..0..00.0000..0\n....0.0.0....00.0.0...\n")
  end

  it 'can identify braille' do
    expect(@file.edited_string("0.\n..\n..")).to eq("a")

  end

end
