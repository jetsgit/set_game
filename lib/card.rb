class Card
  attr_accessor :color, :shape, :shade, :number

  COLOR = [ "Red", "Green",  "Purple"]
  SHAPE = [ "Diamond", "Squiggle", "Oval"]
  SHADE = ["Solid", "Empty", "Striped"]
  NUMBER = [1, 2, 3]

  def initialize( card )
    self.color = COLOR[card % 3]
    self.shape = SHAPE[card % 3]
    self.shade = SHADE[card % 3]
    self.number = NUMBER[card % 3]
  end

end
