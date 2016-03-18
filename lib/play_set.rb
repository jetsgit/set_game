require_relative "deck"
require_relative "constants"

##
# This is the classic game of Set, invented by Marsha Falco in 1974.
# There are 81 cards in the deck. The idea is to create a set
# which consists of 3 cards, where their properties are either
# all the same, or all different.

class PlaySet

  attr_accessor :hand, :matched_sets
  INITIAL_CARDS = (0...12)
  CARDS = (0...3)

  def initialize
    @hand = Deck.new
    @matched_sets = []
    hand.deck.shuffle! random: Random.rand
    @board = []
  end

  ##
  # Public method that initiates the game

  def play
    deal( INITIAL_CARDS )
    while hand.deck.size >= 3
      compare_cards
      deal( CARDS )
    end
    set_num = 1
    matched_sets.each do |set|
      card_num = 1
      puts "Here is Set #{set_num}"
      set.each do |card|
        puts "\t\tCard #{card_num} is: #{card.property[:color].first[0]}, #{card.property[:shape].first[0]}, #{card.property[:pattern].first[0]}, #{card.property[:number].first[0]}"
        card_num += 1
      end
      puts "\n"
      set_num += 1
    end
  end

  private

  def deal cards
    @board.concat( hand.deck.slice! cards )
  end

  def compare_cards
    @max_sets ||= build_sets
    @max_sets.each do |cards|
      if find_set(cards)
        matched_sets <<  cards
        remove_cards_from_board(cards)
        if hand.deck.size > CARDS.size
          deal( CARDS )
          build_sets
          compare_cards
          break
        end
      end
    end
  end

  def remove_cards_from_board(cards)
    @board -= cards
  end

  def build_sets
    @max_sets = @board.combination(3).to_a
  end

  def attr_equal?(arr)
    if ( (arr[0] == arr[1])  && (arr[0] == arr[2] ) )
      true
    else
      false
    end
  end

  def attr_uniq?(arr, mask)
    if ( arr[0] | arr[1] |  arr[2]) == mask
      true
    else
      false
    end
  end

 ##
 #Method finds set of of cards
  def find_set(cards)
    if (unique_set( :color, COLOR_MASK, cards ) && unique_set(:shape, SHAPE_MASK, cards) && unique_set(:pattern, PATTERN_MASK, cards) && unique_set(:number, NUMBER_MASK, cards))
      true
    else
      false
    end
  end

  ##
  #Method determines if 3 cards make up a set

  def unique_set(key, mask, cards)
    card_properties = []
    cards.each do |card|
      ( card_properties << ( card.property[key].first[1] & mask ) )
    end
    if attr_equal?(card_properties) ||  attr_uniq?(card_properties, mask)
      true
    else
      false
    end
  end
end
