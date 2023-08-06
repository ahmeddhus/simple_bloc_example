extension Subscript<T> on Iterable<T> {
  T? operator [](int index) => length > index ? elementAt(index) : null;
}

extension IsEqualTIgnoringOrdering<T> on Iterable<T> {
  bool isEqualTIgnoringOrdering(Iterable<T> other) =>
      length == other.length && {...this}.intersection({...other}).length == length;
}
