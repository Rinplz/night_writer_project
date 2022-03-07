require './lib/interface'

RSpec.describe Interface do

  before (:each) do
    @interface1 = Interface.new
    @interface2 = Interface.new
  end

  it 'can print' do
    expect(@interface1.creation_message).to eq("Created 'braille.txt' containing 256 characters")
    expect(@interface2.creation_message).to eq("Created 'braille.txt' containing 256 characters")
  end
end
