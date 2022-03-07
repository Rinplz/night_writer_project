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
      expect(@interface1.creation_message).to eq("Created 'braille.txt' containing 256 characters")
    end


  end

  # context 'given chicken.txt' do
  #
  #   let(:test_in_file) do
  #     Tempfile.new('message.txt')
  #     test_in_file.write("chicken wings")
  #     test_in_file.close
  #   end
  #   let(:test_out_file) {Tempfile.new('chicken.txt')}
  #   let(:arg){[test_in_file.path,test_out_file.path]}
  #
  #   before (:each) do
  #     @interface1 = Interface.new(arg)
  #   end
  #
  #   after do
  #     test_in_file.unlink
  #     test_out_file.unlink
  #   end
  #
  #   it 'can print' do
  #     expect(@interface1.creation_message).to eq("Created 'chicken.txt' containing 256 characters")
  #   end
  #
  # end
end
