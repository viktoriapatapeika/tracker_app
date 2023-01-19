import 'package:equatable/equatable.dart';

abstract class BottomNavigationState extends Equatable {
  const BottomNavigationState();

  @override
  List<Object> get props => [];
}

class CurrentIndexChanged extends BottomNavigationState {
  final int currentIndex;
  const CurrentIndexChanged({required this.currentIndex});

  @override
  String toString() => 'CurrentIndexChanged to $currentIndex';
}

class PageLoading extends BottomNavigationState {
  @override
  String toString() => 'PageLoading';
}

class HomePageLoaded extends BottomNavigationState {
  const HomePageLoaded();
  @override
  String toString() => 'Home page loaded';
}

class StatisticsPageLoaded extends BottomNavigationState {
  const StatisticsPageLoaded();
  @override
  String toString() => 'Statistics page loaded';
}

class WorkoutsPageLoaded extends BottomNavigationState {
  const WorkoutsPageLoaded();
  @override
  String toString() => 'Workouts page loaded';
}

class RecipesPageLoaded extends BottomNavigationState {
  const RecipesPageLoaded();
  @override
  String toString() => 'Recipes page loaded';
}
