module SetGame
  require_relative 'constants'
  require_relative "card"

  ##
  # Deck class initiates each of 81 cards and shuffles deck

  class Deck
    include Constants
    attr_accessor :deck
    def initialize
      @deck= []
      COLOR.each do |color|
        SHAPE.each do |shape|
          PATTERN.each do |pattern|
            NUMBER.each do |number|
              @deck << Card.new( { color: color, shape: shape, pattern: pattern, number: number })
            end
          end
        end
      end
    end
  end
end
