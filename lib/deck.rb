require_relative "card"

class Deck
  attr_accessor :cards
  def initialize
    @cards = []
    COLOR.each do |color|
      SHAPE.each do |shape|
        PATTERN.each do |pattern|
          NUMBER.each do |number|
            @cards << Card.new(color, shape, pattern, number)
          end
        end
      end
    end
  end
end


