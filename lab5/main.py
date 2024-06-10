from studentA import print_board, is_game_over, new_board, announce_outcome
from studentB import ai_move, get_users_move, is_player_starting

board = new_board()
players_move = is_player_starting()
while not is_game_over(board):
    print_board(board)
    board = players_move and get_users_move(board) or ai_move(board)
    players_move = not players_move

announce_outcome(board,players_move)