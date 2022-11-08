require_relative './app/Game'

module ConnectFour
  def self.run
    game = Game.new()
    game.grid.printGrid()
    while  true
      game.makeYourMove()
      won = game.checkForVictory() 
      if won
        break
      end
      game.toggleCurrentPlayer()
      game.grid.printGrid()
    end
  end
end
