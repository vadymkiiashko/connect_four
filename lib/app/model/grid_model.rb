class Model 
  attr_accessor :grid 

  def initialize()
    @grid = Array.new(8) { Array.new(8, ".") }
  end

  def getGrid()
    return grid
  end

  def getRowForNewToken(indexColumn)
    (grid.size - 1).downto(0).each do |rowIndex|
      return rowIndex if grid[rowIndex][indexColumn] == "."
    end
  end

  def getCurrentRow(indexColumn, currentPlayer)
    (grid.size - 1).downto(0).each do |rowIndex|
      return rowIndex if grid[rowIndex][indexColumn] == currentPlayer
    end
  end

  def putToken(indexColumn, currentPlayer)
    return nil unless indexColumn < grid.size && indexColumn > -1
    indexRow = getRowForNewToken(indexColumn)
    grid[indexRow][indexColumn] = currentPlayer
  end

end

