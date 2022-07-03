import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../presentation/login/login_presenter.dart';

class RoundedButton extends StatelessWidget {
  const RoundedButton({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final presenter = Get.find<LoginPresenter>();
    return InkWell(
      onTap: onPressed,
      child: Material(
        color: Theme.of(context).primaryColorLight,
        elevation: 4,
        borderRadius: const BorderRadius.all(Radius.circular(1000)),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Center(
            child: Text(text),
          ),
        ),
      ),
    );
  }
}