require './lib/file_create'
require 'tempfile'

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
  
end
