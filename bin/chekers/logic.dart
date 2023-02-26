// import 'package:logic/logic.dart';
// import 'dart:io';

import 'chekers_board_class.dart';

void main(List<String> arguments) {
  ChekersBoard chkBoard = ChekersBoard();

  chkBoard.outputModified();
  chkBoard.click(5, 1);
  chkBoard.outputModified();
  chkBoard.click(4, 2);
  chkBoard.outputModified();
  chkBoard.click(4, 2);
  chkBoard.outputModified();
  chkBoard.click(3, 1);
  chkBoard.outputModified();
  chkBoard.click(2, 0);
  chkBoard.outputModified();
  chkBoard.click(3, 1);
  chkBoard.outputModified();
  chkBoard.click(4, 2);
  chkBoard.outputModified();
  chkBoard.click(3, 1);
  chkBoard.outputModified();
  //k board.click(5, 1);
  // board.outputModified();
  // board.click(3, 0);
  // board.outputModified();

  // board.chekMovePlates(6, 1);
  // board.move(5, 1);
  // board.outputModified();
}
