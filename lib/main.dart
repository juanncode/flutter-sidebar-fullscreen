import 'package:custom_sidebar/bloc/drawer_bloc.dart';
import 'package:custom_sidebar/bloc/sidebar_bloc.dart';
import 'package:custom_sidebar/sidebar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SidebarBloc(),
        ),
        BlocProvider(
          create: (context) => DrawerBloc(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Custom SideBar',
        home: Scaffold(
          body: Stack(
            children: <Widget>[
              BlocBuilder<SidebarBloc, SidebarState>(
                builder: (context, state) {
                  return state as Widget;
                },
              ),
              SideBar()
            ],
          ),
        ),
      ),
    );
  }
}
