require_relative "./controllers/game_controller"

def runApp()
  game_controller = GameController.new()
  game_controller.startGame()
end
