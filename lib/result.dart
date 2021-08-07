import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final VoidCallback resetHandler;

  Result({
    required this.resultScore,
    required this.resetHandler,
  });

  String get choiceText {
    String result;

    if (resultScore >= 179) {
      result = 'Pilihan yang tepat';
    } else if (resultScore >= 159) {
      result = 'Pilihan yang bagus';
    } else if (resultScore >= 139) {
      result = 'Pilihan yang cukup bagus';
    } else {
      result = 'Pilihan yang buruk';
    }

    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text(
                'Score anda adalah:',
                style: TextStyle(
                  fontSize: 24,
                ),
              ),
              Text(
                ' $resultScore',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ]),
            Text(
              choiceText,
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            Container(
              child: TextButton(
                child: Text('Reset'),
                onPressed: resetHandler,
              ),
            ),
          ]),
    );
  }
}
