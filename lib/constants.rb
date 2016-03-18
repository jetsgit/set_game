  MASK = 7
  BITS = 0
  COLOR_MASK = BITS | (MASK << 9)
  SHAPE_MASK = BITS | (MASK << 6)
  SHADE_MASK = BITS | (MASK << 3)
  NUMBER_MASK = BITS | MASK

  COLOR = [ {red: 1}, {green: 2 }, {purple: 4}]
  SHAPE = [ {diamond: 8}, {squiggle: 16}, {oval: 32}]
  PATTERN = [{solid: 64}, {empty: 128}, {stripe: 256}]
  NUMBER = [{one: 512 }, {two: 1024}, {three: 2048}]
  


