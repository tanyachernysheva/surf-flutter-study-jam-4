part of 'magic_ball_bloc.dart';

@immutable
sealed class MagicBallState {
  const MagicBallState();

  const factory MagicBallState.initial() = MagicBallInitialState;
  const factory MagicBallState.data(Answer answer) = MagicBallDataState;
  const factory MagicBallState.loading() = MagicBallLoadingState;
  const factory MagicBallState.error(String message) = MagicBallErrorState;
}

final class MagicBallInitialState implements MagicBallState {
  const MagicBallInitialState();
}

final class MagicBallDataState implements MagicBallState {
  final Answer answer;

  const MagicBallDataState(this.answer);
}

final class MagicBallLoadingState implements MagicBallState {
  const MagicBallLoadingState();
}

final class MagicBallErrorState implements MagicBallState {
  final String message;

  const MagicBallErrorState(this.message);
}
