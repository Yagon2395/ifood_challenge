import 'package:flutter_test/flutter_test.dart';
import 'package:ifood_challenge/src/modules/search/presentation/cubit/search_cubit.dart';

import '../../mocks/search_movies_response_mock.dart';

void main() {
  group('operator == from [Equatable]', () {
    test('entities should be different', () {
      const someState = SearchState(
        locale: 'pt-BR',
        keyword: 'dumb keyword',
      );
      expect(SearchState.initial(), isNot(someState));
    });

    test('entities should be equal', () {
      final someState = SearchState.initial();
      final anotherState = SearchState.initial();
      expect(someState, anotherState);
    });
  });

  group('copyWith', () {
    final SearchState tSearchState = SearchState.initial();
    test(
        'copyWith without any arguments should not modify any property of state',
        () {
      final newState = tSearchState.copyWith();
      expect(newState, tSearchState);
    });

    test('copyWith should work for all properties of state', () {
      final newState = tSearchState.copyWith(
        keyword: 'dumb keyword',
        locale: 'pt',
        searchMoviesStatus: SearchMoviesStatus.error,
        searchMoviesResult: tSearchMoviesResultEntity,
      );

      expect(newState, isNot(tSearchState));
    });
  });
}
