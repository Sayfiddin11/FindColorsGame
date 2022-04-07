import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'game_state.dart';

class GameCubit extends Cubit<GameState> {
  GameCubit(GameInitialState initialState) : super(initialState);

  Color gameChooseColor = Colors.grey;
  int countScore = 0;
  int yourScore = 0;

  Color randomizeColor() {
    List<Color> colors = [
      Colors.grey,
      Colors.brown,
      Colors.pink,
      Colors.red,
      Colors.orange,
    ];
    return colors[Random().nextInt(5)];
  }

  List randomizePlayColor() {
    List<List> myList = [
      ["Grey", Colors.grey],
      ["Brown", Colors.brown],
      ["Pink", Colors.pink],
      ["Red", Colors.red],
      ["Orange", Colors.orange]
    ];
    return myList[Random().nextInt(5)];
  }

  void addScore() {
    countScore += 1;
    print(countScore);
    emit(GameChangePosition());
  }

  void resetScore() {
    countScore = 0;
    emit(GameChangePosition());
  }
}