import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:surf_practice_magic_ball/shared/shared.dart';

class BottomHint extends StatelessWidget {
  const BottomHint({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Text(
      kIsWeb ? 'Нажмите на шар' : 'Нажмите на шар\nили потрясите телефон',
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 16,
        color: AppColors.hintTextColor,
      ),
    );
  }
}
