import 'package:eme_store/src/bloc/login_bloc.dart';
import 'package:eme_store/src/bloc/provider.dart';
import 'package:eme_store/src/widgets/circle.dart';
import 'package:flutter/material.dart';


class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: GestureDetector(
        onTap: (){
          FocusScope.of(context).requestFocus(FocusNode());
        },
              child: Container(
          width: size.width,
          height: size.height,
          child: Stack(
            children: <Widget>[
              Positioned(
                left:140,
                top: -150,
                child: Circle(
                radius: 150,
                colors: [
                  Color.fromRGBO(65, 91, 40, 1),
                  Color.fromRGBO(169, 235, 107, 1),
                ],
              ),
              ),
              Positioned(
                left:260,
                top: 30,
                child: Circle(
                radius: 90,
                colors: [
                  Color.fromRGBO(65, 91, 40, 1),
                  Color.fromRGBO(169, 235, 107, 1),
                ],
              ),
              ),
              Positioned(

                left:340,
                top: 150,
                child: Circle(
                radius: 60,
                colors: [
                  Color.fromRGBO(65, 91, 40, 1),
                  Color.fromRGBO(169, 235, 107, 1),
                ],
              ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                    Container(
                      height: size.height * .5,
                      child: _header(context)
                    ),
                    _formulario(context)
                  ],
                ),
              ),
            ],
          ),
        ),
      )
    );
  }

  Widget _header(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Container(
            width: size.width * .35,
            height: size.height * .15,
            child: Image(
              image: AssetImage('assets/images/EmeStore.png'),
              fit: BoxFit.cover,
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 5),
            child:  Text('Welcome \nBack', style: TextStyle(fontWeight: FontWeight.normal, fontSize: 25, color: Color.fromRGBO(50, 54, 66, 1))),
          )
            
           
        ],
      ),
    );
  }

  Widget _formulario(BuildContext context) {

     final bloc = Provider.of(context);
    
     return SingleChildScrollView(
       child: Column(
         children: <Widget>[
           Container(
        padding: EdgeInsets.symmetric(horizontal: 25.0),
        child: Column(
          children: <Widget>[
            _crearEmail(bloc),
            SizedBox(height: 20,),
            _crearPassword(bloc),
            SizedBox(height: 30,),
            _crearButtonSignIn(bloc),
            SizedBox(height: 10,),
            _crearButtonSignUp(context),
            SizedBox(height: 10,),
            _crearButtonForgotPass(context),
          ],
        )
          ),
         ],
       ),
     ); 
  }

  Widget _crearEmail( LoginBloc bloc) {

    return StreamBuilder(
      stream: bloc.emailStream,
      builder: (BuildContext context, AsyncSnapshot snapshot){
          return TextField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                hintText: 'exaple@correo.com',
                labelText: 'Email',
                contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                errorText: snapshot.error
              ),
              cursorColor: Colors.lightGreen,
              onChanged: bloc.changeEmail,
            );
      }
    );

    
  }

  Widget  _crearPassword(LoginBloc bloc) {
    return StreamBuilder(
      stream: bloc.passwordStream ,
      builder: (BuildContext context, AsyncSnapshot snapshot){
        return TextField(
              obscureText: true,
              decoration: InputDecoration(
                hintText: 'exaple@correo.com',
                labelText: 'Password',
                contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                errorText: snapshot.error
              ),
              cursorColor: Colors.lightGreen,
              onChanged: bloc.changePassword,
            );
      },
    );
    
  }

  Widget _crearButtonSignIn(LoginBloc bloc) {

    return StreamBuilder(
      stream:  bloc.formValidStream,
      builder: (BuildContext context, AsyncSnapshot snapshot){
        return Hero(
          transitionOnUserGestures: true,
          tag: 'signin',
              child: Material(
                type: MaterialType.transparency,
                          child: RaisedButton(
                  child: Container(
                    padding: EdgeInsets.symmetric( horizontal: 112.0, vertical: 15.0),
                    child: Text('Sign in', style: TextStyle(fontSize: 17),),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0)
                  ),
                  elevation: 0.0,
                  color:Color.fromRGBO(129, 189, 74, 1),
                  textColor: Colors.white,
                  onPressed: snapshot.hasData ? () => _login(bloc, context) : null
                ),
              ),
        );
      },
    );

    
  }

  Widget _crearButtonSignUp(BuildContext context) {
    return Hero(
          tag: 'signup',
          child: RaisedButton(
            child: Container(
              padding: EdgeInsets.symmetric( horizontal: 110.0, vertical: 15.0),
              child: Text('Sign up', style: TextStyle(fontSize: 17),),
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(0)
            ),
            elevation: 0.0,
            color:Color.fromRGBO(50, 54, 66, 1),
            textColor: Colors.white,
            onPressed: (){
              Navigator.of(context).pushNamed('register');
            }
          ),
    );
  }

  Widget _crearButtonForgotPass(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size.height * .05,
      child: GestureDetector(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Forgot your password?'),
          ],
        ),
        onTap: (){
          Navigator.of(context).pushNamed('reset');
        },
      ),
    );
  }
  
  _login(LoginBloc bloc, BuildContext context) {

    print('================');
    print('Email: ${ bloc.email }');
    print('Password: ${ bloc.password }');
    print('================');

    Navigator.pushReplacementNamed(context, 'home');

  }
}