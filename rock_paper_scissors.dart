import 'dart:io';
import 'dart:math';

enum Move {rock, paper, scissors}
void main() {
  final rng = Random();
  while(true) {
  stdout.write('Rock, paper or scissors? ( r/p/s)');
  final input = stdin.readLineSync();
  if(input == 'r' || input == 'p' || input =='s') {
    var playerMove;
    if (input == 'r') {
      playerMove = Move.rock;
    } else if (input == 'p') {
      playerMove = Move.paper;
    } else {
      playerMove = Move.scissors;
    }
    final random  = rng.nextInt(3);
    final aiMove = Move.values[random];
    print('You played: $playerMove');
    print('AI played: $aiMove');
    if (playerMove == aiMove)
      print('It\'s a draw\n');
    else if (playerMove == Move.rock && aiMove == Move.scissors)
      print('You Win\n');
    else if (playerMove == Move.rock && aiMove == Move.paper)
      print('You lose\n');
    else if (playerMove == Move.paper && aiMove == Move.scissors)
      print('You lose\n');
  } else if (input == 'q') {
    break;
  } else {
    print('Invalid input');
  }
  }
}
