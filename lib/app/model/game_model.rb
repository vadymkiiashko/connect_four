require_relative "./grid_model"

class GameModel
  attr_accessor :gridModel, :currentPlayer, :currentIndex

  def initialize()
    @gridModel = Model.new()
    @currentPlayer = "x"
    @currentIndex = 0
  end

  def start()
  end

  def makeYourMove(column)
    @currentIndex = column
    gridModel.putToken(currentIndex, currentPlayer)
  end

  def toggleCurrentPlayer()
    if @currentPlayer == "x"
      @currentPlayer = "o"
      return
    end
    @currentPlayer = "x"
  end

  def victory?()
    indexRow = gridModel.getCurrentRow(currentIndex, currentPlayer)
    spree = Hash.new()
    [:exploreHorizontal, :exploreVertical, :exploreLeftToRight, :exploreRightToLeft].each { |check|
      spree.clear()

      return true if method(check).call(indexRow, currentIndex, spree) && spree.size == 4
    }
    return false
  end

  private

  def notValidNext?(indexRow, indexColumn, spree)
    return true if !inputInBounds?(indexRow)
    return true if !inputInBounds?(indexColumn)
    return true if (spree.key?([indexRow, indexColumn]))
    return true if (gridModel.grid[indexRow][indexColumn] != currentPlayer)
    return false
  end

  def exploreHorizontal(indexRow, indexColumn, spree)
    return false if notValidNext?(indexRow, indexColumn, spree)
    spree.store([indexRow, indexColumn], currentPlayer)
    exploreHorizontal(indexRow, indexColumn - 1, spree)
    exploreHorizontal(indexRow, indexColumn + 1, spree)
    return true
  end

  def exploreVertical(indexRow, indexColumn, spree)
    return false if notValidNext?(indexRow, indexColumn, spree)
    spree.store([indexRow, indexColumn], currentPlayer)
    exploreVertical(indexRow - 1, indexColumn, spree)
    exploreVertical(indexRow + 1, indexColumn, spree)
    return true
  end

  def exploreLeftToRight(indexRow, indexColumn, spree)
    return false if notValidNext?(indexRow, indexColumn, spree)
    spree.store([indexRow, indexColumn], currentPlayer)
    exploreLeftToRight(indexRow - 1, indexColumn - 1, spree)
    exploreLeftToRight(indexRow + 1, indexColumn + 1, spree)
    return true
  end

  def exploreRightToLeft(indexRow, indexColumn, spree)
    return false if notValidNext?(indexRow, indexColumn, spree)
    spree.store([indexRow, indexColumn], currentPlayer)
    exploreRightToLeft(indexRow + 1, indexColumn - 1, spree)
    exploreRightToLeft(indexRow - 1, indexColumn + 1, spree)
    return true
  end

  def inputInBounds?(columnIndex)
    return true if columnIndex < gridModel.grid.size && columnIndex > -1
    return false
  end
end
