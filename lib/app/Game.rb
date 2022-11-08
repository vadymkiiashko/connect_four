require_relative 'Grid'


class Game 
    attr_accessor :grid, :currentPlayer , :currentIndex 
    def initialize()
        @grid = Grid.new()
        @currentPlayer = 'x'
        @currentIndex = 0
    end

    def toggleCurrentPlayer()
        if @currentPlayer == 'x'
            @currentPlayer = 'o'
            return
        end 
        @currentPlayer = 'x' 
    end

    def makeYourMove() 
        @currentIndex = askForInput()
        grid.putToken( @currentIndex , @currentPlayer)
    end

    def askForInput 
        loop do     
            print ('Current player ' + @currentPlayer + '>')
            columnIndex = gets.chomp().to_i
            if  columnIndex < grid.grid.size && columnIndex > -1 
                return columnIndex
            end

        end
    end

    def checkForVictory()
        indexRow = grid.getCurrentRow(currentIndex , currentPlayer)
        spree = Hash.new() 
        if exploreHorizontal( indexRow ,currentIndex , spree) == true 
            if spree.size ==4
                puts('player ' + currentPlayer + ' won')
                return true
            end
        end
        spree.clear()
        if exploreVertical( indexRow , currentIndex , spree) == true 
            if spree.size ==4
                puts('player ' + currentPlayer + ' won')
                return true
            end
        end
        spree.clear()
        if exploreLeftToRight( indexRow , currentIndex ,spree) == true 
            if spree.size ==4
                puts('player ' + currentPlayer + ' won')
                return true
            end
        end

        spree.clear()
        if exploreRightToLeft( indexRow , currentIndex , spree) == true 
            if spree.size ==4
                puts('player ' + currentPlayer + ' won')
                return true
            end
        end
        return false
    end    

    private

    def validate( indexRow , indexColumn ,  spree)
        return false if (indexRow < 0 || indexRow > grid.grid.size-1)
        return false if (indexColumn < 0 || indexColumn > grid.grid.size) 
        return false if (spree.key?([indexRow,indexColumn]))  
        return false if (grid.grid[indexRow][indexColumn] != currentPlayer)
        return true
    end
    
    def exploreHorizontal (indexRow , indexColumn ,  spree )
        return false if validate(indexRow , indexColumn , spree) == false
        spree.store([indexRow,indexColumn] , currentPlayer)
        exploreHorizontal(indexRow , indexColumn-1 , spree)
        exploreHorizontal(indexRow , indexColumn+1 , spree)
        return true
    end
    
    def exploreVertical (indexRow , indexColumn , spree )
        return false if validate(indexRow , indexColumn ,  spree) == false
        spree.store([indexRow,indexColumn] , currentPlayer)
        exploreVertical(indexRow-1 , indexColumn  , spree)
        exploreVertical(indexRow+1 , indexColumn  , spree)
        return true
    end
    
    def exploreLeftToRight ( indexRow , indexColumn ,  spree )
        return false if validate( indexRow , indexColumn ,  spree) == false
        spree.store([indexRow,indexColumn] , currentPlayer)
        exploreLeftToRight( indexRow-1 , indexColumn-1 ,  spree)
        exploreLeftToRight( indexRow+1 , indexColumn+1 ,  spree)
        return true
    end
    
    def exploreRightToLeft ( indexRow , indexColumn , spree )
        return false if validate( indexRow , indexColumn , spree) == false
        spree.store([indexRow,indexColumn] , currentPlayer)
        exploreRightToLeft( indexRow+1 , indexColumn-1 , spree)
        exploreRightToLeft( indexRow-1 , indexColumn+1 , spree)
        return true
    end

end

