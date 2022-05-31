import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mrmilu/flutter_mrmilu.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Mr Milú Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Demo')),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Helpers',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              Text('Locale: ${Helpers.getLocale()}'),
              Text(
                'String extensions',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              Text(
                'sentence case text. try transform this'.toSentenceCase(),
              ),
              Text(
                'first letter case text. try transform this'
                    .toFirstLetterCase(),
              ),
              Text(
                'concatenate'.concatenate(['text.', 'try transform this']),
              ),
              Text(
                'Int extensions',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              Text((10).toMoney()),
              Text(
                'Date extensions',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              Text(
                  'Is same day: ${DateTime.now().isSameDay(DateTime.now()).toString()}'),
              Text(
                  'Is after or equal day: ${DateTime.now().isAfterOrEqualTo(DateTime.now()).toString()}'),
              Text(
                  'Is befor or equal day: ${DateTime.now().isBeforeOrEqualTo(DateTime.now()).toString()}'),
              Text(
                'Is between days: ${DateTime.now().isBetween(DateTime.now(), DateTime.now().add(const Duration(days: 1))).toString()}',
              ),
              Text(
                'Date validators',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              Text(
                'Is legal adult: ${DateValidators.isLegalAdult(DateTime.now().subtract(const Duration(days: 365))).toString()}',
              ),
              Text(
                'Is future: ${DateValidators.isFuture(DateTime.now().subtract(const Duration(days: 365))).toString()}',
              ),
              Text(
                'Document validators',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              Text(
                'Values from https://testingdatagenerator.com/doi.html',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              Text(
                'Is valid NIF: ${DocumentValidators().nif('76345665V').toString()}',
              ),
              Text(
                'Is valid NIE: ${DocumentValidators().nif('Y2020801N').toString()}',
              ),
              Text(
                'Is valid CIF: ${DocumentValidators().cif('A46335352').toString()}',
              ),
              Text(
                'Password validators',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              Text(
                'Has uppercase letters: ${PasswordValidators.hasUppercase('AAAAA').toString()}',
              ),
              Text(
                'Has lowercase letters: ${PasswordValidators.hasLowercase('aAAAA').toString()}',
              ),
              Text(
                'Has numbers: ${PasswordValidators.hasNumber('A1AAAA').toString()}',
              ),
              Text(
                'Has special characters: ${PasswordValidators.hasSpecialCharacter('%AAAAA').toString()}',
              ),
              Text(
                'Has min length: ${PasswordValidators.hasMinLength('AAAAAAAA').toString()}',
              ),
              Text(
                'Password validators',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              Text(
                'Is valid Social security number: ${SocialSecurityNumberValidators.spanishSSN('518316760152').toString()}',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
