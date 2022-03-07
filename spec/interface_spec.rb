require './lib/interface'

RSpec.describe Interface do

  before (:each) do
    interface = Interface.new
  end

  it 'can print' do
    expect(interface.creation_message).to eq("Created 'braille.txt' containing 256 characters")
  end
end
