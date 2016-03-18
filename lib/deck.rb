require_relative "card"

class Deck
  attr_accessor :deck
  def initialize
    @deck= []
    COLOR.each do |color|
      SHAPE.each do |shape|
        PATTERN.each do |pattern|
          NUMBER.each do |number|
            @deck << Card.new(color, shape, pattern, number)
          end
        end
      end
    end
    @deck.shuffle!  random: Random.rand
  end
end
