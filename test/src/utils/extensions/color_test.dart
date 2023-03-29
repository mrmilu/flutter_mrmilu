import 'package:faker_dart/faker_dart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mrmilu/flutter_mrmilu.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final faker = Faker.instance;
  test('should convert color to hexa when call toHex', () {
    final hexa = faker.datatype.hexaDecimal(length: 6);
    final hexaInt = int.parse(hexa);
    final color = Color(hexaInt);
    final hexaExpected = hexa.replaceRange(0, 2, '').toLowerCase();

    expect(color.toHex(), hexaExpected);
  });
  test(
      'should convert color to hexa with hash when call toHex with leadingHashSign true',
      () {
    final hexa = faker.datatype.hexaDecimal(length: 6);
    final hexaInt = int.parse(hexa);
    final color = Color(hexaInt);
    final hexaExpected = hexa.replaceRange(0, 2, '').toLowerCase();

    expect(color.toHex(leadingHashSign: true), '#$hexaExpected');
  });
  test(
      'should convert color with alpha to hexa when call toHex with withAlpha true',
      () {
    final hexa = faker.datatype.hexaDecimal(length: 8);
    final hexaInt = int.parse(hexa);
    final color = Color(hexaInt);
    final hexaExpected = hexa.replaceRange(0, 2, '').toLowerCase();

    expect(color.toHex(withAlpha: true), hexaExpected);
  });
}
