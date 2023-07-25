import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:surf_practice_magic_ball/models/answer.dart';

abstract interface class MagicBallBaseRepository {
  Future<Answer> getAnswer();
}

final class MagicBallFakeRepository implements MagicBallBaseRepository {
  @override
  Future<Answer> getAnswer() async {
    await Future.delayed(
      const Duration(seconds: 2),
    );

    return const Answer(reading: 'no');
  }
}

final class MagicBallApiRepository implements MagicBallBaseRepository {
  @override
  Future<Answer> getAnswer() async {
    final url = Uri.http('www.eightballapi.com', '/api');

    final response = await http.get(url);

    final Map<String, dynamic> json =
        jsonDecode(response.body) as Map<String, dynamic>;

    return Answer.fromJson(json);
  }
}
