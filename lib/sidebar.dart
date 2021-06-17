import 'package:custom_sidebar/bloc/sidebar_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/drawer_bloc.dart';

class SideBar extends StatelessWidget {
  const SideBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return BlocBuilder<DrawerBloc, bool>(
      builder: (context, state) {
        return AnimatedPositioned(
            duration: Duration(milliseconds: 350),
            top: 0,
            bottom: 0,
            right: state ? 0 : 0,
            left: state ? 0 : size.width,
            child: Container(
                width: size.width,
                color: Colors.teal,
                child: Column(
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      alignment: Alignment.centerRight,
                      padding: EdgeInsets.all(15),
                      child: InkWell(
                        onTap: () {
                          BlocProvider.of<DrawerBloc>(context)
                              .add(DrawerEvent.CloseDrawerEvent);
                        },
                        child: Icon(
                          Icons.close,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        width: size.width,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20),
                            ),
                            color: Colors.blue),
                        child: BlocBuilder<SidebarBloc, SidebarState>(
                          builder: (context, state) {
                            return ListView(
                              children: [
                                itemClicked("Page One", context,
                                    SidebarEvent.PageOneClicked),
                                itemClicked("Page Two", context,
                                    SidebarEvent.PageTwoClicked),
                                itemClicked("Page Three", context,
                                    SidebarEvent.PageThreeClicked),
                              ],
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                )));
      },
    );
  }

  itemClicked(String name, BuildContext context, SidebarEvent event) {
    return InkWell(
      onTap: () {
        BlocProvider.of<SidebarBloc>(context).add(event);
        BlocProvider.of<DrawerBloc>(context).add(DrawerEvent.CloseDrawerEvent);
      },
      child: Container(
        child: Text(name),
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        decoration: BoxDecoration(
            color: Colors.teal[100], borderRadius: BorderRadius.circular(20)),
      ),
    );
  }
}
