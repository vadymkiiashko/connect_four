class Grid
  attr_accessor :grid

  def initialize()
    @grid = Array.new(8) { Array.new(8, ".") }
  end

  #TODO move to private
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

  def printGrid()
    puts("0   1   2   3   4   5   6   7   ")
    puts("--------------------------------")
    (0..@grid.size - 1).each do |rowIndex|
      (0..@grid.size - 1).each do |columnIndex|
        print(@grid[rowIndex][columnIndex] + " | ")
      end
      puts(" ")
    end
    puts("--------------------------------")
    puts("0   1   2   3   4   5   6   7   ")
  end

  def putToken(indexColumn, currentPlayer)
    return nil unless indexColumn < grid.size && indexColumn > -1
    indexRow = getRowForNewToken(indexColumn)
    grid[indexRow][indexColumn] = currentPlayer
  end
end
