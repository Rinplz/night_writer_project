require './lib/interface'

RSpec.describe Interface do

  context 'given braille.txt' do

    let(:arg){['message.txt','braille.txt']}

    before (:each) do
      @interface1 = Interface.new(arg)
    end

    it 'can print' do
      expect(@interface1.creation_message).to eq("Created 'braille.txt' containing 256 characters")
    end

  end

  context 'given chicken.txt' do

    let(:arg){['message.txt','chicken.txt']}

    before (:each) do
      @interface1 = Interface.new(arg)
    end

    it 'can print' do
      expect(@interface1.creation_message).to eq("Created 'chicken.txt' containing 256 characters")
    end

  end
end
