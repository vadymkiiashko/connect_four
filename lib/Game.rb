
class Grid 
    attr_accessor :grid
    def initialize()
        @grid = Array.new(8) {Array.new(8, '.')}
    end      

    def printGrid()
        puts('0   1   2   3   4   5   6   7   ')
        puts('--------------------------------')
        (0..@grid.size-1).each do |i|
            (0..@grid.size-1).each do |j|
                print(@grid[i][j] + ' | ')
            end 
            puts(' ')   
        end
        puts('--------------------------------')
        puts('0   1   2   3   4   5   6   7   ')

    end 

    def checkForVictory(i , indexColumn, currentPlayer)
        spree = Hash.new() 
        if exploreHorizontal(grid, i,indexColumn, currentPlayer,spree) == true 
            puts(spree)
            if spree.size ==4
                puts('player ' + currentPlayer + ' won')
                return true
            end
        end
        
        spree = Hash.new()
        if exploreVertical(grid, i,indexColumn, currentPlayer,spree) == true 
            puts(spree)
            if spree.size ==4
                puts('player ' + currentPlayer + ' won')
                return true
            end
        end
        spree = Hash.new()
        if exploreLeftToRight(grid, i,indexColumn, currentPlayer,spree) == true 
            puts(spree)
            if spree.size ==4
                puts('player ' + currentPlayer + ' won')
                return true
            end
        end

        spree = Hash.new()
        if exploreRightToLeft(grid, i,indexColumn, currentPlayer,spree) == true 
            puts(spree)
            if spree.size ==4
                puts('player ' + currentPlayer + ' won')
                return true
            end
        end
        
    end
    
    def putToken(indexColumn , currentPlayer)
        return nil unless  indexColumn < grid.size && indexColumn>-1

        (grid.size-1).downto(0).each do |i|
            if grid[i][indexColumn] == '.'
                begin
                    grid[i][indexColumn] = currentPlayer
                    return checkForVictory(i,indexColumn, currentPlayer)     
                end 
            end
        end
        
    end
    
    private
        
        def validate(grid , i , indexColumn, currentPlayer, spree)
            return false if (i < 0 || i > grid.size-1)   
            return false if (indexColumn < 0 || indexColumn > grid.size) 
            return false if (spree.key?([i,indexColumn])) 
            return false if (grid[i][indexColumn] != currentPlayer)
            return true
        end
        
        def exploreHorizontal (grid , i , indexColumn, currentPlayer , spree )
            return false if validate(grid , i , indexColumn, currentPlayer, spree) == false
            spree.store([i,indexColumn] , currentPlayer)
            exploreHorizontal(grid , i , indexColumn-1 , currentPlayer , spree)
            exploreHorizontal(grid , i , indexColumn+1 , currentPlayer , spree)
            return true
        end
        
        def exploreVertical (grid , i , indexColumn, currentPlayer , spree )
            return false if validate(grid , i , indexColumn, currentPlayer , spree) == false
            spree.store([i,indexColumn] , currentPlayer)
            exploreVertical(grid , i-1 , indexColumn , currentPlayer , spree)
            exploreVertical(grid , i+1 , indexColumn , currentPlayer , spree)
            return true
        end
        
        def exploreLeftToRight (grid , i , indexColumn, currentPlayer , spree )
            return false if validate(grid , i , indexColumn, currentPlayer , spree) == false
            spree.store([i,indexColumn] , currentPlayer)
            exploreLeftToRight(grid , i-1 , indexColumn-1 , currentPlayer , spree)
            exploreLeftToRight(grid , i+1 , indexColumn+1 , currentPlayer , spree)
            return true
        end
        
        def exploreRightToLeft (grid , i , indexColumn, currentPlayer , spree )
            return false if validate(grid , i , indexColumn, currentPlayer , spree) == false
            spree.store([i,indexColumn] , currentPlayer)
            exploreRightToLeft(grid , i+1 , indexColumn-1 , currentPlayer , spree)
            exploreRightToLeft(grid , i-1 , indexColumn+1 , currentPlayer , spree)
            return true
        end
    
end

class Game 
    attr_accessor :grid, :currentPlayer 
    def initialize()
        @grid = Grid.new()
        @currentPlayer = 'x'
    end
    def toggleCurrentPlayer()
        if @currentPlayer == 'x'
            @currentPlayer = 'o'
            return
        end 
        @currentPlayer = 'x' 
    end

    def makeYourMove() 
       isWon =  grid.putToken( askForInput() , @currentPlayer)
       if(!isWon)
            toggleCurrentPlayer()
            return false
        end
        return true
    end

    def askForInput 
        loop do     
            print ('Current player ' + @currentPlayer + '>')
            columnIndex = gets.chomp().to_i
            if  columnIndex < @grid.grid.size && columnIndex > -1 
                return columnIndex
            end

        end
    end

end

game = Game.new()
game.grid.printGrid()
while  true
    if game.makeYourMove()
        break
    end
    game.grid.printGrid()
end
game.grid.printGrid()