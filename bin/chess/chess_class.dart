class Chess {
  int type = 0; //вид

  int moveCounter = 0;
  bool isWhite = true;

  Chess(int newType, bool newIsWhite) {
    type = newType;
    isWhite = newIsWhite;
  }
}
