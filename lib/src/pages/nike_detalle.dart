
import 'package:disenos/src/model/productos.dart';
import 'package:flutter/material.dart';

class NikeDetalle extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {

    final Producto producto = ModalRoute.of(context).settings.arguments; 

    final _srceenSize = MediaQuery.of(context).size;

    return  Scaffold(          
        body: Stack(          
          children: <Widget>[
            _fondoNike( _srceenSize, producto ),
            _crearWidgets( context , producto, _srceenSize )
          ],
        )
    );
  }

Widget _fondoNike( Size _srceenSize , Producto producto ) {

    final gradiente = Container(
      color:  Color.fromRGBO(29, 31, 33, 1.0),
    );

    final circuloAmarillo = Container(
          child: CircleAvatar(                                  
            backgroundColor: Colors.yellow[700],
            radius: _srceenSize.width * 0.55,
            child: Container(),
          ),
        );

    return Stack(
      children: <Widget>[
        gradiente,
        Positioned(
          top: - (_srceenSize.width * 0.8) / 5,
          left: (_srceenSize.width ) / 2.5,
          child: circuloAmarillo
        ),
        Positioned(
          top: _srceenSize.height * 0.25,
          left: 20,
          child: Text('NIKE AIR', style: TextStyle( fontFamily: 'Teko', color: Colors.white ,fontSize: 140.0 ) )
        ),

        
      ],
    );

  }

Widget _crearWidgets( BuildContext context , Producto producto , Size _srceenSize) {

    return 
    SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric( horizontal: 10.0, ),
        child: Column(  
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            _crearRowIconos( context ),                
            _crearImagen( producto , _srceenSize ),
            _crearEtiquetas( context , producto ), 
            _crearTallas( context , producto ),  
            _crearCajaColor( context , producto ),
            SizedBox( width: 10.0)
          ],
        ),
      )
    );

}

Widget _crearRowIconos( BuildContext context) {
    
    return Row(
      mainAxisSize: MainAxisSize.min,
          children: <Widget>[            
               Expanded(                 
                 child: Container(                                     
                   alignment: Alignment.centerLeft,                   
                   child:IconButton( 
                     icon: Icon( 
                       Icons.arrow_back_ios, color: Colors.white, size: 30.0
                     ), onPressed: () => Navigator.pop(context)
                   )
                 ),
               ),              
               IconButton(icon: Icon( Icons.favorite, color: Colors.white, size: 30.0,), onPressed: (){})
             
          ],
        );
  }

Widget _crearImagen( Producto producto , Size _srceenSize) {
   return  
        Hero(
        tag: 'zapatilla-${producto.id}',
        child: 
        Image(
            image: AssetImage( 'assets/${producto.image}' ),  
            width: _srceenSize.width * 0.9,                                  
          )
   );
 }

Widget _crearEtiquetas(BuildContext context , Producto producto ) {
    return Container(
      padding: EdgeInsets.symmetric( horizontal: 10.0, ),
      child: Column(      
        crossAxisAlignment: CrossAxisAlignment.start,  

        children: <Widget>[
          Text(producto.name , style: TextStyle( fontFamily: 'Teko', fontSize: 20.0 , color: Colors.white , height: 1.0 )),
          SizedBox( height: 10.0 ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(producto.description ,  style: TextStyle( fontFamily: 'Teko', fontSize: 30.0 , color: Colors.white, height: 0.8 )),
              Text('${producto.price}€', style: TextStyle( fontFamily: 'Teko', fontSize: 30.0 , color: Colors.white , height: 0.5 ))
            ],
          ),
          SizedBox( height: 10.0 ),
          Row(
            children: <Widget>[
              Icon( Icons.star , color: Colors.yellow[700] , size: 15.0 ),
              SizedBox( width: 5.0),
              Icon( Icons.star , color: Colors.yellow[700] , size: 15.0 ),
              SizedBox( width: 5.0),
              Icon( Icons.star , color: Colors.yellow[700] , size: 15.0 ),
              SizedBox( width: 5.0),
              Icon( Icons.star , color: Colors.yellow[700] , size: 15.0 ),
              SizedBox( width: 5.0),
              Icon( Icons.star , color: Colors.white , size: 15.0 )
            ],
          )
        ],
      ),
    );
  }

Widget _crearTallas(BuildContext context, Producto producto) {

  return Container(
    padding: EdgeInsets.symmetric( horizontal: 10.0, ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,  
      children: <Widget>[
        Text('SIZE' , style: TextStyle( fontFamily: 'Teko', fontSize: 20.0 , color: Colors.white )),
        SizedBox( height: 10.0 ),
        Row(
          children: <Widget>[
              _crearCajaTalla('7', Colors.yellow[700] ),
              SizedBox( width: 15.0),
              _crearCajaTalla('7.5', Color.fromRGBO(255, 255, 255, 1.0) ),
              SizedBox( width: 15.0),
              _crearCajaTalla('8', Color.fromRGBO(255, 255, 255, 1.0) ),
              SizedBox( width: 15.0),
              _crearCajaTalla('9', Color.fromRGBO(255, 255, 255, 1.0) ),             
          ],
        )
      ],
    ),
  );

}

Widget  _crearCajaTalla( String talla, Color color  ) {

  return ClipRRect(
          borderRadius: BorderRadius.circular(10.0),
          child: Container(
            height: 40.0,
            width: 40.0, 
            color: color,
            child: Center(              
              child: Text( talla , style: TextStyle( fontFamily: 'Teko', fontSize: 18.0) )
            ),
          ),
        );

}

Widget _crearCajaColor(BuildContext context, Producto producto) {


  return Container(
    padding: EdgeInsets.symmetric( horizontal: 10.0, ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
         Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           children: <Widget>[
              Text('COLOR' , style: TextStyle( fontFamily: 'Teko' , fontSize: 20.0 , color: Colors.white )),
              Row(         
                children: <Widget>[
                  _crearCirculoColor( Colors.yellow[700]),
                  SizedBox( width: 15.0),
                  _crearCirculoColor( Colors.white),
                  SizedBox( width: 15.0),
                  _crearCirculoColor( Colors.teal) ,                               
                ],
              )
            
           ],
         ),
           _crearBotonComprar()
      ],
    ),
  );


}

Widget  _crearCirculoColor( Color color ) {

  return ClipRRect(
          borderRadius: BorderRadius.circular(50.0),
          child: Container(
            height: 30.0,
            width: 30.0, 
            color: color,           
          ),
        );

}

Widget  _crearBotonComprar() {

  return RaisedButton(
          color: Colors.yellow[700],
          padding: EdgeInsets.symmetric( horizontal: 40.0, vertical: 20.0 ),
          child: Text( 'BUY', style: TextStyle( fontFamily: 'Teko', fontSize: 30.0 )  ) ,
          onPressed: (){ print('Comprar!'); },
          shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(20.0))
        );
 

} 

}