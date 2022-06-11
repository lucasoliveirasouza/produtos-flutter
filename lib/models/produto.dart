
class Produto{
  late int _id;
  late String _nome;
  late double _quantidade;
  late double _valor;

  Produto(this._id, this._nome, this._quantidade, this._valor);

  double get valor => _valor;

  set valor(double value) {
    _valor = value;
  }

  double get quantidade => _quantidade;

  set quantidade(double value) {
    _quantidade = value;
  }

  String get nome => _nome;

  set nome(String value) {
    _nome = value;
  }

  int get id => _id;

  set id(int value) {
    _id = value;
  }
}