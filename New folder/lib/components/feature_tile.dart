import 'package:flutter/material.dart';

class FeatureTile extends StatelessWidget {
  final String title;
  final String? subTitle;
  final IconData? leadingIcon;
  final Widget? tralingIcon;
  final Function()? navigation;

  const FeatureTile({super.key, required this.title, this.leadingIcon, this.tralingIcon, this.subTitle, this.navigation});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: navigation,
      child: ListTile(
        leading: (leadingIcon != null)
            ? Container(
                padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 10),
                width: 45,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.purple,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Align(alignment: Alignment.center, child: Icon(leadingIcon, color: Colors.white)))
            : null,
        title: Text(title),
        trailing: (tralingIcon != null) ? tralingIcon : null,
        subtitle: (subTitle != null) ? Text(subTitle!) : null,
      ),
    );
  }
}
