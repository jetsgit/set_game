require_relative 'constants'
require 'pry'

class Card
  attr_accessor :color, :shape, :pattern, :number, :flags, :property

  COLOR = [ {red: 1}, {green: 2 }, {purple: 4}]
  SHAPE = [ {diamond: 8}, {squiggle: 16}, {oval: 32}]
  PATTERN = [{solid: 64}, {empty: 128}, {stripe: 256}]
  NUMBER = [{one: 512 }, {two: 1024}, {three: 2048}]

  def initialize( card )
    @n = -1
    @property = []
    self.color = COLOR[card % 3]
    self.shape = SHAPE[card % 3]
    self.pattern = PATTERN[card % 3]
    self.number = NUMBER[card % 3]
    binding.pry
    @flags = BITS | (color.first[1])
    @flags = @flags | (shape.first[1])
    @flags = @flags | (shade.first[1] )
    @flags = @flags | (number.first[1])
  end

end

# Card.build_qualities
