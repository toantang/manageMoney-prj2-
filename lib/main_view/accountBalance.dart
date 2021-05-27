import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:magane_money/main_view/account_balance_component/show_infor_account_balance.dart';

class AccountBalance extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: Text("số dư tài khoản: ",),
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(
            builder: (context) {
              return ShowInforAccountBalance();
            }
          )
        );
      },
    );
  }
}