import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gameconsigne/authentication/authentication_bloc.dart';
import 'package:gameconsigne/authentication/authentication_event.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
            child: RaisedButton(
          child: Text('logout'),
          onPressed: () {
            BlocProvider.of<AuthenticationBloc>(context).add(LoggedOut());
          },
        )),
      ),
    );
  }
}
