import 'package:flutter/material.dart';

void main() => runApp(const AppBarApp());

class AppBarApp extends StatelessWidget {
  const AppBarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AppBarExample(),
    );
  }
}

class AppBarExample extends StatelessWidget {
  const AppBarExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chatchai Naktae'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add_alert),
            tooltip: 'Show Snackbar',
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('This is a snackbar')),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.navigate_next),
            tooltip: 'Go to the next page',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute<void>(
                  builder: (BuildContext context) {
                    return Scaffold(
                      appBar: AppBar(title: const Text('Next page')),
                      body: const Center(
                        child: Text(
                          'This is the next page',
                          style: TextStyle(fontSize: 24),
                        ),
                      ),
                    );
                  },
                ),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              constraints: BoxConstraints.expand(
                height: Theme.of(context).textTheme.headlineMedium!.fontSize! * 1.1 + 100.0,
              ),
              padding: const EdgeInsets.all(8.0),
              color: Colors.orange[900],
              alignment: Alignment.topRight,
              transform: Matrix4.rotationZ(-0.05),
              child: Text(
                'Hello World',
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium!
                    .copyWith(
                      color: Colors.white,
                    ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Deliver features faster Deliver features faster Deliver features faster Deliver features faster',
              maxLines: 2,
              style: TextStyle(
                color: Colors.red,
                fontSize: 24,
              ),
            ),
            const Text(
              'Craft beautiful UIs',
              textAlign: TextAlign.right,
            ),
            const SizedBox(
              height: 200,
              child: FittedBox(
                child: FlutterLogo(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}