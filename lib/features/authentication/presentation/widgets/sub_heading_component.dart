import 'package:flutter/material.dart';

class SubHeadingComponent extends StatelessWidget {
  const SubHeadingComponent({
    super.key,
    required this.subHeading,
  });

  final String subHeading;

  @override
  Widget build(BuildContext context) {
    return Text(
      subHeading,
      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
            color: Colors.grey,
          ),
    );
  }
}
