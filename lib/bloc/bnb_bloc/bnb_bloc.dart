import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:tracker_app/bloc/bnb_bloc/bnb_event.dart';
import 'package:tracker_app/bloc/bnb_bloc/bnb_state.dart';

class BottomNavigationBloc extends Bloc<BottomNavigationEvent, BottomNavigationState> {
  BottomNavigationBloc() : super(PageLoading());

  int currentIndex = 0;
  @override
  BottomNavigationState get initialState => PageLoading();

  @override
  Stream<BottomNavigationState> mapEventToState(BottomNavigationEvent event) async* {
    if (event is AppStarted) {
      add(PageTapped(index: currentIndex));
    }
    if (event is PageTapped) {
      currentIndex = event.index;
      yield CurrentIndexChanged(currentIndex: currentIndex);
      yield PageLoading();
      if (currentIndex == 0) {
        yield const HomePageLoaded();
      }
      if (currentIndex == 1) {
        yield const StatisticsPageLoaded();
      }
      if (currentIndex == 2) {
        yield const WorkoutsPageLoaded();
      }
      if (currentIndex == 3) {
        yield const RecipesPageLoaded();
      }
    }
  }
}
