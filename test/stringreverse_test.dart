import 'package:test/test.dart';
import 'package:stringreverse/stringreverse.dart';

void main() {
  group("String Reverse", () {
    test('Is Null', () {
      String value = null;
      expect(() => StringReverseExtension.StringReverse(value),
          throwsArgumentError);
    });
    test('Is Empty', () {
      String value = "";
      expect(value.isEmpty, true);
    });
    test('Is Two Spaces', () {
      const String input = "  two  spaces  ";
      const String expected = "  secaps  owt  ";
      expect(StringReverseExtension.StringReverse(input), expected);
    });
    test('Is Whitespace', () {
      const String input = "  ";
      expect(StringReverseExtension.StringReverse(input), "  ");
    });
    test('Is Unicode Astral Symbol Surrogate Pair', () {
      const String input = "foo\uD834\uDF06bar";
      const String expected = "rab\uD834\uDF06oof";
      expect(StringReverseExtension.StringReverse(input), expected);
    });
    test(
        'Is Unicode Astral Symbol Surrogate Pair Followed By A Single Combining Marks',
        () {
      const String input = "foo\uD834\uDF06\u0303bar";
      const String expected = "rab\uD834\uDF06\u0303oof";
      expect(StringReverseExtension.StringReverse(input), expected);
    });
    test(
        'Is Unicode Astral Symbol Surrogate Pair Followed By Multiple Combining Marks',
        () {
      const String input = "foo\uD834\uDF06\u0303\u035C\u035D\u035Ebar";
      const String expected = "rab\uD834\uDF06\u0303\u035C\u035D\u035Eoof";
      expect(StringReverseExtension.StringReverse(input), expected);
    });
    test('Is Unicode Combining Marks', () {
      const String input = "man\u0303ana";
      const String expected = "anan\u0303am";
      expect(StringReverseExtension.StringReverse(input), expected);
    });
    test('Is Unicode Multiple Combining Marks', () {
      const String input = "foo\u0303\u035C\u035D\u035Ebar";
      const String expected = "rabo\u0303\u035C\u035D\u035Eof";
      expect(StringReverseExtension.StringReverse(input), expected);
    });
    test('Is Unicode Nothing Special', () {
      const String input = "ma\xF1ana";
      const String expected = "an༚am";
      expect(StringReverseExtension.StringReverse(input), expected);
    });
    test('Is Unicode Unpaired Surrogates', () {
      const String input = "foo\uD834bar\uDF06baz";
      const String expected = "zab\uDF06rab\uD834oof";
      expect(StringReverseExtension.StringReverse(input), expected);
    });
    test('Is Unicode Zalgo', () {
      const String input =
          "H\u0339\u0319\u0326\u032E\u0349\u0329\u0317\u0317\u0367\u0307\u030F\u030A\u033EE\u0368\u0346\u0352\u0306\u036E\u0303\u034F\u0337\u032E\u0323\u032B\u0324\u0323 \u0335\u031E\u0339\u033B\u0300\u0309\u0313\u036C\u0351\u0361\u0345C\u036F\u0302\u0350\u034F\u0328\u031B\u0354\u0326\u031F\u0348\u033BO\u031C\u034E\u034D\u0359\u035A\u032C\u031D\u0323\u033D\u036E\u0350\u0357\u0300\u0364\u030D\u0300\u0362M\u0334\u0321\u0332\u032D\u034D\u0347\u033C\u031F\u032F\u0326\u0309\u0312\u0360\u1E1A\u031B\u0319\u031E\u032A\u0317\u0365\u0364\u0369\u033E\u0351\u0314\u0350\u0345\u1E6E\u0334\u0337\u0337\u0317\u033C\u034D\u033F\u033F\u0313\u033D\u0350H\u0319\u0319\u0314\u0304\u035C";
      const String expected =
          "H\u0319\u0319\u0314\u0304\u035C\u1E6E\u0334\u0337\u0337\u0317\u033C\u034D\u033F\u033F\u0313\u033D\u0350\u1E1A\u031B\u0319\u031E\u032A\u0317\u0365\u0364\u0369\u033E\u0351\u0314\u0350\u0345M\u0334\u0321\u0332\u032D\u034D\u0347\u033C\u031F\u032F\u0326\u0309\u0312\u0360O\u031C\u034E\u034D\u0359\u035A\u032C\u031D\u0323\u033D\u036E\u0350\u0357\u0300\u0364\u030D\u0300\u0362C\u036F\u0302\u0350\u034F\u0328\u031B\u0354\u0326\u031F\u0348\u033B \u0335\u031E\u0339\u033B\u0300\u0309\u0313\u036C\u0351\u0361\u0345E\u0368\u0346\u0352\u0306\u036E\u0303\u034F\u0337\u032E\u0323\u032B\u0324\u0323H\u0339\u0319\u0326\u032E\u0349\u0329\u0317\u0317\u0367\u0307\u030F\u030A\u033E";
      expect(StringReverseExtension.StringReverse(input), expected);
    });
  });
}
