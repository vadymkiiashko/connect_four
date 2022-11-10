class View 

    def printGrid(grid)
        Gem.win_platform? ? (system "cls") : (system "clear")
        puts("0   1   2   3   4   5   6   7   ")
        puts("--------------------------------")
        (0..grid.size - 1).each do |rowIndex|
          (0..grid.size - 1).each do |columnIndex|
            print(grid[rowIndex][columnIndex] + " | ")
          end
          puts(" ")
        end
        puts("--------------------------------")
        puts("0   1   2   3   4   5   6   7   ")
    end

    def askForInput(currentPlayer)
        loop do
          print ("Current player " + currentPlayer + ">")
          columnIndex = gets.chomp().to_i
            return columnIndex
        end
    end

    def printVictory (grid , player)
      printGrid(grid)
      puts('player ' + player + ' won')
    end


 end