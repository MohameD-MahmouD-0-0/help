import 'package:flutter/material.dart';
import 'package:flutter_application_1/Game/core/constants/colors.dart';
import 'package:flutter_application_1/Game/features/game/presentation/game_page.dart';
import 'package:provider/provider.dart';
import '../../game/business logic/tic_tac_toe_provider.dart';
import 'widgets/custom_selection.dart';
import 'widgets/select_game_header.dart';

class SelectGame extends StatelessWidget {
  const SelectGame({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: MainColor.backgroundGradient,
        ),
        // padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
        child: SafeArea(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SelectGameHeader(),
                const SizedBox(
                  height: 32,
                ),
                CustomSelection(
                  imagePath: 'lib/assets/icons/dump AI.png',
                  circleColor: const Color(0xFFFFA800),
                  containerColor: const Color(0xFFF3501D),
                  gameMode: 'Dump AI',
                  borderColor: const Color(0xFFFF8A00),
                  onTap: () {
                    Provider.of<TicTacToeProvider>(context, listen: false)
                        .reset();
                    Provider.of<TicTacToeProvider>(context, listen: false)
                        .whichMode = 0;
                    //GoRouter.of(context).push(AppRouter.kGamePage);
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return GamePage();
                    }));
                  },
                ),
                const SizedBox(
                  height: 32,
                ),
                CustomSelection(
                  imagePath: 'lib/assets/icons/2players.png',
                  circleColor: const Color(0xFFEB00FF),
                  containerColor: const Color(0xFF7213EB),
                  gameMode: 'Two Players',
                  borderColor: const Color(0xFFFF00A8),
                  onTap: () {
                    Provider.of<TicTacToeProvider>(context, listen: false)
                        .reset();
                    Provider.of<TicTacToeProvider>(context, listen: false)
                        .whichMode = 1;
                    //GoRouter.of(context).push(AppRouter.kGamePage);
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return GamePage();
                    }));
                  },
                ),
                const SizedBox(
                  height: 32,
                ),
                CustomSelection(
                  imagePath: 'lib/assets/icons/smart robot.png',
                  circleColor: const Color(0xFF391898),
                  containerColor: const Color(0xFF451CBB),
                  gameMode: 'Unbeatable UI',
                  borderColor: const Color(0xFF843CE0),
                  onTap: () {
                    Provider.of<TicTacToeProvider>(context, listen: false)
                        .reset();
                    Provider.of<TicTacToeProvider>(context, listen: false)
                        .whichMode = 2;
                    //GoRouter.of(context).push(AppRouter.kGamePage);
                     Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return GamePage();
                    }));
                  },
                ),
                // CustomSelection(
                //   imagePath: 'assets/icons/multiplayer1.png',
                //   circleColor: const Color(0xFF4C9BD4),
                //   containerColor: const Color(0xFF33A6BF),
                //   gameMode: 'Multiplayer',
                //   borderColor: const Color(0xFF5D5FEF),
                //   onTap: () {
                //     GoRouter.of(context).push(AppRouter.kComingSoonPage);
                //   },
                // ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: SizedBox(
                    height: 50,
                    width: 110,
                    child: Image.asset(
                      'lib/assets/icons/controller2.png',
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
