import 'package:bloc_test/bloc_test.dart';
import 'package:catsapp/ui/random_cat/random_cat.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:network_image_mock/network_image_mock.dart';

class MockRandomCatBloc extends MockBloc<RandomCatEvent, RandomCatState>
    implements RandomCatBloc {}

class FakeRandomCatState extends Fake implements RandomCatState {}

class FakeRandomCatEvent extends Fake implements RandomCatEvent {}

void main() {
  late MockRandomCatBloc blocCat;
  const mockCat = Cat.empty;
  setUpAll(() {
    registerFallbackValue(RandomCatEvent());
    registerFallbackValue(FakeRandomCatState());
  });

  setUp(() {
    blocCat = MockRandomCatBloc();
  });

  group('Success random cat view ', () {
    testWidgets('renders RandomCatPage', (tester) async {
      await mockNetworkImagesFor(
        () => tester.pumpWidget(
          const MaterialApp(
            home: SuccessRandomCatView(
              cat: mockCat,
            ),
          ),
        ),
      );
      expect(find.byType(CatCard), findsOneWidget);
      expect(find.byType(FloatingActionButton), findsOneWidget);
    });
  });

  group('Fab', () {
    testWidgets('renders RandomCatPage', (tester) async {
      await mockNetworkImagesFor(
        () => tester.pumpWidget(
          BlocProvider<RandomCatBloc>(
            lazy: false,
            create: (_) => blocCat,
            child: const MaterialApp(
              home: SuccessRandomCatView(
                cat: mockCat,
              ),
            ),
          ),
        ),
      );

      final fabFinder = find.byType(FloatingActionButton);
      await tester.tap(fabFinder);
      await tester.pumpAndSettle(const Duration(seconds: 1));

      expect(find.byType(CatCard), findsOneWidget);
      expect(find.byType(FloatingActionButton), findsOneWidget);
      verify(() => blocCat.add(SearchRandomCat())).called(1);
    });
  });
}
