require 'spec_helper'

describe SetGame::Deck do
  let(:hand) {SetGame::Deck.new}
  describe 'Deck#new' do

    it 'should create a deck with 81 cards' do
      hand.deck.size.must_equal 81
    end

    it 'should have 27 red cards' do
       color_red =  hand.deck.select { |card| card.property[:color].first[0] == :red }
       color_red.size.must_equal 27
    end

    it 'should have 27 green cards' do
       color_green=  hand.deck.select { |card| card.property[:color].first[0] == :green }
       color_green.size.must_equal 27
    end

    it 'should have 27 purple cards' do
       color_purple =  hand.deck.select { |card| card.property[:color].first[0] == :purple}
       color_purple.size.must_equal 27
    end

    it 'should have 27 diamond shape cards' do
       shape_diamond =  hand.deck.select { |card| card.property[:shape].first[0] == :diamond}
       shape_diamond.size.must_equal 27
    end

    it 'should have 27 squiggle shape cards' do
       shape_squiggle =  hand.deck.select { |card| card.property[:shape].first[0] == :squiggle}
       shape_squiggle.size.must_equal 27
    end

    it 'should have 27 oval shape cards' do
       shape_oval =  hand.deck.select { |card| card.property[:shape].first[0] == :oval}
       shape_oval.size.must_equal 27
    end

    it 'should have 27 empty pattern cards' do
       pattern_empty =  hand.deck.select { |card| card.property[:pattern].first[0] == :empty}
       pattern_empty.size.must_equal 27
    end

    it 'should have 27 stripe pattern cards' do
       pattern_stripe =  hand.deck.select { |card| card.property[:pattern].first[0] == :stripe}
       pattern_stripe.size.must_equal 27
    end

    it 'should have 27 solid pattern cards' do
       pattern_solid=  hand.deck.select { |card| card.property[:pattern].first[0] == :solid}
       pattern_solid.size.must_equal 27
    end

    it 'should have 27 one number cards' do
       number_one =  hand.deck.select { |card| card.property[:number].first[0] == :one}
       number_one.size.must_equal 27
    end

    it 'should have 27 two number cards' do
       number_two =  hand.deck.select { |card| card.property[:number].first[0] == :two}
       number_two.size.must_equal 27
    end

    it 'should have 27 three number cards' do
       number_three=  hand.deck.select { |card| card.property[:number].first[0] == :three}
       number_three.size.must_equal 27
    end
  end
end
