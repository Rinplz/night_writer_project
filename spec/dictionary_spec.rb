require './lib/dictionary'

RSpec.describe Dictionary do

  before (:each) do
    @dictionary = Dictionary.new
  end

  it 'exists' do
    expect(@dictionary).to be_a(Class)
  end
end
