require_relative 'lib/play_set'

game = SetGame::PlaySet.new
game.shuffle
game.play
game.print_sets
