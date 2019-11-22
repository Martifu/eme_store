import 'package:eme_store/src/models/producto_model.dart';
import 'package:eme_store/src/providers/productos_provider.dart';
import 'package:eme_store/src/utils/utils.dart' as utils;
import 'package:flutter/material.dart';

class ProductoPage extends StatefulWidget {

  @override
  _ProductoPageState createState() => _ProductoPageState();
}

class _ProductoPageState extends State<ProductoPage> {
  final formKey = GlobalKey<FormState>();
  ProductoModel producto = new ProductoModel();
  final productoProvider = ProductosProvider();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text('Producto',style: TextStyle(color: Colors.white),),
        actions: <Widget>[
          IconButton(
            color: Colors.white,
                icon: Icon(Icons.photo_size_select_actual),
                onPressed: (){
                  
                },
              ),
          IconButton(
            color: Colors.white,
            icon: Icon(Icons.camera_alt),
            onPressed: (){

            },
          )
        ],
      ),
      body: SingleChildScrollView(
        
                  child: Container(
            padding: EdgeInsets.all(15.0),
            child: Form(
              key: formKey,
              child: Column(
                children: <Widget>[
                  _crearNombre(),
                  _crearPrecio(),
                  _crearDisponible(),
                  SizedBox(height: 30,),
                  _crearBoton()
                ],
              ),
            ),
          ),
        ),
    );
  }

  Widget _crearNombre() {
    return TextFormField(
      initialValue: producto.titulo,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        labelText: 'Producto'
      ),
      onSaved: (value)=>producto.titulo = value,
      validator: (value){
        if (value.length < 3){
          return 'Ingrese el noobre del producto';
        } else {
          return null;
        }
      },
    );
  }

  Widget _crearPrecio() {
    return TextFormField(
      initialValue: producto.valor.toString(),
      keyboardType: TextInputType.numberWithOptions(decimal: true),
      decoration: InputDecoration(
        labelText: 'Precio'
      ),
      onSaved: (value)=>producto.valor = double.parse(value),
      validator: (value) {
        if ( utils.isNumeric(value)) {
          return null;
        } 
        else if ( value.isEmpty ){
           return 'Ingrese el precio';
         }      
        else {
          return 'Solo números';
        }
      },
    );
  }

  Widget _crearDisponible() {
    return Text(producto.disponible);
    
    
    /*SwitchListTile(
      value: producto.disponible,
      activeColor: Color.fromRGBO(129, 189, 74, 1),
      title: Text('Disponible'),
      onChanged: (value) => setState((){
        producto.disponible = value;
      }),
    );*/
  }

  Widget _crearBoton() {
    return RaisedButton.icon(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0)
      ),
      icon: Icon(Icons.save),
      label: Text('Guardar'),
      color: Color.fromRGBO(129, 189, 74, 1),
      onPressed: _submit,
      textColor: Colors.white,
    );
  }

  void _submit(){
   if(!formKey.currentState.validate() ) return;
   formKey.currentState.save();
   print(producto.titulo);
   print(producto.valor);
   print(producto.disponible);
   productoProvider.crearProducto(producto);

  }

  
}