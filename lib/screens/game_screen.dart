import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../block/game_cubit.dart';
import '../block/game_state.dart';


class GameScreen extends StatelessWidget {
  const GameScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return GameCubit(GameInitialState());
      },
      child: Builder(builder: (context) {
        List gameChoosenColor = context.read<GameCubit>().randomizePlayColor();

        return Scaffold(
          appBar: AppBar(
            title: Text(gameChoosenColor[0]),
            centerTitle: true,
            backgroundColor: Colors.green,
          ),
          body: SafeArea(
            child: Stack(
              children: [
                circleButton(
                  context: context,
                  myColor: Colors.orange,
                  onTap: () {
                    if (gameChoosenColor[1] == Colors.orange) {
                      context.read<GameCubit>().addScore();
                    } else {
                      giveDialog(context: context);
                    }
                  },
                ),
                circleButton(
                  context: context,
                  myColor: Colors.red,
                  onTap: () {
                    if (gameChoosenColor[1] == Colors.red) {
                      context.read<GameCubit>().addScore();
                    } else {
                      giveDialog(context: context);
                    }
                  },
                ),
                circleButton(
                  context: context,
                  myColor: Colors.brown,
                  onTap: () {
                    if (gameChoosenColor[1] == Colors.brown) {
                      context.read<GameCubit>().addScore();
                    } else {
                      giveDialog(context: context);
                    }
                  },
                ),
                circleButton(
                  context: context,
                  myColor: Colors.pink,
                  onTap: () {
                    if (gameChoosenColor[1] == Colors.pink) {
                      context.read<GameCubit>().addScore();
                    } else {
                      giveDialog(context: context);
                    }
                  },
                ),
                circleButton(
                  context: context,
                  myColor: Colors.grey,
                  onTap: () {
                    if (gameChoosenColor[1] == Colors.grey) {
                      context.read<GameCubit>().addScore();
                    } else {
                      giveDialog(context: context);
                    }
                  },
                ),
              ],
            ),
          ),
        );
      }),
    );
  }

  AnimatedAlign circleButton({
    required BuildContext context,
    required Color myColor,
    required Function() onTap,
  }) {
    return AnimatedAlign(
      alignment: Alignment(giveRandom(), giveRandom()),
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
      child: InkWell(
        onTap: onTap,
        child: Container(
          width: MediaQuery.of(context).size.width * 0.2,
          height: MediaQuery.of(context).size.width * 0.2,
          decoration: BoxDecoration(color: myColor, shape: BoxShape.circle),
          child: Center(
            child: Text(
              Random().nextInt(5).toString(),
              style: TextStyle(
                  color: Colors.white,
                  fontSize: MediaQuery.of(context).size.width * 0.05),
            ),
          ),
        ),
      ),
    );
  }

  Future<T?> giveDialog<T>({required BuildContext context}) {
    return showDialog(
      context: context,
      builder: (_) {
        return CupertinoAlertDialog(
          title: Text("Your score: " + context.read<GameCubit>().countScore.toString()),
          actions: [
            CupertinoButton(
                child: const Text("OK"),
                onPressed: () {
                  context.read<GameCubit>().resetScore();
                  Navigator.pop(context);
                })
          ],
        );
      },
    );
  }

  double giveRandom() {
    bool chooseOne = Random().nextBool();
    double randomNumNegative = Random().nextDouble() * -1;
    double randomNumPositive = Random().nextDouble();

    if (chooseOne) {
      return randomNumNegative;
    }
    return randomNumPositive;
  }
}