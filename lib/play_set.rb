require_relative "deck"
require_relative "constants"
require_relative "finder"

##
# This is class for the classic game of Set.
class PlaySet

  include Constants
  attr_accessor :hand
  INITIAL_CARDS = (0...12)
  CARDS = (0...3)

  def initialize
    @hand = Deck.new
    @matched_sets = []
    @max_sets = nil
    @board = []
    @finder = Finder.new
  end

  ##
  # Public method that initiates the game

  def play
    hand.deck.shuffle! random: Random.rand
    deal( INITIAL_CARDS )
    while hand.deck.size >= 3
      compare_cards
      deal( CARDS )
    end
    set_num = 1
    print_sets set_num
  end

  def deal cards
    @board.concat( hand.deck.slice! cards )
  end

  private


  def print_sets(num)
    @matched_sets.each do |set|
      # output_sets(num, set)
      card_num = 1
      puts "Here is Set #{num}"
      set.each do |card|
        puts "\t\tCard #{card_num} is: #{card.property[:color].first[0]}, #{card.property[:shape].first[0]}, #{card.property[:pattern].first[0]}, #{card.property[:number].first[0]}"
        card_num += 1
      end
      puts "\n"
      num += 1
    end
  end

  def compare_cards
    @max_sets ||= build_sets
    @max_sets.each do |cards|
      if @finder.find_set(cards)
        @matched_sets <<  cards
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


  def card_property(key, mask, card)
    card.property[key].first[1] & mask
  end
end

game = PlaySet.new
game.play
