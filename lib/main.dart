import 'package:flutter/material.dart';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gameconsigne/common/router.dart';
import 'package:user_repository/user_repository.dart';
import 'package:gameconsigne/authentication/authentication.dart';
import 'package:gameconsigne/ui/home/home.dart';
import 'blocs/simple_bloc_delegate.dart';
import 'blocs/tab/tab_bloc.dart';

void main() {
  BlocSupervisor.delegate = SimpleBlocDelegate();
  final userRepository = UserRepository();
  runApp(
    BlocProvider<AuthenticationBloc>(
      create: (context) {
        return AuthenticationBloc(userRepository: userRepository)
          ..add(AppStarted());
      },
      child: App(userRepository: userRepository),
    ),
  );
}

class App extends StatelessWidget {
  final UserRepository userRepository;
  App({Key key, @required this.userRepository}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
       routes: {
         GameConsigneRouter.home: (context) {
          return MultiBlocProvider(
            providers: [
              BlocProvider<TabBloc>(
                create: (context) => TabBloc(),
              ),
            ],
            child: HomeScreen(),
          );
        },
       });
  }
}

 // builder: (context, state) {
        //   if (state is AuthenticationAuthenticated) {
        //     return HomePage();
        //   }
        //   if (state is AuthenticationUnauthenticated) {
        //     return LoginPage(userRepository: userRepository);
        //   }
        //   if (state is AuthenticationLoading) {
        //     return LoadingIndicator();
        //   }
        //   return SplashPage();
        // },