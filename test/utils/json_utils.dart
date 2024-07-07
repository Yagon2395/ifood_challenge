import 'dart:io';

String jsonReader(String path) => File(path).readAsStringSync();

extension ExtendedString on String {
  clearEncodedJson() => replaceAll(' ', '')
      .replaceAll('\n', '')
      .replaceAll(r'\', '')
      .replaceAll(r'"{', '{')
      .replaceAll(r'}"', '}')
      .replaceAll('\r', '');
}
