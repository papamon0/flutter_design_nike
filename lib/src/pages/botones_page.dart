import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class BotonesPage extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          _fondoApp(),

          SingleChildScrollView(
            child: Column(
              children: <Widget>[
                _titulos(),
                _botonesRedondeados()
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: _bottomNavitionBar()
    );
  }

  Widget _fondoApp() {

    final gradiente = Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [ 
            Color.fromRGBO(52, 54, 101, 1.0), 
            Color.fromRGBO(35, 37, 57, 1.0)
          ],
          begin: FractionalOffset(0.0, 0.6),
          end:   FractionalOffset(0.0, 1.0)
        )
      ),
    );

    final cajaRosa = Transform.rotate(
      angle: -pi /5.0,
      child: Container(
        height: 360.0,
        width: 360.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(80.0),
          gradient: LinearGradient(
            colors: [
              Color.fromRGBO(236, 98, 188, 1.0),
              Color.fromRGBO(241, 142, 172, 1.0)
            ]
          )
        )
      )
    );

    return Stack(
      children: <Widget>[
        gradiente,
        Positioned(
          top: -100.0,
          child: cajaRosa
        )
      ],
    );

  }

  Widget _titulos() {

    
    return SafeArea(
      child: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Classify transaction',
              style: TextStyle( fontSize: 30.0, color:Colors.white , fontWeight: FontWeight.bold )
            ),
            SizedBox( height:  10.0,),
            Text('Classify this transaction into a particular category',
            style: TextStyle( fontSize: 18.0, color:Colors.white , fontWeight: FontWeight.bold ),
            )
          ],
        ),
      ),
    );

  }

  Widget _bottomNavitionBar(){

    return BottomNavigationBar(
        selectedItemColor: Colors.pinkAccent,
        unselectedItemColor: Color.fromRGBO(116, 117, 152, 1.0),
        backgroundColor: Color.fromRGBO(55, 57, 84, 1.0),
        items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.calendar_today, size: 30.0 ),
              title: Container()
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.bubble_chart , size: 30.0 ),
              title: Container()
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.supervised_user_circle , size: 30.0 ),
              title: Container()
            )
        ]
      );
  }

  Widget _botonesRedondeados() {

    return Table(
      children: [
        TableRow(
          children: [
            _crearBotonRedondeado( Colors.blue, Icons.border_all, 'General' ),
            _crearBotonRedondeado( Colors.pinkAccent, Icons.shop, 'Buy' ),
          ]
        ),
        TableRow(
          children: [
            _crearBotonRedondeado( Colors.orange, Icons.insert_drive_file, 'File' ),
            _crearBotonRedondeado( Colors.blueAccent, Icons.movie_filter, 'Entertaiment' ),
          ]
        ),
        TableRow(
          children: [
            _crearBotonRedondeado( Colors.red, Icons.collections, 'Photos' ),
            _crearBotonRedondeado( Colors.teal, Icons.help_outline, 'Help' ),
          ]
        ),
        TableRow(
          children: [
            _crearBotonRedondeado( Colors.pink, Icons.av_timer, 'Timer' ),
            _crearBotonRedondeado( Colors.purple, Icons.call, 'Call' ),
          ]
        ),
      ],
    );

  }

  Widget _crearBotonRedondeado( Color color, IconData icon, String texto  ) {

    return ClipRect(
      //child: BackdropFilter(
        //filter: ImageFilter.blur( sigmaX: 3.0, sigmaY: 3.0 ),
        child: Container(
          height: 180.0,
          margin: EdgeInsets.all(15.0),
          decoration: BoxDecoration(
            color: Color.fromRGBO(62, 66, 107, 0.7),
            borderRadius: BorderRadius.circular(20.0)
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                child: CircleAvatar(                                  
                  backgroundColor: color,
                  radius: 35.0,
                  child: Icon( icon , size: 35.0, color: Colors.white ),
                ),
              ),
              SizedBox( height: 20.0),
              Text( texto , style: TextStyle( color: color , fontSize: 16.0))
            ],
          ),
        ),
      //),
    );
  }
}