import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:outlook/constants.dart';
import 'package:websafe_svg/websafe_svg.dart';

import 'CounterBadge.dart';

class SideMenuItem extends StatelessWidget {
  final bool isActive, isHover, showBorder;
  final int itemCount;
  final String iconSrc, title;
  final VoidCallback press;

  const SideMenuItem(
      {Key key,
      this.isActive,
      this.isHover = false,
      this.showBorder = true,
      this.itemCount,
      @required this.iconSrc,
      @required this.title,
      @required this.press})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: kDefaultPadding),
      child: InkWell(
        onTap: press,
        child: Row(
          children: [
            (isActive || isHover)
                ? WebsafeSvg.asset("asset/Icons/Angle right.svg", width: 15)
                : SizedBox(width: 15),
            SizedBox(
              width: kDefaultPadding / 4,
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(bottom: 15, right: 5),
                decoration: showBorder
                    ? BoxDecoration(
                        border: Border(
                          bottom: BorderSide(color: Color(0xFFDFE2EF)),
                        ),
                      )
                    : null,
                child: Row(
                  children: [
                    WebsafeSvg.asset(
                      iconSrc,
                      height: 20,
                      color: (isActive || isHover) ? kPrimaryColor : kGrayColor,
                    ),
                    SizedBox(
                      width: kDefaultPadding * 0.75,
                    ),
                    Text(
                      title,
                      style: Theme.of(context).textTheme.button.copyWith(
                            color:
                                (isActive || isHover) ? kTextColor : kGrayColor,
                          ),
                    ),
                    Spacer(),
                    if (itemCount != null) CounterBadge(count: itemCount)
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
