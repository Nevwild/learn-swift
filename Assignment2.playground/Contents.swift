
/*:
 # Assignment 2
 
 The intent of this homework set is to:
 
 1. make sure that you can correctly use important concepts from Swift
 1. have a base set of code from which we can build our Conway's Game
 of Life app.
 
 This code will be incorporated into your final project, so it is very
 important that we get it right.  To the extent possible, I have given you
 a template for all the neccesary code here and have
 only asked you to fill in the details. You are being asked to
 demonstrate that you understand the meaning of those details
 
 To complete this assignment, you need to have a basic understanding
 of the following Swift concepts:
 * Type Aliases
 * Base operations, in particular the modulo and ternary operators
 * Base data types, in particular Int and Tuple
 * Arrays and Arrays of Arrays
 * Basic control flow including: if, guard and switch
 * Why and when we avoid the use of "for" as a control flow mechanism
 and use functional constructs instead
 * The Swift types: enum, struct and class and their syntax, differences and similarities
 * Properties of enums, structs and classes
 * Subscripts on structs and classes
 * Functions and in particular higher order functions which take closures as arguments
 * Closures and in particular their capture rules and the trailing closure syntax
 * How to read the signature and therefore the type of a func or closure
 * Parameterized types (aka Generics) and their uses
 * Optional types and why they are genericized enums
 * The if-let and guard-let constructs
 
 It sounds like a lot I know, but these are parts of the language that you will use
 every day if programming professionally.  There's just no getting around them.
 
 Before attempting this homework, you should first read:
 * the Swift Tour section of the Apple Swift book
 * all of the learn-swift examples, cross-referencing back to the book as you go
 * the wikipedia page on Conway's Game of Life
 
 You should also keep these readily at hand while doing this assignment.
 
 **ALL** answers are to be given in line.  Please do not erase the formatted
 comments as we will
 be grading by reading through this playground.  i.e. go to Editor->Show Rendered Markup
 in Xcode and leave rendering on while doing the homework.  This will prevent you
 from inadvertantly changing things you should not change.
 
 You should make changes to this file **ONLY**
 in the places specified by the marked comments.  Put your code and or comments ONLY in
 those places!  Where the instructions specify a limit on the length of your answers, please
 be aware that we are serious about this.  Swift is built to facilitate concise coding style.
 This homework set has been created to teach you this style.
 
 As you work through this assignment you should reference the learn-swift workspace
 which has been provided in the course materials repository.
 
 To understand what we are doing you will need to make sure that you familiar
 with Conway's Game of Life.  We discussed this extensively in class, but
 you may want to review: [The Wikipedia page](https://en.wikipedia.org/wiki/Conway's_Game_of_Life)
 
 You are **strongly** advised to work the problems in order.  As you progress you must make sure that
 the playground stays in a state where it compiles and runs.  Trust me, not doing this may be the biggest
 mistake you can make.  If you get stuck, you should seek assistance rather than trying to go on.
 An excellent practice to get into
 is to do frequent commits of your work so that you don't lose it and can roll back to previous
 versions if you make a mistake.  Xcode will help you with this.
 
 ## Overall requirements:
 1. Your submitted playground must have zero errors and zero warnings
 1. It must successfully run to completion, generating the words The End at the end
 1. It must produce reasonable numbers for Conway's Game of Life, i.e. after a couple of
 iterations, the game should have about 33 living cells.  It should NOT have zero or 100.
 1. The test code at the end should display a regular pattern.
 1. You MUST do the work yourself, do not talk together on this one, any questions should be
 addressed to the discussion boards so that everyone may see them and the instructors may determine if they are appropriate
 
 **DO NOT ANSWER QUESTIONS ON THIS HOMEWORK FOR OTHERS IN THE FORUMS**
 
 You may say something like: "this was discussed in class 4 at 45:16" or "this is in learn-swift 12",
 but no more than that.  Violation of this rule will be treated as an honor violation.  You
 don't want to be that person.
 
 The reason for these requirements are that if you do not understand how to use Swift at this level you will not
 be able to do the other assignments.  It is VITAL that we get everyone the help they need if they are
 having difficulties.  Some real effort is required to learn the language and I expect that
 it will be difficult for everyone.  The difficulty is a feature, not a bug.
 
 ## Problem 1:
 **Problem 1 has already been worked for you as an example**.   Everyone gets 5 free points!
 
 Create a typealias named Position for a tuple which has
 two integer variables: `row` and `col` in that order
*/
// ** Your Problem 1 code goes here! replace the following line **
typealias Position = (row: Int, col: Int)
/*:
 ## Problem 2:
 Using the enum `CellState` defined below:
 1. create the following 4 possible values: `alive`, `empty`, `born` and `died`.
 1. equip `CellState` with a computed variable `isAlive` of type `Bool` which
 is true if the CellState is alive or born, false otherwise.
 1. `isAlive` MUST use **ONLY** a switch statement on self
 1. `isAlive` can be no more than 8 readable lines long, including curly-braces.
 
 Failure to follow all rules will result in zero credit.
 */
enum CellState {
    // ** Problem 2.1: Replace the line below with your answer **
	case alive
	case empty
	case born
	case died

    var isAlive: Bool {
        // ** Problems 2.2 - 2.4: Replace the line below with your answer **
		switch self {
		case .alive:
			return true
		case .empty:
			return false
		case .born:
			return true
		case .died:
			return false
		}
    }
}
/*:
 ## Problem 3:
 I am defining a top level function, `norm`, immediately below.
 Answer the following questions on this function in the places shown.
 (Your answers may consist of **ONE** valid swift type or expression, I do NOT want sentences):
*/
func norm(_ val: Int, to size: Int) -> Int {
	return ((val % size) + size) % size
}

//	let valModSize: Int = {
//		print("val", val)
//		print("size", size)
//		return val % size
//	}()
//
//	let valModSizePlusSize: Int = {
//		print("size", size)
//		print("valModSize", valModSize)
//		let valModSizePlusSize = valModSize + size
//		return valModSizePlusSize
//	}()
//
//	let valModSizePlusSizeModSize: Int = {
//		let valModSizePlusSizeModSize = valModSizePlusSize % size
//		return valModSizePlusSizeModSize
//	}()
//
//	return valModSizePlusSizeModSize
//}

//norm(250, to: 1000)

/*:
 1. what is the return type of `norm`
 */
/*
 // ** Your Problem 3.1 answer goes here **

 Int

 */


/*:
 2. In terms of `size`, what is the maximum value that `norm` will return?
 */
/*
 // ** Your Problem 3.2 answer goes here **
norm <= val
 */
/*:
 ## Problem 4:
 I am defining a top level function, `positions`, immediately below.
 Answer the following questions on this function in the places shown.
 (Your answers may consist of **ONLY** one **WORD** which is a valid swift type):
 */

func positions(rows: Int, cols: Int) -> [Position] {
    return (0 ..< rows).flatMap { zip( [Int](repeating: $0, count: cols) , 0 ..< cols ) }
}
//print(positions(rows: 10, cols: 3))
/*:
 1. what is the return type of the call to `zip`
 */
//1 word requirement: Tuple

//What it actually is:
//Tuple<Sequence,Sequence>


/*
 // ** Your Problem 4.1 answer goes here **

Tuple

 */

/*
 // ** Your Problem 4.2 answer goes here **

Sequence

*/
/*:
 3. what is the return type of the call to `flatMap`?
 */
/*
 // ** Your Problem 4.3 answer goes here **

[Position]

 */

/*:
 The following 4 problems apply to the struct Grid shown below.
 
 ## Problem 5:
 In a comment here, explain what the contents
 of the variable named `offsets` in the struct `Grid` below represent.
 
 **Hint:** they are relative to the missing entry in the center and
 have to do with the rules to Conway's Game of Life.
 
 **Your answer may be no more than one sentence.**
 */
/*
 // ** Your Problem 5 comment goes here! **
Offsets represent the positions of the cells surrounding a cell at a given point.
 */
/*:
 ## Problem 6:
 The struct `Grid` has been provided with variables `rows`, `cols`:
 1. **On the initializer of grid**, set `rows` to be 10 by default
 1. **On the initializer of grid**, set `cols` to be 10 by default
 
 ## Problem 7:
 In the location shown below, equip Grid's initializer with code which
 initializes the `rows` and `cols` properties from the arguments
 
 ## Problem 8:
 Write precisely one line of code in the location shown below to set the state of each cell specified
 in `cellStates` to the value specificied by `cellInitializer`.
 */
struct Grid {
    static let offsets: [Position] = [
        (row: -1, col: -1), (row: -1, col: 0), (row: -1, col: 1),
        (row:  0, col: -1),                    (row:  0, col: 1),
        (row:  1, col: -1), (row:  1, col: 0), (row:  1, col: 1)
    ]
    
    let rows, cols: Int
    let cellStates: [[CellState]]
    
    // ** Your Problem 6 code goes on the next line! **
    init(_ rows: Int = 10, _ cols: Int = 10, _ cellInitializer: (Int, Int) -> CellState = { _,_ in .empty } ) {
        // ** Your Problem 7 code replaces the next 2 lines!  **
        self.rows = rows
        self.cols = cols
        cellStates = (0 ..< rows).map { row in
            (0 ..< cols).map { col in
                // ** Your Problem 8 code goes on the next line!  **
				return cellInitializer(row,col)

            }
        }

    }
}

//Init a grid for testing that has born cells in every position that has an even row && col.
var nevGrid = Grid(10, 10, {(row,col)  in
	if row % 2 == 0 && col % 2 == 0{
			return CellState.born
	}
	return CellState.empty
})

//print("nevGrid.cellStates", nevGrid.cellStates)




/*:
 The next two problems apply to the extension to `Grid` immediately below.
 
 ## Problem 9:
 In the extension to `Grid` below, provide a return
 value of type `Position` for the function `neighbors`
 such that `neighbors` returns the coordinates of all neighbor cells of `self`.
 Where by neighbor we mean one of the 8 cells in a grid which touches the current
 cell.
 
 Your answer MUST:
 1. implement the "wrap-around" rules of Conway's Game of Life by making use of the `norm` function provided above
 1. make use of `offset` as passed into map
 1. be no longer than 3 readable lines long
 
 Failure to follow all rules will result in zero credit.
 
 **HINT** Note that the code you are being asked to write is inside of a map
 function operating over the `offsets` array and that it returns a position
 which represents a neighbor of the given cell which has its own position.
 
 ## Problem 10:
 In the extension to Grid below, examine the `neighbors` call.
 1. Explain in one sentence when you would use the word `of` in relation to this function
 */
/*
 // ** your problem 10.1 answer goes here.
When calling the function, "of" will be the parameter name required to be there.
 */
/*:
 2. Explain in one sentence when you would use the word `position` in relation to this function
 */
/*
 // ** your problem 10.2 answer goes here.
When declaring the function, "position" will be the argument name used in the body/
 */

extension Grid {
    func neighbors(of position: Position) -> [Position] {
        return Grid.offsets.map { offset in
            // ** Your Problem 9 Code goes here! replace the following line **
			var offsetPosition = Position(position.row + offset.row, position.col + offset.col)
			offsetPosition = Position(norm(offsetPosition.row, to: self.rows), norm(offsetPosition.col, to: self.cols))

            return offsetPosition
        }
    }
}
print("neighbors min", nevGrid.neighbors(of: Position(0,0)))
print("neighbors normal",nevGrid.neighbors(of: Position(2,2)))
print("neighbors max", nevGrid.neighbors(of: Position(10,10)))

/*:
 The next two problems apply to the extension to `Grid` immediately below.
 
 ## Problem 11:
 In the extension to `Grid` below, equip `Grid` with a subscript which allows you to
 get the values of a cell of type `CellState` in the following manner:
 ```
 let someCellState = aGrid[4,7]
 ```
 Your solution MUST:
 1. implement only a `get` (since cells is immutable)
 1. make use of the norm function defined above to ensure that row and col are between -1 and rows+1 or cols+1 respectively
 1. be no more than 2 lines
 
 Failure to follow all rules will result in zero credit.

 ## Problem 12:
 *In ONE sentence* explain why this subscript does not have a set
*/
#warning("TODO: confirm following answer")
/*
 // ** Your Problem 12 answer goes here **
Cells a tuple of row and col, and therefore cannot be mutated.
 */

extension Grid {
    subscript (row: Int, col: Int) -> CellState? {
        get {
            return cellStates[norm(row, to: self.rows)][norm(col, to: self.cols)]
        }
    }
}

//print("0,0 subscript", nevGrid[0,0])
//print("0,1 subscript", nevGrid[0,1])
//print("2,2 subscript", nevGrid[2,2])
//print("12,2 subscript", nevGrid[12,2])
/*:
 The next three problems apply to the extension to `Grid` immediately below.

 ## Problem 13:
 In the computed var `numLiving` below,

 1. What is the type of `positions(rows: rows, cols: cols)`?
 */
/*
 // ** Your Problem 13.1 answer goes here **
Int
 */
/*:
 2. What is the type of the second argument to reduce?
 */
/*
 // ** Your Problem 13.2 answer goes here **
Higher order procedure represented as a completion block with the type of
nextPartialResult: (Result, Element) throws -> Result
 */
/*:
 ## Problem 14:
 In a comment explain what the reduce function
 in the following extension returns, in the context of Conway's Game of Life.
 
 Your answer may consist of **AT MOST** 2 sentences
 */

/*
 // ** Your Problem 14 answer goes here **
The reduce function iterates over returns a collection of cells whose cellState is either .born or .alive. This collection can be used as the foundation for animations of cells.
 */

/*:
 ## Problem 15:
 In a comment explain what `$1` in:
 
     self[$1.row, $1.col]
 
 does
 
 Your answer may consist of **AT MOST** one sentence
 */
/*
 // ** Your Problem 15 answer goes here **
 In self[$1.row, $1.col] $1 represents the current position the reduce function is evaluating.
 */
extension Grid {
    var numLiving: Int {
        return positions(rows: rows, cols: cols).reduce(0) { self[$1.row, $1.col]!.isAlive ? $0 + 1 : $0 }
    }
}
//nevGrid.numLiving

/*:
 ## Problem 16:
 Let's test your work so far.
 
 1. Uncomment the lines of working code marked immediately below.
 
 2. Replace the cellInitializer with a closure which causes each cell to be `.alive` with probability 1/3 and `.empty` otherwise
 
 3. Use the following expression to determine if the `state` should be .alive or .empty:
 
 `     (0 ... 2).randomElement() == 2`
 
 4. Assign the state using the ternary conditional operators `?:`
 
 5. If your code above compiles and runs the value returned from grid.numLiving
 should be approximately 33. If it is not around 33, then debug your code above.
 Explain why it should be approximately but not necessarily exactly 33 in a **one sentence** comment in the location shown below.
 
 **Hint:** This example passes the initializer in trailing closure syntax.
 You will want to set the state of
 a cell using code similar to what you've already done
 
 Failure to follow all rules will result in zero credit.
 */

var grid = Grid(10, 10) { _, _ in
	(0 ... 2).randomElement() == 2 ? .alive : .empty
}
grid.numLiving

#warning("TODO: There is no 15.5, should this be 16?")

/*
 // ** Your Problem 15.5 (nevwild?- 16) answer goes here **
Since the cellInitialization closure uses .randomElement() function to init ~ 1/3 of the 100 cells as living instead of programatically setting  exactly 1/3 of the cells as living, .numLiving should return ~ 33 in the 100 cell grid.
*/


/*:
 ## Problem 17:
 In the extension to Grid below, write precisely one line of code which:
 1. uses the ternary conditional operators `?` and `:`
 1. returns `count + 1` if the state of the referenced cell is `alive`, otherwise return `count`
 
 **HINT** you are returning a running count of living cells
 
 Failure to follow all rules will result in zero credit.
 */

extension Grid {
    func livingNeighbors(of position: Position) -> Int {
        return neighbors(of: position).reduce(0) { (count, position) in
			cellStates[position.row][position.col].isAlive ? count + 1 : count
        }
    }
}

/*:
 ## Problem 18:
 In the extension to `Grid` shown below, implement a function nextState which:
 1. returns a properly initialized CellState
 1. implements the rules of Conway's Game of Life
 
 Your answer MUST:
 * be no more than 8 lines long
 * use a `switch` statement on `livingNeighbors(of:)` from above to determine
 the value to return
 * consist of a single case and a default statement in the `switch` expression
 * return a value from each case of the `switch` using a ternary expression
 * use the `isAlive` property of `CellState` from above in a where clause attached to the case as part of the determination of state
 * return `alive` if the cell was alive at the previous iteration and had either 2 or 3 living neighbors
 * return `born` if the cell was not alive at the previous iteration and had precisely three living neighbors
 * return `died` if the cell was alive in the previous iteration and does not meet the preceding conditions
 * return `empty` otherwise
 
 Failure to follow all rules will result in zero credit.
 */
extension Grid {
    func nextState(of position: Position) -> CellState {
        // ** Replace the following line with your Problem 18 code
		guard let cell = self[position.row, position.col] else { return .empty }
		switch livingNeighbors(of: position) {
		case let liveNeighbors where (2...3).contains(liveNeighbors):
			return cell.isAlive ? .alive : liveNeighbors == 3 ? .born : .empty
		default:
			return cell.isAlive ? .died : .empty
		}
    }
}
//nevGrid.nextState(of: Position(2,1))

#warning("TODO: do the following requirements mean the nextState method from problem 18?")
/*:
 ## Problem 19:
 In the extension to `Grid` shown below, implement a function next which:
 1. takes no parameters
 1. returns a properly initialized Grid object which
 1. represents the next state of the current grid using the rules of Conway's Game of Life
 
 Your answer MUST:
 * be no more than 3 lines long
 * consist only of returning the results of a Grid initializer
 * make use of the rows and cols variables of the current grid
 * make use of the nextState method from problem 14
 
 Failure to follow all rules will result in zero credit.
 */
extension Grid {
    func next() -> Grid {
        // ** Replace the following line for Problem 19 **
		return Grid(rows, cols) { self.nextState(of: Position($0, $1)) }
    }
}

//print(nevGrid.next())
/*:
 ## Problem 20:
 In the location shown below implement an initializer which:
 1. uses a switch statement on a Position object formed from the row and col arguments
 2. returns .alive if the position is any of (0,1), (1,2), (2,0), (2,1), (2,2) and .empty otherwise
 3. consists of no more than 4 lines of code
 */
func testInitializer(row: Int, col: Int) -> CellState {
    // ** Replace the following line with your Problem 20 code.**
	let birthingCells = [(0,1), (1,2), (2,0), (2,1), (2,2)]
	#warning("TODO: Why is the following switch a requirement? Couldn't I do this with just the return statement?")
	switch Position(row,col) {
	case (let row, let col):
		return birthingCells.contains { $0 == row && $1 == col } ? .alive : .empty
	}
}


/*:
 ## Problem 21 (Bonus):
 In **one word** describe what pattern is produced by the following code
 */
/*
 // ** Your Problem 21 answer goes here **
Glider
 */
grid = Grid(10, 10, testInitializer)
grid.numLiving
print(grid)
grid = grid.next()
grid.numLiving
print(grid)
grid = grid.next()
grid.numLiving
print(grid)
grid = grid.next()
grid.numLiving
print(grid)
grid = grid.next()
grid.numLiving
print(grid)
grid = grid.next()
grid.numLiving
print(grid)

let theEnd = "The End"
