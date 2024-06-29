import 'package:flutter/material.dart';

class BuildFloatingButton extends StatelessWidget {
  final IconData icon;
  final String tag;
  final String tooltip;
  final void Function() onPressed;

  const BuildFloatingButton({Key? key, required this.icon, required this.tag, required this.tooltip, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      heroTag: tag,
      shape: const CircleBorder(),
      backgroundColor: Colors.lightBlue,
      child: Icon(icon, color: Colors.white),
      tooltip: tooltip,
      onPressed: onPressed,
    );
  }
}
