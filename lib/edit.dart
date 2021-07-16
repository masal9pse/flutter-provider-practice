import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_provider/result_provider.dart';
// 遷移先ページ
class EditPage extends StatelessWidget {
  final receive;
  const EditPage({Key? key, this.receive}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ResultProvider>(
      builder: (context, model, child) {
        return WillPopScope(
          onWillPop: () {
            model.updateText('Thank you! from 戻るアイコン'); // ResultProviderのメソッド
            Navigator.pop(context);
            return Future.value(false);
          },
          child: Scaffold(
            appBar: AppBar(
              title: Text('Edit Page（遷移先）'),
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    model._result,
                    style: Theme.of(context).textTheme.headline5,
                  ),
                  RaisedButton(
                      child: Text('Return'),
                      onPressed: () {
                        model.updateText(
                            'Thank you! from 戻るボタン'); // ResultProviderのメソッド
                        Navigator.pop(context);
                      }),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}