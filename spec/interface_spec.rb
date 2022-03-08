require './lib/interface'
require 'tempfile'
require_relative 'spec_helper'
require './lib/file_create'

RSpec.describe Interface do

  context 'given braille.txt' do

    test_in_file = Tempfile.new('message.txt')
    test_in_file.write('hello world')
    test_out_file = Tempfile.new('braille.txt')
    let(:arg){[test_in_file,test_out_file]}

    before (:each) do
      @interface1 = Interface.new(arg)
      allow(File).to receive(:read).and_return(test_in_file.read)
    end

    after do
      test_in_file.unlink
      test_out_file.unlink
    end

    it 'can print' do
      expect(@interface1.creation_message).to include(File.basename(test_out_file.path))
      expect(@interface1.creation_message).to include('11')
    end


  end

  context 'given chicken.txt' do

    test_in_file = Tempfile.new('message.txt')
    test_in_file.write("0.\n..\n..")
    test_out_file = 'chicken.txt'
    let(:arg){[test_in_file,test_out_file]}

    before (:each) do
      @interface2 = Interface.new(arg)
      allow(File).to receive(:read).and_return(test_in_file.read)
    end


    after do
      test_in_file.unlink
    end

    it 'can call FileCreate' do
      expect(@interface2.creation_message).to include(File.basename(test_out_file))
      expect(@interface2.creation_message).to include('1')
    end

  end

end
