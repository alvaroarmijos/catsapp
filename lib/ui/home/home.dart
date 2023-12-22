import 'package:flutter/material.dart';

import '../random_cat/pages/random_cat_page.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cats App',
            // 2
            style: Theme.of(context).textTheme.titleLarge),
      ),
      body: const RandomCatPage(),
    );
  }
}
