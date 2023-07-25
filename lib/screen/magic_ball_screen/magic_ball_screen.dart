import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:surf_practice_magic_ball/repositories/magic_ball_repository.dart';
import 'package:surf_practice_magic_ball/screen/magic_ball_screen/bloc/magic_ball_bloc.dart';
import 'package:surf_practice_magic_ball/shared/shared.dart';
import 'package:surf_practice_magic_ball/widgets/bottom_hint.dart';
import 'package:surf_practice_magic_ball/widgets/centered_positioned.dart';

class MagicBallScreen extends StatefulWidget {
  const MagicBallScreen({Key? key}) : super(key: key);

  @override
  State<MagicBallScreen> createState() => _MagicBallScreenState();
}

class _MagicBallScreenState extends State<MagicBallScreen> {
  late final MagicBallBloc _bloc;

  @override
  void initState() {
    _bloc = MagicBallBloc(
      repository: MagicBallApiRepository(),
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = _isDarkMode(context);

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors:
              isDarkMode ? AppColors.darkBgGradient : AppColors.lightBgGradient,
        ),
      ),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            children: <Widget>[
              Expanded(
                child: Center(
                  child: GestureDetector(
                    onTap: () {
                      _bloc.add(const MagicBallEvent.getAnswer());
                    },
                    child: Stack(
                      children: <Widget>[
                        isDarkMode
                            ? Image.asset(AssetsPaths.darkBall)
                            : Image.asset(AssetsPaths.ball),
                        Positioned.fill(
                          child: Align(
                            child: SvgPicture.asset(
                              AssetsPaths.stars,
                              width: 244,
                            ),
                          ),
                        ),
                        BlocBuilder<MagicBallBloc, MagicBallState>(
                          bloc: _bloc,
                          builder: (context, state) {
                            return switch (state) {
                              MagicBallInitialState() => CenteredPositioned(
                                  child: SvgPicture.asset(
                                    AssetsPaths.smallStars,
                                    width: 286,
                                  ),
                                ),
                              MagicBallDataState() => CenteredPositioned(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(200),
                                      gradient: RadialGradient(
                                        colors: isDarkMode
                                            ? AppColors.darkBallBgGradient
                                            : AppColors.lightBallBgGradient,
                                      ),
                                    ),
                                    child: Align(
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 30.0,
                                        ),
                                        child: Text(
                                          state.answer.reading,
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontSize: 32,
                                            color: isDarkMode
                                                ? AppColors.darkBallTextColor
                                                : AppColors.lightBallTextColor,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              MagicBallLoadingState() => CenteredPositioned(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(200),
                                      gradient: RadialGradient(
                                        colors: isDarkMode
                                            ? AppColors.darkBallBgGradient
                                            : AppColors.lightBallBgGradient,
                                      ),
                                    ),
                                  ),
                                ),
                              MagicBallErrorState() => CenteredPositioned(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(600),
                                      gradient: RadialGradient(
                                        stops: const [0.3, 0.8],
                                        colors: AppColors.errorBallBgGradient,
                                      ),
                                    ),
                                    child: Stack(
                                      children: <Widget>[
                                        Align(
                                          child: SvgPicture.asset(
                                            AssetsPaths.stars,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                1.6,
                                          ),
                                        ),
                                        Align(
                                          child: SvgPicture.asset(
                                            AssetsPaths.smallStars,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                1.5,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                            };
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              isDarkMode
                  ? Image.asset(AssetsPaths.darkEllipse)
                  : Image.asset(AssetsPaths.ellipse),
              const SizedBox(
                height: 50,
              ),
              const BottomHint(),
            ],
          ),
        ),
      ),
    );
  }

  bool _isDarkMode(BuildContext context) {
    final brightness = MediaQuery.of(context).platformBrightness;
    final isDarkMode = brightness == Brightness.dark;

    return isDarkMode;
  }
}
