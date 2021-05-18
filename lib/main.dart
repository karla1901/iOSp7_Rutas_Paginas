import 'package:flutter/material.dart';
import 'package:casta/rutas.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
         theme: ThemeData(primarySwatch: Colors.brown),
      title: 'Ruteo',
      initialRoute: "/",
      home: PageOne(),
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  } //fin de widget
} //fin de MyApp

class PageOne extends StatelessWidget {
  String _params = "Hola desde p1";
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  PageOne({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // key al a scaffold para acceder al scaffold desde otro widget hijo
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('Página 1 Karla Castañeda'),
      ),
      body: Center(
        child: Container(
          child: MaterialButton(
            child: Text(
              "Siguiente página",
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            color: Colors.brown[200],
            onPressed: () {
              _openSecondPage(context);
            },
          ),
        ),
      ),
    );
  }

  void _openSecondPage(BuildContext context) async {
    String _datoRetornadoDeSecondPage;
    // await para esperar que se regrese dato desde la pantalla que se abre
    await Navigator.of(context)
        .pushNamed(
      "/secondPage",
      arguments: _params,
    )
        .then(
      (response) {
        _datoRetornadoDeSecondPage = response;
      },
    );
    // acceso al scaffold para mostrar snackbar
    _scaffoldKey.currentState.showSnackBar(
      SnackBar(
        content: Text(
          "Texto regresado: $_datoRetornadoDeSecondPage",
        ),
      ),
    );
  }
}
