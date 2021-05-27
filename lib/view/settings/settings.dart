import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:magane_money/main_view/background.dart';
import 'package:magane_money/view/settings/settings_component/account_information/account_infor.dart';
import 'package:magane_money/string/string_used.dart';
import 'package:magane_money/view/settings/settings_component/introduce.dart';


class Settings extends StatelessWidget {

  Widget introButton(BuildContext context) {
    return ListTile(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(
          builder: (_) => AccountInformation(),
        )
        );
      },
      trailing: IconButton(
        icon: Icon(Icons.arrow_forward),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(
              builder: (_) => Introduce(),
            )
          );
        },
      ),
      title: Text(introBtn),
    );
  }

  Widget accountInforButton(BuildContext context) {
    return ListTile(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(
            builder: (_) => AccountInformation(),
        )
        );
      },
      trailing: IconButton(
        icon: Icon(Icons.arrow_forward),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(
            builder: (_) => AccountInformation(),
          )
          );
        },
      ),
      title: Text(accountInforBtn),
    );
  }

  Widget feedBackButton(BuildContext context) {
    return ListTile(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(
          builder: (_) => AccountInformation(),
        )
        );
      },
      trailing: IconButton(
        icon: Icon(Icons.arrow_forward),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(
            builder: (_) => Introduce(),
          )
          );
        },
      ),
      title: Text(feedBackBtn),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          //BackgroundMain(),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              accountInforButton(context),
              introButton(context),
              feedBackButton(context),
            ],
          ),
        ],
      ),
    );
  }
}