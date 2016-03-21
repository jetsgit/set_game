require 'spec_helper'

describe Deck do
  let(:deck) {Deck.new}
  describe '#new' do
    it 'should create a deck with 81 cards' do
      deck.deck.size.must_equal 81
    end
  end
end
