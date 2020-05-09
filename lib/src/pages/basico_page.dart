import 'package:flutter/material.dart';

class BasicoPage extends StatelessWidget {

  final estiloTitulo = TextStyle( fontSize: 20.0 , fontWeight: FontWeight.bold);
  final estiloSubTitulo = TextStyle( fontSize: 18.0 , color: Colors.grey);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
           children: <Widget>[
          
           _crearImagen(),
           _crearTitulo(),
           _crearAcciones(),
           _crearTexto(),
           _crearTexto(),
           _crearTexto(),
           _crearTexto(),
           _crearTexto(),

          ],
        ),
      )
    );
  }

  Widget _crearImagen(){
    return Container(
      width: double.infinity,
      child: Image(
               image: NetworkImage('https://images.pexels.com/photos/132037/pexels-photo-132037.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),
               fit: BoxFit.cover,
               height: 190.0,
             ),
    );
  }

  Widget _crearTitulo() {
    return SafeArea(
      child: Container(
              padding: EdgeInsets.symmetric( horizontal: 30.0 , vertical: 0.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('Lago conn un puente' ,style: estiloTitulo ),
                        SizedBox( height: 7.0 ,),
                        Text('Al atardecer', style: estiloSubTitulo),
                      ],
                    ),
                  ),                 
                  Icon( Icons.star, color: Colors.red , size: 30.0,),
                  Text('41', style: TextStyle( fontSize: 20.0 ),)
                ],
              ),
            ),
    );
  }

  Widget _crearAcciones() {

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[        
        _crearAccion( Icons.call , 'Call' ),
        _crearAccion( Icons.near_me , 'ROUTE' ),
        _crearAccion( Icons.share , 'Share')
      ],
    );

  }

  Widget _crearAccion( IconData icon, String texto ){
    return Column(
          children: <Widget>[
            Icon(icon , color:Colors.blue, size:40.0), 
            SizedBox(height: 5.0,),
            Text(texto ,style: TextStyle( fontSize: 15.0 , color: Colors.blue) )
          ],
        );
  }

  Widget _crearTexto(){
    return SafeArea(
        child: Container(
        padding: EdgeInsets.symmetric( horizontal:  40.0 , vertical: 00.0 ),
        child: Text(
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
            textAlign: TextAlign.justify,
        ),
      ),
    );
  }
}