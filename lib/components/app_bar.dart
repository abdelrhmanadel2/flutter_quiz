import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Color? color;
  final hasSearch, automaticallyImplyLeading;
  final Function(String)? searchFilter;

  final List<Widget>? actions;
  final onBackPress;
  final bottom;
  final Widget? titleIcon;
  final Widget? leadingIcon;
  final bool titleCenter;
  const AppBarWidget(
      {Key? key,
      this.title = "",
      this.titleIcon,
      this.leadingIcon,
      this.titleCenter = false,
      this.hasSearch = false,
      this.onBackPress,
      this.searchFilter,
      this.actions,
      this.color,
      this.bottom,
      this.automaticallyImplyLeading = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return AppBar(
      backgroundColor: color ?? Get.theme.cardColor,
      leading: leadingIcon,
      // IconButton(
      //   icon: const FaIcon(FontAwesomeIcons.lightbulb),
      //   onPressed: Get.find<ThemeService>().switchTheme,
      // ),
      centerTitle: titleCenter,
      title: titleIcon ??
          Container(
            padding: const EdgeInsets.all(7),
            decoration: (title.isNotEmpty)
                ? BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                  )
                : null,
            child: Text(
              title,
              style: const TextStyle(color: Colors.black),
            ),
          ),
      actions: [...?actions],
    );

    // AppBar(
    //   automaticallyImplyLeading: automaticallyImplyLeading,
    //   elevation: hasElevation ? 1 : 0,
    //   centerTitle: true,
    //   backgroundColor: color ?? theme.backgroundColor,
    //   actions: actions,
    //   leading: hasBackButton
    //       ? IconButton(
    //           padding: EdgeInsets.symmetric(horizontal: 10),
    //           onPressed: () {
    //             (onBackPress != null) ? onBackPress() : Get.back();
    //           },
    //           icon: Icon(
    //             Icons.arrow_back_ios,
    //           ),
    //         )
    //       : Container(),
    //   title: Text(
    //     title ?? "",
    //     // style: extend(Styles.kTextStyleHeadline3, TextStyle(color: theme.accentColor)),
    //   ),
    //   bottom: (hasSearch)
    //       ? PreferredSize(
    //           preferredSize: Size.fromHeight(60),
    //           child: SearchWidget(
    //             // text: searchText ?? "",
    //             onChanged: onChanged ?? (str) {},
    //             hintText: 'Search ',
    //           ),
    //         )
    //       : PreferredSize(
    //           child: SizedBox(),
    //           preferredSize: Size.zero,
    //         ),
    // );
  }

  @override
  Size get preferredSize => const Size(double.infinity, 60);
}
