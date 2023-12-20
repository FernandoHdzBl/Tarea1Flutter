class HighScore {
  String _name;
  int _score;

  HighScore(this._name, this._score);

  String get name => _name;

  set name(String value) {
    _name = value;
  }

  int get score => _score;

  set score(int value) {
    _score = value;
  }
}