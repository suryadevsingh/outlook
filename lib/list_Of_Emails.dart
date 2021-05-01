import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:outlook/EmailCard.dart';
import 'package:outlook/constants.dart';
import 'package:outlook/responsive.dart';
import 'package:websafe_svg/websafe_svg.dart';

import 'Email.dart';
import 'EmailScreen.dart';
import 'SideMenu.dart';

class ListOfEmails extends StatefulWidget {
  const ListOfEmails({
    Key key,
  }) : super(key: key);

  @override
  _ListOfEmailsState createState() => _ListOfEmailsState();
}

class _ListOfEmailsState extends State<ListOfEmails> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 250),
        child: SideMenu(),
      ),
      body: Container(
        padding: EdgeInsets.only(top: kIsWeb ? kDefaultPadding : 0),
        color: kBgDarkColor,
        child: SafeArea(
          right: false,
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                child: Row(
                  children: [
                    if (!Responsive.isDesktop(context))
                      IconButton(
                          icon: Icon(Icons.menu),
                          onPressed: () {
                            _scaffoldKey.currentState.openDrawer();
                          }),
                    if (!Responsive.isDesktop(context))
                      SizedBox(
                        width: 5,
                      ),
                    Expanded(
                        child: TextField(
                      onChanged: (value) {},
                      decoration: InputDecoration(
                          hintText: "Search",
                          fillColor: kBgLightColor,
                          filled: true,
                          suffixIcon: Padding(
                            padding:
                                const EdgeInsets.all(kDefaultPadding * 0.75),
                            child: WebsafeSvg.asset(
                              "assets/Icons/Search.svg",
                              width: 24,
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide: BorderSide.none,
                          )),
                    )),
                  ],
                ),
              ),
              SizedBox(
                height: kDefaultPadding,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                child: Row(
                  children: [
                    WebsafeSvg.asset(
                      "asset/Icons/Angle down.svg",
                      width: 16,
                      color: Colors.black,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "Sort by date",
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                    Spacer(),
                    MaterialButton(
                      onPressed: () {},
                      minWidth: 20,
                      child:
                          WebsafeSvg.asset("assets/Icons/Sort.svg", width: 16),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: kDefaultPadding,
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: emails.length,
                  itemBuilder: (context, index) => EmailCard(
                    isActive: Responsive.isMobile(context) ? false : index == 0,
                    email: emails[index],
                    press: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              EmailScreen(email: emails[index]),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
