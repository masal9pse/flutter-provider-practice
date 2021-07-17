import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;

  MyHomePage({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<CountData>(
          create: (context) => CountData(),
        ),
        ChangeNotifierProvider<CountData2>(
          create: (context) => CountData2(),
        ),
        ChangeNotifierProvider<ChangeForm>(
          create: (context) => ChangeForm(),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: Text(this.title),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'ボタンを押した回数:です',
              ),
              Text(
                // '$model',
                'aaaaa',
                style: Theme.of(context).textTheme.headline4,
              ),
              Consumer<ChangeForm>(builder: (context, model, child) {
                return Column(
                  children: <Widget>[
                    Center(
                      child: new Icon(
                        Icons.thumb_up,
                        color: model._active
                            ? Colors.orange[700]
                            : Colors.grey[500],
                        size: 100.0,
                      ),
                    ),
                    Switch(
                      value: model._active,
                      activeColor: Colors.orange,
                      activeTrackColor: Colors.red,
                      inactiveThumbColor: Colors.blue,
                      inactiveTrackColor: Colors.green,
                      onChanged: model._changeSwitch,
                    ),
                  ],
                );
              }),
              Consumer<CountData2>(builder: (context, model, child) {
                return FloatingActionButton(
                  // onPressed: _incrementCounter,
                  onPressed: () {
                    model.increment();
                  },
                  tooltip: 'Increment',
                  // child: const Icon(Icons.add),
                  child: Text(model.count.toString()),
                );
              }),
            ],
          ),
        ),
        floatingActionButton:
            Consumer<CountData>(builder: (context, model, child) {
          return FloatingActionButton(
            // onPressed: _incrementCounter,
            onPressed: () {
              model.increment();
            },
            tooltip: 'Increment',
            // child: const Icon(Icons.add),
            child: Text(model.count.toString()),
          );
        }),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

// ChangeNotifierを継承すると変更可能なデータを渡せる
class CountData extends ChangeNotifier {
  int count = 0;

  void increment() {
    count = count + 1;
    // 値が変更したことを知らせる
    //  >> UIを再構築する
    notifyListeners();
  }
}

class CountData2 extends ChangeNotifier {
  int count = 10;

  void increment() {
    count = count + 1;
    // 値が変更したことを知らせる
    //  >> UIを再構築する
    notifyListeners();
  }
}

class ChangeForm extends ChangeNotifier {
  bool _active = false;

  // void _changeSwitch(bool e) => setState(() => _active = e);
  void _changeSwitch(bool e) {
    _active = e;
    notifyListeners();
  }
}
