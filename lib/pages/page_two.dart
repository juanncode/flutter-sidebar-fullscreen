import 'package:custom_sidebar/bloc/drawer_bloc.dart';
import 'package:custom_sidebar/bloc/sidebar_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PageTwo extends StatelessWidget with SidebarState {
  const PageTwo();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
            right: 20,
            top: 40,
            child: InkWell(
              child: Icon(Icons.menu_outlined),
              onTap: () {
                BlocProvider.of<DrawerBloc>(context)
                    .add(DrawerEvent.OpenDrawerEvent);
              },
            )),
        Center(
          child: Container(
            child: Text("Page Two"),
          ),
        ),
      ],
    );
  }
}
