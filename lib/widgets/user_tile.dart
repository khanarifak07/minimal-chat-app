import 'package:flutter/material.dart';

class UserTile extends StatelessWidget {
  final String text;
  final Function() ontap;
  const UserTile({super.key, required this.text, required this.ontap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          padding: const EdgeInsets.all(30),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Theme.of(context).colorScheme.secondary,
          ),
          child: Row(
            children: [
              const Icon(Icons.person),
              const SizedBox(width: 20),
              Text(text),
            ],
          ),
        ),
      ),
    );
  }
}
