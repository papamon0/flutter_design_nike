import 'package:disenos/src/providers/productos_provider.dart';
import 'package:disenos/src/widgets/card_swiper.dart';
import 'package:flutter/material.dart';

class NikePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(        
        body: Stack(
          children: <Widget>[
            _fondoNike(),
            _crearWidgets()
          ],
        )
    );
  }

 Widget _fondoNike() {
    
   return Container(
     color: Color.fromRGBO(29, 31, 33, 1.0),
   );

 }

  Widget _crearWidgets() {

    return Column(        
      children: <Widget>[
        _crearRowIconos(),        
        _crearTabs(),
        SizedBox( height: 50.0),
        _crearSwiper(),
        Expanded(child: Container()),
        _crearButtonBar()
      ],
    );

  }

  Widget _crearRowIconos() {
    
    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric( horizontal: 30.0, ),
        child: Row(
          children: <Widget>[            
               Expanded(                 
                 child: Container(
                   alignment: Alignment.centerLeft,
                   child: Image(
                      image: AssetImage('assets/logo_nike.png'),
                      height: 30.0,              
                   ),
                 ),
               ),
               IconButton(icon: Icon( Icons.menu, color:Colors.white , size: 30.0,), onPressed: (){}),
               SizedBox(width: 10.0),
               IconButton(icon: Icon( Icons.shopping_cart, color: Colors.white, size: 30.0,), onPressed: (){})
             
          ],
        ),
      ),
    );
  }

  Widget _crearTabs() {

  final styleNoSelected = TextStyle( color : Colors.white , fontSize: 30.0 , fontFamily: 'Teko'  );
  final styleSelected = TextStyle( color : Colors.yellowAccent[700], fontSize: 30.0 , fontFamily: 'Teko' );

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Text('Basketball' , style: styleNoSelected ),      
        Text('Running' ,    style: styleSelected ),
        Text('Training',     style: styleNoSelected ),
      ],
    );

  }

  Widget _crearSwiper() {

      ProductorProvider provider = ProductorProvider();

      return CardSwiper( productos: provider.getProductos() );

  }

  Widget _crearButtonBar() {
    return ClipRRect(                         
        borderRadius: BorderRadius.circular( 40.0 ),
        child:Container(
          padding: EdgeInsets.symmetric(horizontal: 40.0),
          height: 100.0,
          color: Colors.yellowAccent[700],        
          child: Row(       
            mainAxisAlignment: MainAxisAlignment.spaceBetween,         
            children: <Widget>[
              Icon( Icons.home, size: 30.0, ),
              _crearBotonRedondeado( Color.fromRGBO(29, 31, 33, 1.0) ,Colors.yellowAccent[700], Icons.adjust , ''),
              Icon( Icons.person_outline, size: 30.0, )
            ],
          )      
        )  
     );
  }


  Widget _crearBotonRedondeado( Color color, Color coloricon,  IconData icon, String texto  ) {

    return Container(
          child: CircleAvatar(                                  
            backgroundColor: color,
            radius: 30.0,
            child: Icon( icon , size: 35.0, color: coloricon ),
          ),
        );
  }
}