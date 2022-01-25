import 'package:flutter/material.dart';
import 'package:sliding_switch/sliding_switch.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

enum SauceName {hot, sweet, cheesy}

class _MyAppState extends State<MyApp>{
  bool _thin = false;
  double _size = 40;
  int _cost = 290;
  SauceName? _sauceName = SauceName.hot;
  bool _cheese = false;
  Color _bgColor = const Color.fromRGBO(200, 200, 200, 0.75);

  void _slideThin(bool val){
    setState(() {
      _thin = val;
      _calculate();
    });
  }

  void _onSizeChange(dynamic val){
    setState(() {
      _size = val;
      _calculate();
    });
  }


  void _onCheeseClick(bool? val){
    setState(() {
      _cheese = !_cheese;
      _calculate();
    });
  }

  void _onSauceClick(SauceName? val)
  {
    setState(() {
      _sauceName = val;
      _calculate();
    });
  }

  void _calculate()
  {
    _cost = 200 + (_size*2).round() + (_thin ? 1 : 0)*30 + (_cheese ? 1 : 0)*40;
    switch (_sauceName)
    {
      case SauceName.hot:
        _cost += 10;
        break;
      case SauceName.sweet:
        _cost += 20;
        break;
      case SauceName.cheesy:
        _cost += 40;
        break;
      default:
        _cost += 10;
    }
  }
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    const headerTextStyle = TextStyle(
        fontSize: 48,
        fontFamily: 'Amatic',
        color: Colors.brown
    );
    const descriptionTextStyle = TextStyle(
        fontSize: 26,
        fontFamily: 'Yanone',
        color: Colors.brown
    );
    const elementTextStyle = TextStyle(
        fontSize: 22,
        fontFamily: 'Yanone',
        color: Colors.black
    );
    return MaterialApp(
      title: 'Калькулятор пиццы',
      theme: ThemeData(
        primarySwatch: Colors.brown,
        fontFamily: 'Yanone',
      ),
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/bg.jpg'),
                repeat: ImageRepeat.repeat,
              )
          ),
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(children: [
              Container(
                alignment: Alignment.centerRight,
                child: SizedBox(width: 232, height: 123, child: Image.asset('assets/images/pizza.png'),),
              ),
              const SizedBox(height: 20,),
              const Text('Калькулятор пиццы', style: headerTextStyle),
              const SizedBox(height: 9,),
              const Text('Выберите параметры:', style: descriptionTextStyle),
              const SizedBox(height: 9,),
              SlidingSwitch(

                value: false,
                onChanged: _slideThin,
                onSwipe: () {},
                onDoubleTap: () {},
                onTap: () {},
                textOff: "Обычное тесто",
                textOn: "Тонкое тесто",
                width: 300,
                colorOn: Colors.brown,
                colorOff: Colors.brown,
                buttonColor: Color.fromRGBO(206, 188, 160, 1),
                inactiveColor: Color.fromRGBO(130, 130, 130, 1),
                background: _bgColor,

              ),
              const SizedBox(height: 20,),
              Container(
                  alignment: Alignment.centerLeft,
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  child: const Text('Размер:', style: descriptionTextStyle)),
              const SizedBox(height: 9,),
              SizedBox(
                width: 300,
                child: SfSlider(
                  value: _size,
                  min: 20,
                  max: 60,
                  interval: 20,
                  showTicks: true,
                  showLabels: true,
//                    numberFormat: NumberFormat("## см"),
                  enableTooltip: false,
                  minorTicksPerInterval: 0,
                  stepSize: 20,
                  onChanged: _onSizeChange,

                ),
              ),
              const SizedBox(height: 9,),
              Container(
                  alignment: Alignment.centerLeft,
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  child: const Text('Соус:', style: descriptionTextStyle)),
              RadioListTile<SauceName>(
                  title: const Text('Острый', style: elementTextStyle),
                  value: SauceName.hot,
                  groupValue: _sauceName,
                  onChanged: _onSauceClick
              ),
              RadioListTile<SauceName>(
                  title: const Text('Кисло-сладкий', style: elementTextStyle),
                  value: SauceName.sweet,
                  groupValue: _sauceName,
                  onChanged: _onSauceClick
              ),
              RadioListTile<SauceName>(
                  title: const Text('Сырный', style: elementTextStyle),
                  value: SauceName.cheesy,
                  groupValue: _sauceName,
                  onChanged: _onSauceClick
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical:10, horizontal: 10),
                padding: const EdgeInsets.symmetric(vertical:10, horizontal: 10),
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(200, 200, 200, 0.75),
                  borderRadius: BorderRadius.circular(10),

                ),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                          flex: 1,
                          child: Image.asset('assets/images/cheese.png', scale: 10,)),
                      Expanded(
                          flex: 3,
                          child: Container(
                              alignment: Alignment.center,
                              child: const Text('Больше сыра!', style: descriptionTextStyle)
                          )
                      ),
                      Expanded(
                        flex: 1,
                        child: Switch(
                            value: _cheese,
                            onChanged: _onCheeseClick
                        ),
                      ),
                    ]),
              ),
              const SizedBox(height: 20,),
              Container(
                  alignment: Alignment.centerLeft,
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  child: const Text('Стоимость:', style: descriptionTextStyle)),
              Container(
                margin: const EdgeInsets.symmetric(vertical:10, horizontal: 10),
                padding: const EdgeInsets.symmetric(vertical:10, horizontal: 10),
                decoration: BoxDecoration(
                  color: _bgColor,
                  borderRadius: BorderRadius.circular(10),

                ),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                          flex: 3,
                          child: Container(
                              alignment: Alignment.center,
                              child: Text('$_cost руб.', style: descriptionTextStyle)
                          )
                      ),
                    ]),
              ),
              const SizedBox(height: 20,),
              SizedBox(width: 154, height: 60,
                child: ElevatedButton(onPressed: () {}, child: Text('Заказать', style: descriptionTextStyle),
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromRGBO(206, 188, 160, 1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(36.0),
                      ),
                    )),
              ),
              const SizedBox(height: 20,),
            ],
            ),
          ),
        ),
      ),
    );
  }
}
