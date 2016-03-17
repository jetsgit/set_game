require 'pry'
class Card
  attr_accessor :color, :shape, :shade, :number, :flags

  
  COLOR = [ :red, :green,  :purple]
  SHAPE = [ :diamond, :squiggle, :oval]
  SHADE = [:solid, :empty, :striped]
  NUMBER = [:one, :two, :three]
  @n = -1
  @qualities = [COLOR, SHAPE, SHADE, NUMBER]

  MASK = 7
  BITS = 0
  COLOR_MASK = BITS | (MASK << 9)
  SHAPE_MASK = BITS | (MASK << 6)
  SHADE_MASK = BITS | (MASK << 3)
  NUMBER_MASK = BITS | MASK

  def initialize( card )
    self.color = COLOR[card % 3]
    self.shape = SHAPE[card % 3]
    self.shade = SHADE[card % 3]
    self.number = NUMBER[card % 3]
    @flags = BITS | (color.first[1])
    @flags = @flags | (shape.first[1])
    @flags = @flags | (shade.first[1] )
    @flags = @flags | (number.first[1])
  end


  def self.build_qualities
    @qualities.each do |ary|
      assign_attr ary
    end
  end

  def self.assign_attr(atr )
    atr.map! do |a|
      @n += 1
      Hash[ a => 2 ** @n ]
    end
  end
end

Card.build_qualities
