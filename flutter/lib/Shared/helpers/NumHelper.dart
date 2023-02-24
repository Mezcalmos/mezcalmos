extension ParseNumber on num {
  String toPriceString({bool rounded = true}) {
    final String str =
        "\$${(rounded) ? round().toStringAsFixed(0) : toStringAsFixed(2)}";
    return str;
  }
}

extension IntArrayHelper on List<int> {
  int closest(int value) {
    int data = first;
    forEach((int element) {
      if ((value - element).abs() < (value - data)) {
        data = element;
      }
    });
    return data;
  }
}
// def closest (num, arr):
//     curr = arr[0]
//     foreach val in arr:
//         if abs (num - val) < abs (num - curr):
//             curr = val
//     return curr
