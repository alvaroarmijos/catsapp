import 'package:catsapp/ui/random_cat/random_cat.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Random cat state', () {
    test('supports value comparisons', () {
      expect(const RandomCatState(), const RandomCatState());
    });

    test('returns same object when no properties are passed', () {
      expect(const RandomCatState().copyWith(), const RandomCatState());
    });

    test('returns object with updated status when status is passed', () {
      expect(
        const RandomCatState().copyWith(status: RandomCatStatus.failure),
        const RandomCatState(status: RandomCatStatus.failure),
      );
    });

    test('returns object with updated status when cat is passed', () {
      expect(
        const RandomCatState().copyWith(cat: Cat.empty),
        const RandomCatState(cat: Cat.empty),
      );
    });
  });

  group('RandomCatStatusX ', () {
    test('returns correct values for RandomCatStatus.initial', () {
      const status = RandomCatStatus.initial;
      expect(status.isInitial, isTrue);
      expect(status.isLoading, isFalse);
      expect(status.isSuccess, isFalse);
      expect(status.isFailure, isFalse);
      expect(status.isEmptyBreeds, isFalse);
    });

    test('returns correct values for RandomCatStatus.loading', () {
      const status = RandomCatStatus.loading;
      expect(status.isInitial, isFalse);
      expect(status.isLoading, isTrue);
      expect(status.isSuccess, isFalse);
      expect(status.isFailure, isFalse);
      expect(status.isEmptyBreeds, isFalse);
    });

    test('returns correct values for RandomCatStatus.isSuccess', () {
      const status = RandomCatStatus.success;
      expect(status.isInitial, isFalse);
      expect(status.isLoading, isFalse);
      expect(status.isSuccess, isTrue);
      expect(status.isFailure, isFalse);
      expect(status.isEmptyBreeds, isFalse);
    });

    test('returns correct values for RandomCatStatus.isFailure', () {
      const status = RandomCatStatus.failure;
      expect(status.isInitial, isFalse);
      expect(status.isLoading, isFalse);
      expect(status.isSuccess, isFalse);
      expect(status.isFailure, isTrue);
      expect(status.isEmptyBreeds, isFalse);
    });

    test('returns correct values for RandomCatStatus.isEmptyBreeds', () {
      const status = RandomCatStatus.emptyBreeds;
      expect(status.isInitial, isFalse);
      expect(status.isLoading, isFalse);
      expect(status.isSuccess, isFalse);
      expect(status.isFailure, isFalse);
      expect(status.isEmptyBreeds, isTrue);
    });
  });
}
