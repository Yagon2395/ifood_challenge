import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ifood_challenge/src/modules/core/domain/usecases/locale_usecase.dart';

void main() {
  late LocaleUsecase usecase;

  setUp(() {
    usecase = LocaleUsecase();
  });
  test('should convert [pt] locale correctly', () async {
    final result = await usecase.call(params: 'pt');
    expect(result, const Right('pt-BR'));
  });

  test('should convert [en] locale correctly', () async {
    final result = await usecase.call(params: 'en');
    expect(result, const Right('en-US'));
  });
}
