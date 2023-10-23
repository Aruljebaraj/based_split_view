import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:based_split_view/based_split_view.dart';

final navigatorKey = GlobalKey<NavigatorState>();

void main() => runApp(const ExampleApp());

class ExampleApp extends StatelessWidget {
  const ExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BasedSplitView',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
        ),
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          brightness: Brightness.dark,
          seedColor: Colors.deepPurple,
        ),
        useMaterial3: true,
      ),
      home: Scaffold(
        body: BasedSplitView(
          navigatorKey: navigatorKey,
          leftWidget: const LeftWidget(),
        ),
      ),
    );
  }
}

class LeftWidget extends StatelessWidget {
  const LeftWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Wrap(
        alignment: WrapAlignment.center,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          TextButton(
            onPressed: () {
              navigatorKey.currentState?.push(
                CupertinoPageRoute(builder: (context) => const NextPage()),
              );
            },
            child: const Text('Use GlobalKey to Push page'),
          ),
          TextButton(
            onPressed: () {
              navigatorKey.currentState?.pop();
            },
            child: const Text('Use GlobalKey to Pop page'),
          ),
          const NextPageButton(),
        ],
      ),
    );
  }
}

class NextPage extends StatelessWidget {
  const NextPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(), body: const NextPageButton());
  }
}

class NextPageButton extends StatelessWidget {
  const NextPageButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton(
        onPressed: () => Navigator.push(
          context,
          CupertinoPageRoute(builder: (context) => const NextPage()),
        ),
        child: const Text('Use Navigator to Push page'),
      ),
    );
  }
}
