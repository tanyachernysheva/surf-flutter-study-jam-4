import 'dart:convert';

import 'package:surf_practice_magic_ball/models/answer.dart';
import 'package:http/http.dart' as http;

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

    final Map<String, dynamic> json = jsonDecode(response.body);

    return Answer.fromJson(json);
  }
}
