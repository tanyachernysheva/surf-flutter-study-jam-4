part of 'magic_ball_bloc.dart';

@immutable
sealed class MagicBallEvent {
  const MagicBallEvent();
  const factory MagicBallEvent.getAnswer() = MagicBallGetAnswerEvent;
}

final class MagicBallGetAnswerEvent implements MagicBallEvent {
  const MagicBallGetAnswerEvent();
}
