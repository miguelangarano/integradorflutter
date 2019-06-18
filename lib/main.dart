import 'package:flutter/material.dart';
import './row_widget.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      showPerformanceOverlay: true,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = -1;
  double time = 0.0;

  void _setCounter(val) {
    setState(() {
      _counter=val;
    });
  }

  void _setTime(val){
    setState(() {
      time = val;
    });
  }

  double calculatePi(){
    int d=1, sig=1;
    double t, s=0;
    int n=1000000;

    Stopwatch stpw = new Stopwatch();
    stpw.start();
    for(int i=1; i<=n; i++){
      t=(1/d*sig).toDouble();
      s+=t;
      d+=2;
      sig*=-1;
      print("time: "+stpw.elapsedMilliseconds.toString());
    }
    _setTime(stpw.elapsedMilliseconds.toDouble());
    return s*4;
  }



  MediaQueryData _queryData;

  double widthToPercent(double value) {
    double ret = (value * _queryData.size.width) / 100;
    return ret;
  }

  double heightToPercent(double value) {
    double ret = (value * _queryData.size.height) / 100;
    return ret;
  }

  @override
  Widget build(BuildContext context) {
    _queryData = MediaQuery.of(context);
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            Container(
              height: heightToPercent(70),
              child: ListaLarga(),
            ),
            Container(
              height: heightToPercent(30),
              child: Row(
                children: <Widget>[
                  GestureDetector(
                    onTap: ()=>_setCounter(-1),
                    child: Text("Time: "+time.toString()),
                  ),
                  GestureDetector(
                    onTap: ()=>_setCounter(0),
                    child: Container(
                      width: 80,
                      height: 30,
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(242, 153, 74, 1), //new Color.fromRGBO(255, 0, 0, 0.0),
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black,
                                offset: new Offset(0.0, 3.0),
                                blurRadius: 10
                            )
                          ]
                      ),
                      child: Center(
                        child: Text("Lista", style: TextStyle(fontSize: 14, color: Colors.white),),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: ()=>_setCounter(1),
                    child: Container(
                      width: 80,
                      height: 30,
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(242, 153, 74, 1), //new Color.fromRGBO(255, 0, 0, 0.0),
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black,
                                offset: new Offset(0.0, 3.0),
                                blurRadius: 10
                            )
                          ]
                      ),
                      child: Center(
                        child: Text("Pi", style: TextStyle(fontSize: 14, color: Colors.white),),
                      ),
                    ),
                  )
                ],

              ),
            )
          ],
        )
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Widget ListaLarga(){
    if(_counter==0){
      return Container(
          child: ListView(
              children: lista()
          )
      );
    }else if(_counter==1){
      return Container(
        margin: EdgeInsets.only(top: heightToPercent(50)),
        child: Text(calculatePi().toString()),
      );
    }else{
      return Container(
        child: null,
      );
    }
  }

  List<Widget> lista(){
    List<Widget> lista = new List();
    Stopwatch stpw = new Stopwatch();
    stpw.start();
    for(int i=0; i<100000; i++){
      print("index: "+i.toString());
      print("time: "+stpw.elapsedMilliseconds.toString());
      lista.add(RowWidget(i));
    }
    _setTime(stpw.elapsedMilliseconds.toDouble());
    stpw.stop();
    return lista;
  }
}
