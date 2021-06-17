import 'package:custom_sidebar/pages/page_one.dart';
import 'package:custom_sidebar/pages/page_three.dart';
import 'package:custom_sidebar/pages/page_two.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum SidebarEvent { PageOneClicked, PageTwoClicked, PageThreeClicked }

abstract class SidebarState {}

class SidebarBloc extends Bloc<SidebarEvent, SidebarState> {
  SidebarBloc() : super(PageOne());

  @override
  Stream<SidebarState> mapEventToState(SidebarEvent event) async* {
    switch (event) {
      case SidebarEvent.PageOneClicked:
        yield PageOne();
        break;
      case SidebarEvent.PageTwoClicked:
        yield PageTwo();

        break;
      case SidebarEvent.PageThreeClicked:
        yield PageThree();
        break;
    }
  }
}
