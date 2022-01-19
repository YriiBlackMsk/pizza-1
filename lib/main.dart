import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  get onValueChanged => null;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    const headerTextStyle = TextStyle(
        fontSize: 30,
        fontFamily: 'Inter',
        fontFamilyFallback: <String>['Arial'],
        fontStyle: FontStyle.normal,
        color: Color(0xFF000000)
    );
    const descriptionTextStyle = TextStyle(
        fontSize: 16,
        fontFamily: 'Inter',
        fontFamilyFallback: <String>['Arial'],
        fontStyle: FontStyle.normal,
        color: Color(0xFF000000)
    );
    Map<int, Widget> segControlWidgets = const <int, Widget>{
      0: Text('Обычное тесто'),
      1: Text('Тонкое тесто'),
    };
    return MaterialApp(
      title: 'Калькулятор пиццы',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: Container(
          width: double.infinity,
          child: Column(children: [
            Container(
              alignment: Alignment.centerRight,
              child: SizedBox(width: 232, height: 123, child: Image.asset('assets/images/pizza.png'),),
            ),
            SizedBox(height: 33,),
            Text('Калькулятор пиццы', style: headerTextStyle),
            SizedBox(height: 9,),
            Text('Выберите параметры:', style: descriptionTextStyle),
            SizedBox(height: 33,),

          ],
          ),
        ),
      ),
    );
  }
}
