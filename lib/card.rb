require_relative 'constants'
require 'pry'

class Card
  attr_accessor  :property,  :flags #  :color, :shape, :pattern, :number, :flags,


  def initialize(color, shape, pattern, number)
    @property = {}
    @property[:color] = color
    @property[:shape] = shape
    @property[:pattern] = pattern
    @property[:number] = number
    @flags = BITS | (property[:color].first[1])
    @flags = @flags | (property[:shape].first[1])
    @flags = @flags | (property[:pattern].first[1] )
    @flags = @flags | (property[:number].first[1])
  end
end
