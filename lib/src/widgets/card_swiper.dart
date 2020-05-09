
import 'package:disenos/src/model/productos.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';


class CardSwiper extends StatelessWidget {
   
  final List<Producto> productos;

  CardSwiper( { @required this.productos } );

   
  @override
  Widget build(BuildContext context) {

    final _srceenSize = MediaQuery.of(context).size;
  
    return Container(
      padding: EdgeInsets.only(top:20.0),    
      height: _srceenSize.height * 0.48,  
      //width: _srceenSize.width * 0.6,      
      child: 
        new Swiper(
          loop: false,
          itemBuilder: (BuildContext context, int index ){            
            return   _crearFicha( _srceenSize , index , context);
          },
          itemCount: productos.length,
          viewportFraction: 0.7,
          scale: 0.7,
          //itemWidth: _srceenSize.width * 0.6,
          //itemHeight: _srceenSize.height * 0.45,
          layout: SwiperLayout.DEFAULT,          
          //pagination: new SwiperPagination(),
          //control: new SwiperControl(),
        ),
    );
  }

Widget _getZapatilla( Size _srceenSize, int index ){

  return Positioned(
          top:  _srceenSize.height * 0.1 ,
          left: 0 ,
          child: 
          Hero(
              tag: 'zapatilla-${productos[index].id}' ,
              child:  
              Image(
                image: AssetImage( 'assets/${productos[index].image}' ),  
                width: _srceenSize.width * 0.80 ,                                  
              ) 
            )
         
        );
}

Widget _getEsquinaAmarilla( Size _srceenSize, index  ){

  return Positioned(
          top:  _srceenSize.height * 0.45 - 100.0,
          left: _srceenSize.width * 0.6 - 90.0 ,
          child: Container(
            height: 360.0,
            width: 360.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40.0),
              color: productos[index].color,                            
            ),
            child: Container(  
              padding: EdgeInsets.all(35.0),            
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[ Icon(Icons.add , size: 50.0,) ],
              ),
            )              
          )
        );
}

Widget _crearFicha( _srceenSize ,index, BuildContext context ) {
   return GestureDetector(
        onTap: () => Navigator.pushNamed(context, 'detalle' , arguments: productos[index]) ,                
        child:
        Stack(
          children: <Widget>[
            ClipRRect(               
              borderRadius: BorderRadius.circular( 40.0 ),
              child: Stack(
                children: <Widget>[
                  Container(
                    width: _srceenSize.width * 0.65,
                    color: Colors.white,
                    padding: EdgeInsets.all(30.0),
                    child:  Column(
                            crossAxisAlignment: CrossAxisAlignment.start,                                   
                            children: <Widget>[
                                Text(productos[index].name , style: TextStyle( fontFamily: 'Teko'  ,fontSize: 20.0 , height: 1.0 )  ),                                
                                Text(productos[index].description, style: TextStyle( fontSize: 25.0 ,fontFamily: 'Teko' , height: 1.0) ),                            
                                Text( '${productos[index].price.toString()} €', style: TextStyle( fontSize: 25.0 ,fontFamily: 'Teko' , height: 1.5) ),
                                SizedBox( height: 30.0, ),
                                Text(productos[index].nameBack, style: TextStyle( fontSize: 80.0 ,fontFamily: 'Teko',color: Colors.grey[300] , height: 0.7) ),                                  
                                ]
                            )
                  ),
                  _getEsquinaAmarilla( _srceenSize , index )
                ]
              ) 
            ), 
            _getZapatilla(_srceenSize, index)     
          ]
        )
      );
 }
}

