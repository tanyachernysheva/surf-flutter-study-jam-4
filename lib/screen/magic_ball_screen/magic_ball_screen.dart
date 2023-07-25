import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:surf_practice_magic_ball/repositories/magic_ball_repository.dart';
import 'package:surf_practice_magic_ball/screen/magic_ball_screen/bloc/magic_ball_bloc.dart';

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
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.white, Color.fromRGBO(210, 210, 254, 1)]),
      ),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            children: [
              Expanded(
                child: Center(
                  child: GestureDetector(
                    onTap: () {
                      _bloc.add(const MagicBallEvent.getAnswer());
                    },
                    child: Stack(
                      children: [
                        Image.asset('assets/ball.png'),
                        Positioned.fill(
                          child: Align(
                            child: SvgPicture.asset(
                              'assets/star.svg',
                              width: 244,
                            ),
                          ),
                        ),
                        BlocBuilder<MagicBallBloc, MagicBallState>(
                            bloc: _bloc,
                            builder: (context, state) {
                              return switch (state) {
                                MagicBallInitialState() => Positioned.fill(
                                    child: Align(
                                      child: SvgPicture.asset(
                                        'assets/small star.svg',
                                        width: 286,
                                      ),
                                    ),
                                  ),
                                MagicBallDataState() => Positioned.fill(
                                    child: Align(
                                      child: Padding(
                                        padding: const EdgeInsets.all(16.0),
                                        child: Text(
                                          state.answer.reading,
                                          textAlign: TextAlign.center,
                                          style: const TextStyle(
                                            fontSize: 32,
                                            color: Color.fromRGBO(
                                                108, 105, 140, 1),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                MagicBallLoadingState() => Positioned.fill(
                                    child: Align(
                                      child: Container(
                                        decoration: const BoxDecoration(),
                                      ),
                                    ),
                                  ),
                                MagicBallErrorState() => Text(
                                    state.message,
                                  ),
                              };
                            }),
                      ],
                    ),
                  ),
                ),
              ),
              SvgPicture.asset('assets/Ellipse 7.svg'),
              const SizedBox(
                height: 50,
              ),
              const Text(
                'Нажмите на шар\nили потрясите телефон',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Color.fromRGBO(114, 114, 114, 1),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
