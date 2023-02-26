import 'dart:io';

import 'chess_class.dart';

class ChessBoard {
  bool isChoosed = false;
  bool isMat = false;
  bool doWhitesGoNow = true;
  int x = -1, y = -1; //координаты выбранной в данный момент фигуры
  ChessBoard() {
    resetMovePlates();
  }
  List<List<Chess>> board = [
    // массив фигур
    [
      Chess(2, false),
      Chess(3, false),
      Chess(4, false),
      Chess(5, false),
      Chess(6, false),
      Chess(4, false),
      Chess(3, false),
      Chess(2, false)
    ],
    [
      Chess(1, false),
      Chess(1, false),
      Chess(1, false),
      Chess(1, false),
      Chess(1, false),
      Chess(1, false),
      Chess(1, false),
      Chess(1, false)
    ],
    [
      Chess(0, true),
      Chess(0, true),
      Chess(0, true),
      Chess(0, true),
      Chess(0, true),
      Chess(0, true),
      Chess(0, true),
      Chess(0, true)
    ],
    [
      Chess(0, true),
      Chess(0, true),
      Chess(0, true),
      Chess(0, true),
      Chess(0, true),
      Chess(0, true),
      Chess(0, true),
      Chess(0, true)
    ],
    [
      Chess(0, true),
      Chess(0, true),
      Chess(0, true),
      Chess(0, true),
      Chess(2, false),
      Chess(0, true),
      Chess(0, true),
      Chess(0, true)
    ],
    [
      Chess(0, true),
      Chess(0, true),
      Chess(0, true),
      Chess(0, true),
      Chess(0, true),
      Chess(0, true),
      Chess(0, true),
      Chess(0, true)
    ],
    [
      Chess(1, true),
      Chess(1, true),
      Chess(1, true),
      Chess(1, true),
      Chess(1, true),
      Chess(1, true),
      Chess(1, true),
      Chess(1, true)
    ],
    [
      Chess(2, true),
      Chess(3, true),
      Chess(4, true),
      Chess(5, true),
      Chess(6, true),
      Chess(4, true),
      Chess(3, true),
      Chess(2, true)
    ],
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

  bool getColor(int i, int j) {
    return board[i][j].isWhite;
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
    if (!isChekingMAT) {
      resetMovePlates();
    }

    isChoosed = true;
    x = i;
    y = j;
    int n = board[i][j].type;

    switch (n) {
      case 0:
        resetMovePlates();
        break;
      case 1: //пешки
        {
          if (board[i][j].isWhite == true) {
            //белые(съесть)
            if (i > 0 &&
                j > 0 &&
                board[i - 1][j - 1].isWhite == false &&
                board[i - 1][j - 1].type != 0) {
              movePlates[i - 1][j - 1] = 2;
            }
            if (i > 0 &&
                j < 7 &&
                board[i - 1][j + 1].isWhite == false &&
                board[i - 1][j + 1].type != 0) {
              movePlates[i - 1][j + 1] = 2;
            }
          } else {
            //чёрные(съесть)
            if (i < 7 &&
                j > 0 &&
                board[i + 1][j - 1].isWhite == false &&
                board[i + 1][j - 1].type != 0) {
              movePlates[i - 1][j - 1] = 2;
            }
            if (i < 7 &&
                j < 7 &&
                board[i + 1][j + 1].isWhite == false &&
                board[i + 1][j + 1].type != 0) {
              movePlates[i - 1][j + 1] = 2;
            }
          }
          if (board[i][j].moveCounter != 0) {
            if (board[i][j].isWhite == true) {
              if (i - 1 > 0 && board[i - 1][j].type == 0) {
                movePlates[i - 1][j] = 1;
              } else {
                if (i - 1 == 0) {
                  //место для замены пешки
                }

                print('gg');
                break;
              }
            } else {
              //место для чёрных
              if (i + 1 < 7 && board[i + 1][j].type == 0) {
                movePlates[i + 1][j] = 1;
              } else {
                if (i + 1 == 7) {
                  //место для замены пешки
                }
                print('gg');
                break;
              }
              break;
            }
            break;
          } else {
            if (board[i][j].isWhite == true) {
              if (board[i - 1][j].type == 0) {
                movePlates[i - 1][j] = 1;
                if (board[i - 2][j].type == 0) {
                  movePlates[i - 2][j] = 1;
                } else {
                  print('gg');
                  break;
                }
              } else {
                print('gg');
                break;
              }
            } else {
              //место для чёрных
              if (board[i + 1][j].type == 0) {
                movePlates[i + 1][j] = 1;
                if (board[i + 2][j].type == 0) {
                  movePlates[i + 2][j] = 1;
                } else {
                  print('gg');
                  break;
                }
              } else {
                print('gg');
                break;
              }
              if (board[i + 1][j].type == 0) {
                movePlates[i + 1][j] = 1;
                if (board[i + 2][j].type == 0) {
                  movePlates[i + 2][j] = 1;
                } else {
                  print('gg');
                  break;
                }
              } else {
                print('gg');
                break;
              }
            }
          }
        }
        break;
      case 2: //ладьи
        {
          int a = i, b = j + 1;

          while (b < 8 && board[a][b].type == 0) {
            movePlates[a][b] = 1;

            b++;
          }
          if (b < 8 &&
              board[a][b].type != 0 &&
              board[a][b].isWhite != board[i][j].isWhite) {
            movePlates[a][b] = 2;
          }
          b = j - 1;

          while (b >= 0 && board[a][b].type == 0) {
            movePlates[a][b] = 1;

            b--;
          }
          if (b >= 0 &&
              board[a][b].type != 0 &&
              board[a][b].isWhite != board[i][j].isWhite) {
            movePlates[a][b] = 2;
          }
          a = i - 1;
          b = j;

          while (a >= 0 && board[a][b].type == 0) {
            movePlates[a][b] = 1;
            a--;
          }
          if (a >= 0 &&
              board[a][b].type != 0 &&
              board[a][b].isWhite != board[i][j].isWhite) {
            movePlates[a][b] = 2;
          }
          a = i + 1;

          while (a < 8 && board[a][b].type == 0) {
            movePlates[a][b] = 1;
            a++;
          }
          if (a < 8 &&
              board[a][b].type != 0 &&
              board[a][b].isWhite != board[i][j].isWhite) {
            movePlates[a][b] = 2;
          }
        }
        break;
      case 3: //кони
        {
          int a = i - 1, b = j + 2;
          if (a >= 0 && b < 8 && board[a][b].type == 0) movePlates[a][b] = 1;
          if (a >= 0 &&
              b < 8 &&
              board[a][b].type != 0 &&
              board[a][b].isWhite != board[i][j].isWhite) {
            movePlates[a][b] = 2;
          }
          a--;
          b--;
          if (a >= 0 && b < 8 && board[a][b].type == 0) movePlates[a][b] = 1;
          if (a >= 0 &&
              b < 8 &&
              board[a][b].type != 0 &&
              board[a][b].isWhite != board[i][j].isWhite) {
            movePlates[a][b] = 2;
          }
          b -= 2;
          if (a >= 0 && b >= 0 && board[a][b].type == 0) movePlates[a][b] = 1;
          if (a >= 0 &&
              b >= 0 &&
              board[a][b].type != 0 &&
              board[a][b].isWhite != board[i][j].isWhite) {
            movePlates[a][b] = 2;
          }
          b--;
          a++;
          if (a >= 0 && b >= 0 && board[a][b].type == 0) movePlates[a][b] = 1;
          if (a >= 0 &&
              b >= 0 &&
              board[a][b].type != 0 &&
              board[a][b].isWhite != board[i][j].isWhite) {
            movePlates[a][b] = 2;
          }
          a += 2;
          if (a < 8 && b >= 0 && board[a][b].type == 0) movePlates[a][b] = 1;
          if (a < 8 &&
              b >= 0 &&
              board[a][b].type != 0 &&
              board[a][b].isWhite != board[i][j].isWhite) {
            movePlates[a][b] = 2;
          }
          a++;
          b++;
          if (a < 8 && b >= 0 && board[a][b].type == 0) movePlates[a][b] = 1;
          if (a < 8 &&
              b >= 0 &&
              board[a][b].type != 0 &&
              board[a][b].isWhite != board[i][j].isWhite) {
            movePlates[a][b] = 2;
          }
          b += 2;
          if (a < 8 && b < 8 && board[a][b].type == 0) movePlates[a][b] = 1;
          if (a < 8 &&
              b < 8 &&
              board[a][b].type != 0 &&
              board[a][b].isWhite != board[i][j].isWhite) {
            movePlates[a][b] = 2;
          }
          b++;
          a--;
          if (a < 8 && b < 8 && board[a][b].type == 0) movePlates[a][b] = 1;
          if (a < 8 &&
              b < 8 &&
              board[a][b].type != 0 &&
              board[a][b].isWhite != board[i][j].isWhite) {
            movePlates[a][b] = 2;
          }
        }
        break;
      case 4: //слоны
        {
          int a = i + 1, b = j + 1;

          while (a < 8 && b < 8 && board[a][b].type == 0) {
            movePlates[a][b] = 1;
            a++;
            b++;
          }
          if (a < 8 &&
              b < 8 &&
              board[a][b].type != 0 &&
              board[a][b].isWhite != board[i][j].isWhite) {
            movePlates[a][b] = 2;
          }
          a = i - 1;
          b = j - 1;

          while (a >= 0 && b >= 0 && board[a][b].type == 0) {
            movePlates[a][b] = 1;
            a--;
            b--;
          }
          if (a >= 0 &&
              b >= 0 &&
              board[a][b].type != 0 &&
              board[a][b].isWhite != board[i][j].isWhite) {
            movePlates[a][b] = 2;
          }
          a = i - 1;
          b = j + 1;

          while (a >= 0 && b < 8 && board[a][b].type == 0) {
            movePlates[a][b] = 1;
            a--;
            b++;
          }
          if (a >= 0 &&
              b < 8 &&
              board[a][b].type != 0 &&
              board[a][b].isWhite != board[i][j].isWhite) {
            movePlates[a][b] = 2;
          }
          a = i + 1;
          b = j - 1;

          while (a < 8 && b >= 0 && board[a][b].type == 0) {
            movePlates[a][b] = 1;
            a++;
            b--;
          }
          if (a < 8 &&
              b >= 0 &&
              board[a][b].type != 0 &&
              board[a][b].isWhite != board[i][j].isWhite) {
            movePlates[a][b] = 2;
          }
        }
        break;
      case 5: //ферзи
        {
          int a = i, b = j + 1;

          while (b < 8 && board[a][b].type == 0) {
            movePlates[a][b] = 1;

            b++;
          }
          if (b < 8 &&
              board[a][b].type != 0 &&
              board[a][b].isWhite != board[i][j].isWhite) {
            movePlates[a][b] = 2;
          }
          b = j - 1;

          while (b >= 0 && board[a][b].type == 0) {
            movePlates[a][b] = 1;

            b--;
          }
          if (b >= 0 &&
              board[a][b].type != 0 &&
              board[a][b].isWhite != board[i][j].isWhite) {
            movePlates[a][b] = 2;
          }
          a = i - 1;
          b = j;

          while (a >= 0 && board[a][b].type == 0) {
            movePlates[a][b] = 1;
            a--;
          }
          if (a >= 0 &&
              board[a][b].type != 0 &&
              board[a][b].isWhite != board[i][j].isWhite) {
            movePlates[a][b] = 2;
          }
          a = i + 1;

          while (a < 8 && board[a][b].type == 0) {
            movePlates[a][b] = 1;
            a++;
          }
          if (a < 8 &&
              board[a][b].type != 0 &&
              board[a][b].isWhite != board[i][j].isWhite) {
            movePlates[a][b] = 2;
          }
          a = i + 1;
          b = j + 1;

          while (a < 8 && b < 8 && board[a][b].type == 0) {
            movePlates[a][b] = 1;
            a++;
            b++;
          }
          if (a < 8 &&
              b < 8 &&
              board[a][b].type != 0 &&
              board[a][b].isWhite != board[i][j].isWhite) {
            movePlates[a][b] = 2;
          }
          a = i - 1;
          b = j - 1;

          while (a >= 0 && b >= 0 && board[a][b].type == 0) {
            movePlates[a][b] = 1;
            a--;
            b--;
          }
          if (a >= 0 &&
              b >= 0 &&
              board[a][b].type != 0 &&
              board[a][b].isWhite != board[i][j].isWhite) {
            movePlates[a][b] = 2;
          }
          a = i - 1;
          b = j + 1;

          while (a >= 0 && b < 8 && board[a][b].type == 0) {
            movePlates[a][b] = 1;
            a--;
            b++;
          }
          if (a >= 0 &&
              b < 8 &&
              board[a][b].type != 0 &&
              board[a][b].isWhite != board[i][j].isWhite) {
            movePlates[a][b] = 2;
          }
          a = i + 1;
          b = j - 1;

          while (a < 8 && b >= 0 && board[a][b].type == 0) {
            movePlates[a][b] = 1;
            a++;
            b--;
          }
          if (a < 8 &&
              b >= 0 &&
              board[a][b].type != 0 &&
              board[a][b].isWhite != board[i][j].isWhite) {
            movePlates[a][b] = 2;
          }
        }
        break;
      case 6: //короли
        {
          int a = i + 1, b = j + 1;
          if (a < 8 && b < 8 && board[a][b].type == 0) movePlates[a][b] = 1;
          if (a < 8 &&
              b < 8 &&
              board[a][b].type != 0 &&
              board[a][b].isWhite != board[i][j].isWhite) {
            movePlates[a][b] = 2;
          }
          b--;
          if (a < 8 && board[a][b].type == 0) movePlates[a][b] = 1;
          if (a < 8 &&
              board[a][b].type != 0 &&
              board[a][b].isWhite != board[i][j].isWhite) {
            movePlates[a][b] = 2;
          }
          b--;
          if (a < 8 && b >= 0 && board[a][b].type == 0) movePlates[a][b] = 1;
          if (a < 8 &&
              b >= 0 &&
              board[a][b].type != 0 &&
              board[a][b].isWhite != board[i][j].isWhite) {
            movePlates[a][b] = 2;
          }
          a--;
          if (b >= 0 && board[a][b].type == 0) movePlates[a][b] = 1;
          if (b >= 0 &&
              board[a][b].type != 0 &&
              board[a][b].isWhite != board[i][j].isWhite) {
            movePlates[a][b] = 2;
          }
          a--;
          if (a >= 0 && b >= 0 && board[a][b].type == 0) movePlates[a][b] = 1;
          if (a >= 0 &&
              b >= 0 &&
              board[a][b].type != 0 &&
              board[a][b].isWhite != board[i][j].isWhite) {
            movePlates[a][b] = 2;
          }
          b++;
          if (a >= 0 && board[a][b].type == 0) movePlates[a][b] = 1;
          if (a >= 0 &&
              board[a][b].type != 0 &&
              board[a][b].isWhite != board[i][j].isWhite) {
            movePlates[a][b] = 2;
          }
          b++;
          if (a >= 0 && b < 8 && board[a][b].type == 0) movePlates[a][b] = 1;
          if (a >= 0 &&
              b < 8 &&
              board[a][b].type != 0 &&
              board[a][b].isWhite != board[i][j].isWhite) {
            movePlates[a][b] = 2;
          }
          a++;
          if (b < 8 && board[a][b].type == 0) movePlates[a][b] = 1;
          if (b < 8 &&
              board[a][b].type != 0 &&
              board[a][b].isWhite != board[i][j].isWhite) {
            movePlates[a][b] = 2;
          }
        }
        break;

      default:
        print("No such chess!!!");
    }
  }

  Future<void> move(/*to->*/ int i, int j) async {
    if (x != -1 && y != -1) {
      int dopX = x, dopY = y;
      Chess xy = Chess(board[x][y].type, board[x][y].isWhite);
      xy.moveCounter = board[x][y].moveCounter;
      int dopI = i, dopJ = j;
      Chess ij = Chess(board[i][j].type, board[i][j].isWhite);
      ij.moveCounter = board[i][j].moveCounter;
      if (movePlates[i][j] == 1) {
        board[x][y].moveCounter++;
        Chess c = board[i][j];
        board[i][j] = board[x][y];
        board[x][y] = c;
        print('xy =');
        print(board[x][y].moveCounter);
        print('ij =');
        print(board[i][j].moveCounter);
      } else if (movePlates[i][j] == 2) {
        board[x][y].moveCounter++;
        board[i][j] = board[x][y];
        board[x][y] = Chess(0, true);
      }
      matChek(doWhitesGoNow);
      if (isMat) {
        board[dopX][dopY].type = xy.type;
        board[dopX][dopY].moveCounter = xy.moveCounter;
        board[dopX][dopY].isWhite = xy.isWhite;

        board[dopI][dopJ].type = ij.type;
        board[dopI][dopJ].moveCounter = ij.moveCounter;
        board[dopI][dopJ].isWhite = ij.isWhite;
        print('MAT!!!!!');
        isMat = false;
        doWhitesGoNow = !doWhitesGoNow;
      }
      doWhitesGoNow = !doWhitesGoNow;
    } else {
      print('X or Y == -1 !!!');
    }

    resetMovePlates();
  }

  Future<void> matChek(bool isWhiteChek) async {
    isMat = false;
    for (var i = 0; i < 8; i++) {
      for (var j = 0; j < 8; j++) {
        if (board[i][j].isWhite != isWhiteChek && board[i][j].type != 0) {
          chekMovePlates(i, j, true);
        }
      }
    }
    for (var i = 0; i < 8; i++) {
      for (var j = 0; j < 8; j++) {
        if (board[i][j].type == 6 && movePlates[i][j] == 2) {
          isMat = true;
        }
      }
    }
    resetMovePlates();
    print("ismat = $isMat");
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
