import 'dart:async';
import 'package:eme_store/src/bloc/validators.dart';
import 'package:rxdart/rxdart.dart';

class RegisterBloc with Validators {

  final _nameController = BehaviorSubject<String>();
  final _emailController    = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();
  final _confirmPasswordController = BehaviorSubject<String>();

  // Recuperar los datos del Stream
  Stream<String> get emailStream    => _emailController.stream.transform( validarEmail );
  Stream<String> get passwordStream => _passwordController.stream.transform( validarPassword );
  Stream<String> get confirmPasswordStream => _confirmPasswordController.stream.transform( validarPassword )
    .doOnData((String c){
      if (0 != _passwordController.value.compareTo(c)){
        _confirmPasswordController.addError("Passwords not match");
      }
    });
  Stream<String> get nameStream => _nameController.stream.transform( validarName );


  Stream<bool> get formValidStream => 
      Observable.combineLatest4(emailStream, passwordStream, nameStream, confirmPasswordStream, (e, p, n,c) =>true);
      



  // Insertar valores al Stream
  Function(String) get changeEmail    => _emailController.sink.add;
  Function(String) get changePassword => _passwordController.sink.add;
  Function(String) get changeConfirmPassword => _confirmPasswordController.sink.add;
  Function(String) get changeName => _nameController.sink.add;



  // Obtener el último valor ingresado a los streams
  String get email    => _emailController.value;
  String get password => _passwordController.value;
  String get confirmPassword => _confirmPasswordController.value;
  String get name => _nameController.value;


  dispose() {
    _emailController?.close();
    _passwordController?.close();
    _confirmPasswordController?.close();
    _nameController?.close();
  }

}

