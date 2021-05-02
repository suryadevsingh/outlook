import 'package:flutter/material.dart';

import 'EmailScreen.dart';
import 'SideMenu.dart';
import 'list_Of_Emails.dart';
import 'responsive.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Scaffold(
      body: Responsive(
        mobile: ListOfEmails(),
        tablet: Row(
          children: [
            Expanded(
              child: ListOfEmails(),
              flex: 6,
            ),
            Expanded(
              child: EmailScreen(),
              flex: 9,
            ),
          ],
        ),
        desktop: Row(
          children: [
            Expanded(
              child: SideMenu(),
              flex: _size.width > 1120 ? 2 : 4,
            ),
            Expanded(
              child: ListOfEmails(),
              flex: _size.width > 1120 ? 3 : 5,
            ),
            Expanded(
              child: EmailScreen(),
              flex: _size.width > 1120 ? 6 : 10,
            ),
          ],
        ),
      ),
    );
  }
}
