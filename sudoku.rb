MATRIX_ROW = 9          
MATRIX_COLUMN = 9       
BLOCK = 3 

def is_conditions_meet (matrix, row, column, inumber)

    for i in 0..MATRIX_ROW - 1 do 
        if matrix[row][i] == inumber
            return false
        end
    end

    for i in 0..MATRIX_COLUMN - 1 do
        if matrix[i][column] == inumber
            return false
        end
    end

    startRow = row - row % BLOCK
    startCol = column - column % BLOCK
    for i in 0..BLOCK - 1 do
        for j in 0..BLOCK - 1 do
            if (matrix[i + startRow][j + startCol] == inumber)
                return false
            end
        end
    end

    true
end

def solve_sudoky(matrix, row, column)
    if (row == MATRIX_ROW-1 && column == MATRIX_COLUMN)
        return true
    end

    if column == MATRIX_COLUMN 
        column = 0
        row += 1
    end

    if (matrix[row][column] != 0)
        return solve_sudoky(matrix, row, column + 1)
    end

    for digit in 1..9 do
        if (is_conditions_meet(matrix, row, column, digit))
            matrix[row][column] = digit

            if (solve_sudoky(matrix, row, column + 1))
                return true
            end
        end

        matrix[row][column] = 0
    end
    false
end


def print_matrix(matrix)
    puts "____________________"
    for i in 0..MATRIX_ROW - 1 do
        for j in 0..MATRIX_COLUMN - 1 do
            print "#{matrix[i][j]} "
        end
        puts 
    end
    puts "____________________"
    puts
end


def main()
    sudoku = [[5,3,0,0,7,0,0,0,0],
                [6,0,0,1,9,5,0,0,0],
                [0,9,8,0,0,0,0,6,0],
                [8,0,0,0,6,0,0,0,3],
                [4,0,0,8,0,3,0,0,1],
                [7,0,0,0,2,0,0,0,6],
                [0,6,0,0,0,0,2,8,0],
                [0,0,0,4,1,9,0,0,5],
                [0,0,0,0,8,0,0,7,9]]


    puts "Sudoku source"
    print_matrix(sudoku)
    puts "Solved sudoku"
    solve_sudoky(sudoku, 0, 0)
    print_matrix(sudoku)
end

main()