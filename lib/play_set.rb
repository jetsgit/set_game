require_relative "deck"

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

  def is_set?(a, b, c)
    if a.color == b.color && b.color == c.color
      if a.
  end

end
