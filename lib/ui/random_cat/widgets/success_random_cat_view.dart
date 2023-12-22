import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../utils/const_keys_app.dart';
import '../random_cat.dart';

class SuccessRandomCatView extends StatelessWidget {
  const SuccessRandomCatView({
    Key? key,
    required this.cat,
  }) : super(key: key);

  final Cat cat;
  @override
  Widget build(BuildContext context) {
    return Column(
      key: const Key(ConstWidgetKeysApp.RandomCatSuccess),
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 28.0),
          child: CatCard(
            key: const Key(ConstWidgetKeysApp.RandomCatCardKey),
            cat: cat,
          ),
        ),
        const Spacer(),
        Padding(
          padding: const EdgeInsets.only(right: 18.0, bottom: 8.0),
          child: Align(
            alignment: Alignment.bottomRight,
            child: FloatingActionButton(
              key: const Key(ConstWidgetKeysApp.RandomCatFabButtonKey),
              onPressed: () {
                context.read<RandomCatBloc>().add(SearchRandomCat());
              },
              child: const Icon(Icons.refresh),
            ),
          ),
        ),
      ],
    );
  }
}
