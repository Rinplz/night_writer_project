require './lib/interface'
require 'tempfile'

RSpec.describe Interface do

  context 'given braille.txt' do

    test_in_file = Tempfile.new('message.txt')
    test_in_file.write('hello world')
    test_out_file = Tempfile.new('braille.txt')
    let(:arg){[test_in_file,test_out_file]}

    before (:each) do
      @interface1 = Interface.new(arg)
    end

    after do
      test_in_file.unlink
      test_out_file.unlink
    end

    it 'can print' do
      expect(@interface1.creation_message).to include(File.basename(test_out_file.path))
      expect(@interface1.creation_message).to include(test_in_file.read.length)
    end


  end

  context 'given chicken.txt' do

    test_in_file = Tempfile.new('message.txt')
    test_in_file.write('chicken is good')
    test_out_file = Tempfile.new('chicken.txt')
    let(:arg){[test_in_file,test_out_file]}


    before (:each) do
      @interface2 = Interface.new(arg)
    end

    after do
      test_in_file.unlink
      test_out_file.unlink
    end

    it 'can print' do
      expect(@interface2.creation_message).to include(File.basename(test_out_file.path))
      expect(@interface1.creation_message).to include(test_in_file.read.length)
    end

  end

end
