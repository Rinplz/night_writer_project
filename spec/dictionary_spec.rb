require './lib/dictionary'
require_relative 'spec_helper'

RSpec.describe Dictionary do

  before (:each) do
    @dictionary = Dictionary.new
  end

  it 'exists' do
    expect(@dictionary.translation["a"]).to eq(["0.","..",".."])
  end
end
