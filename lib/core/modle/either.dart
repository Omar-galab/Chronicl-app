class Either <L ,R>{
  final L? _left;
  final R? _right;
  Either._(this._left ,this._right);
  factory  Either.left(L left) => Either._(left,null);
  factory  Either.right(R right) => Either._(null,right);
  bool get isLeft => _left != null;
  bool get isRight => _right != null;

  L get left{
    if(_left ==null){
      throw StateError('Called left on right');
    }else{
      return _left;
    }
  }

  R get right{
    if(_right ==null){
      throw StateError('Called right on left');
    }else{
      return _right;
    }
  }


}