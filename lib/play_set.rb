module SetGame
  require_relative "deck"
  require_relative "constants"
  require_relative "finder"
  require 'pry'

  ##
  # This is class for the classic game of Set.
  class PlaySet

    include Constants
    attr_accessor :hand, :matched_sets
    INITIAL_CARDS = (0...12)
    CARDS = (0...3)
    CARD_SET = 3

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
      deal( INITIAL_CARDS )
      while hand.deck.size >= CARD_SET
        compare_cards
        deal( CARDS )
      end
    end

    def deal cards
      @board.concat( hand.deck.slice! cards )
    end


    ##
    #Simple stdout print
    def print_sets
      puts "#{matched_sets.size} matched sets."
      set_num = 1
      matched_sets.each do |set|
        # output_sets(num, set)
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

    def shuffle
      hand.deck.shuffle! random: Random.rand
    end

    private

    ##
    #Iterate method to find sets, keep @board state consistent, build_sets
    def compare_cards
      @max_sets ||= build_sets
      @max_sets.each do |cards|
        if @finder.find_set(cards)
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

    ##
    #Method to keep @board cards accurate
    def remove_cards_from_board(cards)
      @board -= cards
    end

    ##
    #Create maximum number of cards sets given the size of @board.size and CARD_SET cards
    def build_sets
      @max_sets = @board.combination(CARD_SET).to_a
    end
  end
end
