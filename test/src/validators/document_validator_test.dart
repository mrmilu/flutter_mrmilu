import 'package:flutter_mrmilu/flutter_mrmilu.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final documentValidator = DocumentValidators();

  group('dni -', () {
    test('will be false when call with empty value', () {
      expect(documentValidator.nif(''), false);
    });
    test('will be false when call with invalid value', () {
      expect(documentValidator.nif('123456789'), false);
      expect(documentValidator.nif('ASDFHJKLÑ'), false);
      expect(documentValidator.nif('ADFTUIOP1'), false);
      expect(documentValidator.nif('ZXCVBNMASF'), false);
    });
    test('will be true when call with valid dni', () {
      expect(documentValidator.nif('81528831H'), true);
      expect(documentValidator.nif('75786196T'), true);
      expect(documentValidator.nif('97346103Y'), true);
      expect(documentValidator.nif('65001227F'), true);
      expect(documentValidator.nif('31552302M'), true);
      expect(documentValidator.nif('81003727G'), true);
      expect(documentValidator.nif('88864035Q'), true);
      expect(documentValidator.nif('61547582L'), true);
    });
  });
  group('nie -', () {
    test('will be false when call with empty value', () {
      expect(documentValidator.nie(''), false);
    });
    test('will be false when call with invalid value', () {
      expect(documentValidator.nie('123456789'), false);
      expect(documentValidator.nie('ASDFHJKLÑ'), false);
      expect(documentValidator.nie('1SDGHJKL1'), false);
      expect(documentValidator.nie('ZXCVBNMASF'), false);
    });
    test('will be true when call with valid nie', () {
      expect(documentValidator.nie('X4798250J'), true);
      expect(documentValidator.nie('Z3058671K'), true);
      expect(documentValidator.nie('Y2824087T'), true);
      expect(documentValidator.nie('Z8031003Y'), true);
      expect(documentValidator.nie('X5207833N'), true);
      expect(documentValidator.nie('X6979561G'), true);
      expect(documentValidator.nie('Y2769613J'), true);
      expect(documentValidator.nie('X7510219Y'), true);
    });
  });
  group('cif -', () {
    test('will be false when call with empty value', () {
      expect(documentValidator.cif(''), false);
    });
    test('will be false when call with invalid value', () {
      expect(documentValidator.cif('123456789'), false);
      expect(documentValidator.cif('ASFGHJKLÑ'), false);
      expect(documentValidator.cif('1SFGHJKL1'), false);
      expect(documentValidator.cif('ZXCVBNMASF'), false);
    });
    test('will be true when call with valid cif', () {
      expect(documentValidator.cif('E81208662'), true);
      expect(documentValidator.cif('R2318939B'), true);
      expect(documentValidator.cif('A45358959'), true);
      expect(documentValidator.cif('B40432692'), true);
      expect(documentValidator.cif('R9281313H'), true);
      expect(documentValidator.cif('J51275691'), true);
      expect(documentValidator.cif('V28692408'), true);
      expect(documentValidator.cif('A08283020'), true);
    });
  });
}
