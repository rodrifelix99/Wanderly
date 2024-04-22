import 'package:flutter/material.dart';
import 'package:wanderly/enums/activity_enum.dart';

class ActivityList extends StatelessWidget {
  final void Function(Activity) onTap;

  const ActivityList({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.builder(
        itemCount: Activity.values.length,
        itemBuilder: (context, index) {
          final activity = Activity.values[index];
          return ListTile(
            leading: Icon(activity.icon),
            title: Text(activity.tr()),
            onTap: () => onTap(activity),
          );
        },
      ),
    );
  }
}
