import 'package:eme_store/src/bloc/login_bloc.dart';
import 'package:flutter/material.dart';


class ResetPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    final bloc = LoginBloc();
    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height,
        child: Padding(
          padding: const EdgeInsets.only(top:0.0),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
            children: <Widget>[
              SizedBox(height: size.height * .2),
              Text('Reset your password', style: TextStyle(fontSize: 25)),
              SizedBox(height: size.height * .04,),
              Text('Please, enter your email!', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w100)),
              SizedBox(height: size.height * .03,),
              _crearEmail(bloc),
              SizedBox(height: size.height * .03,),
              _crearButtonSignIn(bloc),
              SizedBox(height: size.height * .15,),
              _buttonBack(context)
            ],
          ),
        )
      ),
      )
    );
  }

  Widget _crearEmail(LoginBloc bloc) {
    return StreamBuilder(
      stream: bloc.emailStream,
      builder: (BuildContext context, AsyncSnapshot snapshot){
        return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: TextField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  hintText: 'exaple@correo.com',
                  labelText: 'Email',
                  contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  errorText: snapshot.error
                ),
                cursorColor: Colors.lightGreen,
                onChanged: bloc.changeEmail,
              ),
    );
      },
    );
    
  }

  Widget _crearButtonSignIn(LoginBloc bloc) {
    return StreamBuilder(
      stream: bloc.emailValidStream ,
      builder: (BuildContext context, AsyncSnapshot snapshot){
        return Hero(
          tag: 'signup',
              child: RaisedButton(
                child: Container(
                  padding: EdgeInsets.symmetric( horizontal: 120.0, vertical: 15.0),
                  child: Text('Send ', style: TextStyle(fontSize: 17),),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0)
                ),
                elevation: 0.0,
                color: Color.fromRGBO(50, 54, 66, 1),
                textColor: Colors.white,
                onPressed: snapshot.hasData ? () => _sendResetEmail(bloc, context) : null
              ),
        );
      },
    );
    
  }

  Widget _buttonBack(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Hero(
      transitionOnUserGestures: true,
      tag: 'signin',
          child: Material(
            type: MaterialType.transparency,
                      child: InkResponse(
              child: Container(
                width: size.width * .3,
                height: size.height * .07,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(129, 189, 74, 1),
                  shape: BoxShape.circle
                ),
                child: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                ),
              ),
              onTap: () => Navigator.of(context).pop()
            ),
          ),
    );
  }

  _sendResetEmail(LoginBloc bloc, BuildContext context) {

    print('================');
    print('Email: ${ bloc.email }');
    print('================');

    Navigator.of(context).pop();
  }

  
  
}