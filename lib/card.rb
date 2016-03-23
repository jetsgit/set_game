module SetGame
  require_relative 'constants'

  ##
  # Card class initializes a card with properties and bit flags for properties
  class Card
    include Constants
    attr_accessor  :property,  :flags 

    def initialize(args)
      @property = {}
      @property[:color] = args[:color]
      @property[:shape] = args[:shape]
      @property[:pattern] = args[:pattern]
      @property[:number] = args[:number]
      @flags = BITS | (property[:color].first[1])
      @flags = @flags | (property[:shape].first[1])
      @flags = @flags | (property[:pattern].first[1] )
      @flags = @flags | (property[:number].first[1])
    end
  end
end
