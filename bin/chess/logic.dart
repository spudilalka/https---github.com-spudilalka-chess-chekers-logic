// import 'package:logic/logic.dart';
// import 'dart:io';
import 'chess_board_class.dart';

void main(List<String> arguments) {
  ChessBoard chBoard = ChessBoard();
  // int x = 0, y = 0;
  // while (x != 100 || y != 100) {
  //   board.click(x, y);
  //   board.outputModified();
  //   print('Введите X:');
  //   x = int.parse(stdin.readLineSync() ?? '0');
  //   print('Введите Y:');
  //   y = int.parse(stdin.readLineSync() ?? '0');
  // }
  print(chBoard.getColor(0, 0));
  print(chBoard.getColor(7, 7));
  chBoard.getColor(0, 0);
  chBoard.getColor(7, 7);
  chBoard.matChek(true);
  chBoard.outputModified();
  chBoard.click(6, 5);
  chBoard.outputModified();
  chBoard.click(5, 5);
  chBoard.outputModified();
  chBoard.click(1, 5);
  chBoard.outputModified();
  chBoard.click(2, 5);
  chBoard.outputModified();
  chBoard.click(2, 5);
  chBoard.outputModified();
  print(chBoard.getColor(2, 5));
  chBoard.click(5, 0);
  chBoard.outputModified();
  chBoard.click(7, 3);
  chBoard.outputModified();
  chBoard.click(6, 4);
  chBoard.outputModified();
  // board.click(5, 1);
  // board.outputModified();
  // board.click(3, 0);
  // board.outputModified();

  // board.chekMovePlates(6, 1);
  // board.move(5, 1);
  // board.outputModified();
}
