import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gameconsigne/bloc/tab/tab_event.dart';
import 'package:gameconsigne/data/model/tab/app_tab.dart';

class TabBloc extends Bloc<TabEvent, AppTab> {
  @override
  AppTab get initialState => AppTab.todos;

  @override
  Stream<AppTab> mapEventToState(TabEvent event) async* {
    if (event is UpdateTab) {
      yield event.tab;
    }
  }
}
