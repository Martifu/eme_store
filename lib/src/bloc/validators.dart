import 'dart:async';



class Validators {


  final validarEmail = StreamTransformer<String, String>.fromHandlers(
    handleData: ( email, sink ) {


      Pattern pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
      RegExp regExp   = new RegExp(pattern);

      if ( regExp.hasMatch( email ) ) {
        sink.add( email );
      } else {
        sink.addError('Wrong email');
      }

    }
  );


  final validarPassword = StreamTransformer<String, String>.fromHandlers(
    handleData: ( password, sink ) {
      if ( password.length >= 6 ) {
        sink.add( password );
      } else {
        sink.addError('More than 6 characters');
      }

    }
  );

  

  final validarName = StreamTransformer<String, String>.fromHandlers(
    handleData: ( name, sink ) {
      Pattern pattern = r'[A-Z-a-z]';
      RegExp regExp   = new RegExp(pattern);
      if ( regExp.hasMatch(name) ) {
        sink.add( name );
      } else {
        sink.addError('Name invalid');
      }

    }
  );


}
