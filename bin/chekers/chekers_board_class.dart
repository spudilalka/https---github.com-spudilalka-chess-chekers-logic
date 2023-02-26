import 'dart:io';

import 'chekers_class.dart';

class ChekersBoard {
  bool isChoosed = false;
  bool isMat = false;
  bool doWhitesGoNow = true;
  int x = -1, y = -1; //координаты выбранной в данный момент фигуры
  ChekersBoard() {
    resetMovePlates();
  }
  List<List<Chekers>> board = [
    // массив фигур
    [
      Chekers(1, false),
      Chekers(0, false),
      Chekers(1, false),
      Chekers(0, false),
      Chekers(1, false),
      Chekers(0, false),
      Chekers(1, false),
      Chekers(0, false)
    ],
    [
      Chekers(0, false),
      Chekers(1, false),
      Chekers(0, false),
      Chekers(1, false),
      Chekers(0, false),
      Chekers(1, false),
      Chekers(0, false),
      Chekers(1, false)
    ],
    [
      Chekers(1, false),
      Chekers(0, false),
      Chekers(1, false),
      Chekers(0, false),
      Chekers(1, false),
      Chekers(0, false),
      Chekers(1, false),
      Chekers(0, false)
    ],
    [
      Chekers(0, false),
      Chekers(0, false),
      Chekers(0, false),
      Chekers(0, false),
      Chekers(0, false),
      Chekers(0, false),
      Chekers(0, false),
      Chekers(0, false)
    ],
    [
      Chekers(0, false),
      Chekers(0, false),
      Chekers(0, false),
      Chekers(0, false),
      Chekers(0, false),
      Chekers(0, false),
      Chekers(0, false),
      Chekers(0, false)
    ],
    [
      Chekers(0, true),
      Chekers(1, true),
      Chekers(0, true),
      Chekers(1, true),
      Chekers(0, true),
      Chekers(1, true),
      Chekers(0, true),
      Chekers(1, true)
    ],
    [
      Chekers(1, true),
      Chekers(0, true),
      Chekers(1, true),
      Chekers(0, true),
      Chekers(1, true),
      Chekers(0, true),
      Chekers(1, true),
      Chekers(0, true)
    ],
    [
      Chekers(0, true),
      Chekers(1, true),
      Chekers(0, true),
      Chekers(1, true),
      Chekers(0, true),
      Chekers(1, true),
      Chekers(0, true),
      Chekers(1, true)
    ]
  ];

  List<List<int>> movePlates = [
    //массив полей, в которые может сходить выбранная фигура
    [0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0],
  ];

  void resetMovePlates() {
    //сбросс массива ходов
    movePlates = [
      [0, 0, 0, 0, 0, 0, 0, 0],
      [0, 0, 0, 0, 0, 0, 0, 0],
      [0, 0, 0, 0, 0, 0, 0, 0],
      [0, 0, 0, 0, 0, 0, 0, 0],
      [0, 0, 0, 0, 0, 0, 0, 0],
      [0, 0, 0, 0, 0, 0, 0, 0],
      [0, 0, 0, 0, 0, 0, 0, 0],
      [0, 0, 0, 0, 0, 0, 0, 0]
    ];
    isChoosed = false;
    x = -1;
    y = -1;
  }

  void outputModified() {
    print("\n\n");
    for (int i = 0; i < 8; i++) {
      stdout.write(i);
      stdout.write('[');
      for (int j = 0; j < 8; j++) {
        stdout.write(board[i][j].type);
        stdout.write(', ');
      }
      stdout.write(']   [');
      for (int j = 0; j < 8; j++) {
        stdout.write(movePlates[i][j]);
        stdout.write(', ');
      }
      stdout.write(']\n');
    }
    // print('\n is choosed = $isChoosed');
    // print('x = $x');
    // print('y = $y');
  }

  Future<void> chekMovePlates(int i, int j, bool isChekingMAT) async {
    resetMovePlates();

    isChoosed = true;
    x = i;
    y = j;

    if (board[i][j].isWhite == true) {
      //белые(съесть)
      if (i > 0 &&
          j > 0 &&
          board[i - 1][j - 1].isWhite == false &&
          board[i - 1][j - 1].type == 1) {
        movePlates[i - 1][j - 1] = 2;
      } else if (i > 0 &&
          j > 0 &&
          board[i - 1][j - 1].isWhite == false &&
          board[i - 1][j - 1].type == 0) {
        movePlates[i - 1][j - 1] = 1;
      }
      if (i > 0 &&
          j < 7 &&
          board[i - 1][j + 1].isWhite == false &&
          board[i - 1][j + 1].type == 1) {
        movePlates[i - 1][j + 1] = 2;
      } else if (i > 0 &&
          j < 7 &&
          board[i - 1][j + 1].isWhite == false &&
          board[i - 1][j + 1].type == 0) {
        movePlates[i - 1][j + 1] = 1;
      }
    } else {
      //чёрные(съесть)
      if (i < 7 &&
          j > 0 &&
          board[i + 1][j - 1].isWhite == false &&
          board[i + 1][j - 1].type == 1) {
        movePlates[i - 1][j - 1] = 2;
      } else if (i < 7 &&
          j > 0 &&
          board[i + 1][j - 1].isWhite == false &&
          board[i + 1][j - 1].type == 0) {
        movePlates[i - 1][j - 1] = 1;
      }
      if (i < 7 &&
          j < 7 &&
          board[i + 1][j + 1].isWhite == false &&
          board[i + 1][j + 1].type == 1) {
        movePlates[i - 1][j + 1] = 2;
      } else if (i < 7 &&
          j < 7 &&
          board[i + 1][j + 1].isWhite == false &&
          board[i + 1][j + 1].type == 0) {
        movePlates[i - 1][j + 1] = 1;
      }
    }
  }

  Future<void> move(/*to->*/ int i, int j) async {
    if (x != -1 && y != -1) {
      if (movePlates[i][j] == 1) {
        board[x][y].moveCounter++;
        Chekers c = board[i][j];
        board[i][j] = board[x][y];
        board[x][y] = c;
        print('xy =');
        print(board[x][y].moveCounter);
        print('ij =');
        print(board[i][j].moveCounter);
      } else if (movePlates[i][j] == 2) {
        board[x][y].moveCounter++;
        board[i][j] = board[x][y];
        board[x][y] = Chekers(0, true);
      }

      doWhitesGoNow = !doWhitesGoNow;
    } else {
      print('X or Y == -1 !!!');
    }

    resetMovePlates();
  }

  Future<void> click(int i, int j) async {
    if (isChoosed) {
      if (board[x][y].isWhite == doWhitesGoNow) {
        await move(i, j);
      } else {
        resetMovePlates();
      }
    } else {
      await chekMovePlates(i, j, false);
    }
  }
}
