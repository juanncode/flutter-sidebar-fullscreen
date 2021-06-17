import 'dart:async';

import 'package:bloc/bloc.dart';

enum DrawerEvent {
  OpenDrawerEvent,
  CloseDrawerEvent,
}

class DrawerBloc extends Bloc<DrawerEvent, bool> {
  DrawerBloc() : super(false);

  @override
  Stream<bool> mapEventToState(
    DrawerEvent event,
  ) async* {
    switch (event) {
      case DrawerEvent.OpenDrawerEvent:
        yield true;
        break;
      case DrawerEvent.CloseDrawerEvent:
        yield false;
        break;
    }
  }
}
