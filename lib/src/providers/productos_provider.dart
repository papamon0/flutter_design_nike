import 'package:disenos/src/model/productos.dart';
import 'package:flutter/material.dart';

class ProductorProvider{

  ProductorProvider();

  
  List<Producto> getProductos(){
   
    final List<Producto> productos = List<Producto>();

    productos.add( Producto( 2, 'NIKE AIR', 'nike19.png', 'AIR JORDAN 1 MID SE GC', 'NIKE AIR', 182.5 , Color.fromRGBO(255 , 62, 31, 1.0) ));
    productos.add( Producto( 3, 'NIKE AIR', 'nike20.png', 'AIR JORDAN 1 MID SE GC', 'NIKE AIR', 95.5 , Color.fromRGBO(13, 52, 92, 1.0) ));    
    productos.add( Producto( 1, 'NIKE AIR', 'nike21.png', 'AIR JORDAN 1 MID SE GC', 'NIKE AIR', 110.5 , Color.fromRGBO(9, 136, 124, 1.0) ));    
   
    return productos;

  }

}