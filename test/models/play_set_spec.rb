require 'spec_helper'

describe PlaySet do
  let(:game) {PlaySet.new}
  describe "PlaySet#deal" do
    it "should deal cards from the deck by removing them from deck" do
      deck_size = game.hand.deck.size
      deck_size.must_equal 81
      game.deal (0...12)
      deck_size = game.hand.deck.size
      deck_size.must_equal 69
    end
  end
  describe "PlaySet#play" do
    it "should output number of matched sets" do
      game.play
      proc{ game.print_sets }.must_output  %r%26 matched sets%
    end
  end
end
