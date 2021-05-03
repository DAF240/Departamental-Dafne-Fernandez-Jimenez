import 'package:flutter/material.dart';
import 'package:primer_departamental_primer_parcial/icono.dart';
import 'package:primer_departamental_primer_parcial/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'examen',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("examen"),
      ),
      body: _lista(context),
    );
  }
}
Widget _lista(BuildContext context) {
    return FutureBuilder(
      future: menuProvider.cargarData(),
      initialData: [],
      builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
        return ListView(  children: _listItems(snapshot.data, context),
          
        );
      },
    );
  }
  List<Widget> _listItems(List<dynamic> data, BuildContext context) {
    final List<Widget> opciones = [];

    data.forEach((opt) {
      final widgetTemp = ListTile(
        title: Text(opt['texto']),
        leading: getIcon(opt['icon']),
        trailing: Icon(Icons.keyboard_arrow_right_outlined),
        onTap: () {},
      );
      opciones..add(widgetTemp)..add(Divider());
    });
    return opciones;
  }

 
       
  


