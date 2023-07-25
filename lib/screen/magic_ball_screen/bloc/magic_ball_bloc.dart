import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:surf_practice_magic_ball/models/answer.dart';
import 'package:surf_practice_magic_ball/repositories/magic_ball_repository.dart';

part 'magic_ball_event.dart';
part 'magic_ball_state.dart';

class MagicBallBloc extends Bloc<MagicBallEvent, MagicBallState> {
  final MagicBallBaseRepository repository;

  MagicBallBloc({
    required this.repository,
  }) : super(const MagicBallInitialState()) {
    on<MagicBallGetAnswerEvent>(_getAnswer);
  }

  Future<void> _getAnswer(
      MagicBallGetAnswerEvent event, Emitter<MagicBallState> emit) async {
    try {
      emit(const MagicBallState.loading());

      final Answer answer = await repository.getAnswer();

      emit(MagicBallState.data(answer));
    } catch (e) {
      emit(MagicBallState.error(e.toString()));
    }
  }
}
