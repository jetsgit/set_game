require_relative "constants"

class Finder

 #Method finds set of of cards by comparing flags for each attribute
 #to see if they are all the same or all unique
  include Constants

  ##
  #Method determines if 3 cards make up a set
  def unique_set(key, mask, cards)
    card_properties = []
    cards.each do |card|
       card_properties << card_property(key, mask, card)
    end
    if attr_equal?(card_properties) ||  attr_uniq?(card_properties, mask)
      true
    else
      false
    end
  end

  ##
  # Method to find if all attributes are equal by comparing flags
  def attr_equal?(arr)
    if ( (arr[0] == arr[1])  && (arr[0] == arr[2] ) )
      true
    else
      false
    end
  end

  ##
  #Method to determine if all attributes are unique by comparing flags
  def attr_uniq?(arr, mask)
    if ( arr[0] | arr[1] |  arr[2]) == mask
      true
    else
      false
    end
  end

  private

  def card_property(key, mask, card)
    card.property[key].first[1] & mask
  end

  def find_set(cards)
    if (unique_set( :color, COLOR_MASK, cards ) && unique_set(:shape, SHAPE_MASK, cards) && unique_set(:pattern, PATTERN_MASK, cards) && unique_set(:number, NUMBER_MASK, cards))
      true
    else
      false
    end
  end
end
