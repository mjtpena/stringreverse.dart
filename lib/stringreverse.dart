library stringreverse;

import 'dart:convert' show utf8;

class StringReverseExtension {
  static String StringReverse(String value) {
    if (value == null) {
      throw new ArgumentError.notNull("Supplied argument 'value' is null.");
    }

    int length = value.length;
    List<int> charCodes = new List(length);
    for (var index = 0; index < length; index++) {
      charCodes[index] = value.codeUnitAt(length - index - 1);
    }

    return new String.fromCharCodes(charCodes);
  }
}
