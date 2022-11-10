require_relative '../views/view'
require_relative '../model/game_model'

class GameController
    attr_accessor :game , :view 

    def initialize()
        @game = GameModel.new()
        @view = View.new()
    end
    def startGame()
        view.printGrid(game.gridModel.grid)
        while true
            makeYourMove()
            won = game.victory?()
            if won
                view.printVictory(game.gridModel.grid , game.currentPlayer)
              break
            end
            game.toggleCurrentPlayer()
            view.printGrid(game.gridModel.grid)
        end
    end

    def makeYourMove()
        column = getColumn()
        game.makeYourMove(column)
        #checkforwin
    end

    def getColumn()
        return view.askForInput(game.currentPlayer)
    end

end