def new_board():
    return [['' for _ in range(3)] for _ in range(3)]

def print_board(board):
    for line in board:
        print("-"*8)
        for row in line:
            char = row
            if char == '':
                char = ' '
            print(f"|{char}",end='')
        print("|")
    print("-" * 8)

def is_game_over(board):
    full = True
    for line in board:
        line_str = ''.join(line)
        if(line_str == "xxx" or line_str == "ooo"):
            return True
        for row in line:
            if row == '':
                full = False

    if full:
        return True
    for i in range(3):
        row_str = ''.join([board[0][i],board[1][i],board[2][i]])
        if (row_str == "xxx" or row_str == "ooo"):
            return True

    d_str = ''.join([board[0][0],board[1][1],board[2][2]])
    if (d_str == "xxx" or d_str == "ooo"):
        return True

    d_str = ''.join([board[2][0], board[1][1], board[0][2]])
    if (d_str == "xxx" or d_str == "ooo"):
        return True
    return False

def announce_outcome(board,players_move):
    for line in board:
        line_str = ''.join(line)
        if(line_str == "xxx" or line_str == "ooo"):
            print("player wins" if not players_move else "ai wins")
            return

    for i in range(3):
        row_str = ''.join([board[0][i],board[1][i],board[2][i]])
        if (row_str == "xxx" or row_str == "ooo"):
            print("player wins" if not players_move else "ai wins")
            return
    d_str = ''.join([board[0][0],board[1][1],board[2][2]])
    if (d_str == "xxx" or d_str == "ooo"):
        print("player wins" if not players_move else "ai wins")
        return

    d_str = ''.join([board[2][0], board[1][1], board[0][2]])
    if (d_str == "xxx" or d_str == "ooo"):
        print("player wins" if not players_move else "ai wins")
        return

    print("draw")


if __name__ == "__main__":
    board = new_board()

    board[0][0] = 'o'
    board[1][1] = 'o'
    board[2][2] = 'o'
    board[1][2] = 'x'
    print_board(board)
    print(is_game_over(board))
    announce_outcome(board,False)
