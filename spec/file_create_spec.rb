require './lib/file_create'
require 'tempfile'

RSpec.describe FileCreate do

  test_in_file = Tempfile.new('message.txt')
  test_in_file.write('hello world')
  let(:arguements){[test_in_file, 'braille.txt']}

  before (:each) do
    @file = FileCreate.new(arguements)
  end

  after do
    test_in_file.unlink
  end

  it 'can create a new file' do
    expect(@file.create).to be_a(File)
  end

end
