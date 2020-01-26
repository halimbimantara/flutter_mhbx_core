import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gameconsigne/blocs/tab/tab_bloc.dart';
import 'package:gameconsigne/blocs/tab/tab_event.dart';
import 'package:gameconsigne/data/model/tab/app_tab.dart';
import 'package:gameconsigne/ui/home/home.dart';
import 'package:gameconsigne/ui/home/home_page.dart';
import 'package:gameconsigne/widget/tab_selector.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TabBloc, AppTab>(
      builder: (context, activeTab) {
        return Scaffold(
          appBar: AppBar(),
          body: activeTab == AppTab.todos ? HomePage() : FeedPage(),
          bottomNavigationBar: TabSelector(
            activeTab: activeTab,
            onTabSelected: (tab) =>
                BlocProvider.of<TabBloc>(context).add(UpdateTab(tab)),
          ),
        );
      },
    );
  }
}