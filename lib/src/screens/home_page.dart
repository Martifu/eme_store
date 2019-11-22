import 'package:eme_store/src/bloc/provider.dart';
import 'package:eme_store/src/models/producto_model.dart';
import 'package:eme_store/src/providers/productos_provider.dart';
import 'package:flutter/material.dart';


class HomePage extends StatelessWidget {

  final productosProvider = ProductosProvider();
  @override
  Widget build(BuildContext context) {

    //final bloc = Provider.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: _crearListado(),
      floatingActionButton: _crearBoton(context),
    );
  }

  Widget  _crearListado() {

    return FutureBuilder(
      future: productosProvider.cargarProductos(),
      builder: (BuildContext context, AsyncSnapshot<List<ProductoModel>> snapshot) {
        final productos = snapshot.data;
        if (snapshot.hasData){
          return ListView.builder(
              itemCount: productos.length,
              itemBuilder: (context, i)=>_crearItem(context, productos[i]),
          );
        }else{
          return Center(child: CircularProgressIndicator(),);
        }
      
      },
    );

  }

  Widget _crearItem(BuildContext context,ProductoModel producto){
    return Dismissible(
      key: UniqueKey(),
      background: Container(color: Colors.red,),
      onDismissed: (direction){

      },
          child: ListTile(
        title: Text('${producto.titulo} - ${producto.valor}'),
        subtitle: Text(producto.disponible),
        onTap: ()=>Navigator.of(context).pushNamed('producto'),
      ),
    );
  }

  Widget _crearBoton(BuildContext context) {
    return FloatingActionButton(
      child: Icon(Icons.add),
      backgroundColor: Color.fromRGBO(129, 189, 74, 1),
      onPressed: ()=> Navigator.pushNamed(context, 'producto'),
    );
  }

 
}