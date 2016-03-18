require_relative "deck"
require_relative "constants"
class PlayCards

  attr_accessor :deck, :board
  INITIAL_CARDS = 12
  CARDS = 3

  def initialize
    @deck = Deck.new
    deck.cards.shuffle! random: Random.rand
  end

  def play
    @board = deal INITIAL_CARDS
    while deck.cards.size >= 3
      compare_cards
      board += deal CARDS
    end
  end

  def deal cards
    deck.cards.slice! cards
  end

  private

  def compare
    @max_sets = []
    build_sets(@max_sets)
    @max_sets.each do |cards|
      if find_set(cards)
        @matched_sets += 1
        remove_cards_from_board(cards)
        build_sets(@max_sets)
        compare
      end
    end
    break
  end

  def remove_cards_from_board(cards)
    cards.each do |card|
      board.delete_if { |card_dealt| card_dealt.object_id == card.object_id}
    end
  end

  def build_sets(arr)
    arr = board.cards.combination(3).to_a
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

  def find_set(cards)
    if unique_set( :color, COLOR_MASK, cards ) && unique_set(:shape, SHAPE_MASK, cards) && unique_set(:pattern, PATTERN_MASK, cards) && unique_set(:number, NUMBER_MASK, cards)
      return cards
    else
      false
    end
  end

  def unique_set(key, mask, cards)
    card_properties = []
    cards.each do |card|
      card_properties << ( card.property[key].first[1] | mask )
    end
    if attr_equal?(card_properties)
      true
    elsif attr_unique?(card_properties, mask)
      true
    else
      false
    end
  end
end
