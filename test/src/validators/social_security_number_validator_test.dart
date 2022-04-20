import 'package:flutter_mrmilu/flutter_mrmilu.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('spanishSSN -', () {
    test('will be false when call with invalid value', () {
      expect(SocialSecurityNumberValidators.spanishSSN(''), false);
      expect(SocialSecurityNumberValidators.spanishSSN('adasda'), false);
      expect(SocialSecurityNumberValidators.spanishSSN('AJJLMKMCA'), false);
      expect(SocialSecurityNumberValidators.spanishSSN(',.,^´´?'), false);
      expect(SocialSecurityNumberValidators.spanishSSN('0'), false);
      expect(SocialSecurityNumberValidators.spanishSSN('00000000000'), false);
      expect(SocialSecurityNumberValidators.spanishSSN('0000000000000'), false);
      expect(SocialSecurityNumberValidators.spanishSSN('229252558841'), false);
      expect(SocialSecurityNumberValidators.spanishSSN('229212558840'), false);
    });
    test('will be true when call with valid social security number', () {
      expect(SocialSecurityNumberValidators.spanishSSN('229252558840'), true);
      expect(SocialSecurityNumberValidators.spanishSSN('094452038958'), true);
      expect(SocialSecurityNumberValidators.spanishSSN('248951296915'), true);
      expect(SocialSecurityNumberValidators.spanishSSN('170369781007'), true);
      expect(SocialSecurityNumberValidators.spanishSSN('475855325303'), true);
      expect(SocialSecurityNumberValidators.spanishSSN('485713021233'), true);
      expect(SocialSecurityNumberValidators.spanishSSN('485149305834'), true);
      expect(SocialSecurityNumberValidators.spanishSSN('148866680646'), true);
    });
  });
}
