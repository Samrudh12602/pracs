import random

def print_board(board):
    for row in board:
        print(" | ".join(row))
        print("-" * 9)

def check_winner(board, player):
    for row in board:
        if all(cell == player for cell in row):
            return True

    for col in range(3):
        if all(board[row][col] == player for row in range(3)):
            return True

    if all(board[i][i] == player for i in range(3)) or all(board[i][2 - i] == player for i in range(3)):
        return True

    return False

def is_board_full(board):
    return all(all(cell != " " for cell in row) for row in board)

def get_player_move(player):
    if player == "X":
        row = int(input("Enter row (0, 1, or 2): "))
        col = int(input("Enter column (0, 1, or 2): "))
        return row, col
    elif player == "O":
        return get_computer_move()

def get_computer_move(board):
    empty_cells = [(row, col) for row in range(3) for col in range(3) if board[row][col] == " "]
    return random.choice(empty_cells)

def tic_tac_toe():
    board = [[" " for _ in range(3)] for _ in range(3)]
    players = ["X", "O"]

    while True:
        print_board(board)
        player = players[0]

        if player == "X":
            row, col = get_player_move(player)
        else:
            print("Computer's turn (O).")
            row, col = get_computer_move(board)

        if board[row][col] == " ":
            board[row][col] = player
            if check_winner(board, player):
                print_board(board)
                if player == "X":
                    print("Player X wins!")
                else:
                    print("Computer (O) wins!")
                break
            elif is_board_full(board):
                print_board(board)
                print("It's a tie!")
                break
            else:
                players = players[::-1]
        else:
            print("That position is already taken. Try again.")

if __name__ == "__main__":
    tic_tac_toe()