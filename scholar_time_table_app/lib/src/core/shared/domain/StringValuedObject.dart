class StringValuedObjects {
  final String value;

  StringValuedObjects(this.value);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StringValuedObjects &&
          runtimeType == other.runtimeType &&
          value == other.value;

  @override
  int get hashCode => value.hashCode;
}