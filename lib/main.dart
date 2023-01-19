import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter/material.dart';

import 'package:tracker_app/bloc/bnb_bloc/bnb_bloc.dart';
import 'package:tracker_app/bloc/bnb_bloc/bnb_event.dart';
import 'package:tracker_app/bloc/bnb_bloc/bnb_state.dart';
import 'package:tracker_app/ui_component/bnb/custom_bnb.dart';
import 'package:tracker_app/ui_component/view/home_page.dart';
import 'package:tracker_app/ui_component/view/recipes_page.dart';
import 'package:tracker_app/ui_component/view/statistics_page.dart';
import 'package:tracker_app/ui_component/view/workout_page.dart';
import 'package:tracker_app/util/color_util.dart';

class SimpleBlocObserver extends BlocObserver {
  @override
  void onTrandition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
  }
}

void main() {
  Bloc.observer = SimpleBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: ColorUtil.backgroundColor,
      home: BlocProvider<BottomNavigationBloc>(
        create: (context) => BottomNavigationBloc()..add(AppStarted()),
        child: const AppScreen(),
      ),
    );
  }
}

class AppScreen extends StatelessWidget {
  const AppScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final BottomNavigationBloc bottomNavigationBloc = BlocProvider.of<BottomNavigationBloc>(context);
    return Scaffold(
      body: BlocBuilder<BottomNavigationBloc, BottomNavigationState>(
          bloc: bottomNavigationBloc,
          builder: (BuildContext context, BottomNavigationState state) {
            if (state is PageLoading) {
              return const Center(child: CircularProgressIndicator(color: ColorUtil.semanticColorPurple));
            }
            if (state is HomePageLoaded) {
              return const HomePage();
            }
            if (state is StatisticsPageLoaded) {
              return const StatisticsPage();
            }
            if (state is WorkoutsPageLoaded) {
              return const WorkoutsPage();
            }
            if (state is RecipesPageLoaded) {
              return const RecipesPage();
            }
            return Container();
          }),
      bottomNavigationBar: BlocBuilder<BottomNavigationBloc, BottomNavigationState>(
          builder: (BuildContext context, BottomNavigationState state) {
        return buildBNB(context);
      }),
    );
  }

  CustomBottomNavigationBar buildBNB(BuildContext context) {
    return CustomBottomNavigationBar(
      currentIndex: context.select((BottomNavigationBloc bloc) => bloc.currentIndex),
      onTap: (index) {
        context.read<BottomNavigationBloc>().add(PageTapped(index: index));
        debugPrint('tapped $index');
      },
      onAddTap: () {
        debugPrint('Add habbit button pressed');
      },
    );
  }
}
