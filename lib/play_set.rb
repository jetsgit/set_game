require_relative "deck"
require_relative "constants"
class PlayCards

  attr_accessor :deck
  INITIAL_CARDS = 12
  CARDS = 3

  def initialize
    @deck = Deck.new
    deck.cards.shuffle! random: Random.rand
  end

  def play  
    board = deal INITIAL_CARDS
    while deck.cards.size >= 3
      board.each do |card|
      end
      board += deal CARDS
    end
  end

  def deal cards
    hand = deck.cards.slice! cards
    hand
  end

  
  private

  def attr_equal?(arr)
    if ( (arr[0] == arr[1])  && (arr[0] == arr[2] ) )
      true
    else
      false
    end
  end

  def attr_uniq?(arr)

  end

  def find_set(set)
    if attr_equal?(set)
      return set
    elsif attr_unique?(set)
      return set
    else
      false
    end
  end

end
