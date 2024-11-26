import socket
import threading


def create_board():
    """Create an empty Tic Tac Toe board."""
    return [' ' for _ in range(9)]


def print_board(board):
    """Print the current state of the board."""
    print("Current Board:")
    for i in range(3):
        print(f"{board[i * 3]} | {board[i * 3 + 1]} | {board[i * 3 + 2]}")
        if i < 2:
            print("---------")


def check_winner(board):
    """Check if there is a winner."""
    winning_combinations = [
        (0, 1, 2), (3, 4, 5), (6, 7, 8),  # Rows
        (0, 3, 6), (1, 4, 7), (2, 5, 8),  # Columns
        (0, 4, 8), (2, 4, 6)  # Diagonals
    ]
    for a, b, c in winning_combinations:
        if board[a] == board[b] == board[c] != ' ':
            return board[a]
    return None


def handle_client(client_socket, player_marker, players):
    """Handle client connection and game logic."""
    board = create_board()
    current_player = player_marker

    while True:
        # Notify the current player to make a move
        message = f"Current Board: {board}\nYour turn ({current_player}). Enter your move (0-8): "
        client_socket.send(message.encode())

        # Wait for the player's move
        move = client_socket.recv(1024).decode()

        if move.isdigit() and int(move) in range(9) and board[int(move)] == ' ':
            # Update the board with the player's move
            board[int(move)] = current_player
            print_board(board)

            # Check for a winner
            winner = check_winner(board)
            if winner:
                for player in players:
                    player.send(f"Player {winner} wins!\n".encode())
                break
            elif ' ' not in board:
                for player in players:
                    player.send("It's a draw!\n".encode())
                break

            # Switch players
            current_player = 'O' if current_player == 'X' else 'X'
        else:
            client_socket.send("Invalid move. Try again.\n".encode())


def main():
    server_ip = "127.0.0.1"  # Change to your server's IP address if needed
    server_port = 6969

    server = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    server.bind((server_ip, server_port))
    server.listen(2)

    print("Server is waiting for players...")

    players = []

    for marker in ['X', 'O']:
        client_socket, address = server.accept()
        print(f"Player {marker} connected from {address}")
        players.append(client_socket)

        # Start a new thread for each player
        threading.Thread(target=handle_client, args=(client_socket, marker, players)).start()


if __name__ == "__main__":
    main()