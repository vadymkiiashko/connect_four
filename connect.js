'use strict'
console.log('starting');



let grid =[]

const fillGrid = (grid) =>{
    for (let index = 0; index < 8; index++) {
        let temp = []
        for (let j = 0; j < 8; j++) {
            temp.push('.')
            
        }
        grid.push(temp)
    }
}

const printGrid = (grid) =>{
    if(grid.length < 1) return
    for (let index = 0; index < grid.length; index++) {
       console.log(grid[index].join(''))
        
    }
}

const dropTile = (column , tile) => {
    console.log(`droping tile ${tile}`)
    if (tile === 'o' || tile === 'x'){

        for (let index = grid.length-1; index >-1 ; index--) {
            if (grid[index][column] === '.' ) {
                console.log(`current ${grid[index][column]} at ${index}${column}`)
                grid[index][column] = tile 
                break
            } 
        }
    } 
}
console.clear()
fillGrid(grid)
console.log('12345678')
grid[7][3] = 'o'
printGrid(grid)
dropTile(4,'x')
dropTile(4,'x')
printGrid(grid)

 

const game  = {
    grid : grid,
    currentPlayer: 'x'
}