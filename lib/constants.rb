##
# Constants used in the Set Game
module Constants
  MASK = 7
  BITS = 0
  COLOR_MASK = BITS | MASK
  SHAPE_MASK = BITS | (MASK << 3)
  PATTERN_MASK = BITS | (MASK << 6)
  NUMBER_MASK = BITS | ( MASK << 9 )

  COLOR = [ {red: 1}, {green: 2 }, {purple: 4}]
  SHAPE = [ {diamond: 8}, {squiggle: 16}, {oval: 32}]
  PATTERN = [{solid: 64}, {empty: 128}, {stripe: 256}]
  NUMBER = [{one: 512 }, {two: 1024}, {three: 2048}]
end
