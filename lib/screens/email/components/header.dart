import 'package:flutter/material.dart';
import 'package:outlook/responsive.dart';
import 'package:websafe_svg/websafe_svg.dart';
import 'package:flutter/cupertino.dart';
import 'package:outlook/constants.dart';

class Header extends StatelessWidget {
  const Header({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(kDefaultPadding),
      child: Row(
        children: [
          // We need this back button on mobile only
          if (Responsive.isMobile(context)) BackButton(),
          IconButton(
            tooltip: "Trash",
            icon: Icon(CupertinoIcons.trash),
            onPressed: () {},
          ),
          IconButton(
            tooltip: "Reply",
            icon: Icon(CupertinoIcons.reply),
            onPressed: () {},
          ),
          IconButton(
            tooltip: "Reply all",
            icon: Icon(CupertinoIcons.reply_all),
            onPressed: () {},
          ),
          IconButton(
            tooltip: "Transfer",
            icon: Icon(CupertinoIcons.arrowshape_turn_up_right),
            onPressed: () {},
          ),
          Spacer(),
          // We don't need print option on mobile
          if (Responsive.isDesktop(context))
            IconButton(
              tooltip: "Printer",
              icon: Icon(CupertinoIcons.printer),
              onPressed: () {},
            ),
          IconButton(
            tooltip: "Markup",
            icon: Icon(CupertinoIcons.bookmark),
            onPressed: () {},
          ),
          IconButton(
            tooltip: "More vertical",
            icon: Icon(CupertinoIcons.ellipsis_vertical),
          ),
        ],
      ),
    );
  }
}
