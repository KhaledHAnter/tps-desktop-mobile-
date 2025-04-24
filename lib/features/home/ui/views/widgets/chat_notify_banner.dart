import 'package:flutter/material.dart';

class ChatNotifyBanner extends StatelessWidget {
  const ChatNotifyBanner({
    super.key,
    required this.show,
    this.size,
  });

  final bool show;
  final double? size;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: show,
      child: Positioned(
          left: 2,
          child: Container(
            width: size ?? 15,
            height: size ?? 15,
            decoration: const BoxDecoration(
                color: Colors.redAccent, shape: BoxShape.circle),
          )),
    );
  }
}
