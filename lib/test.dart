import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListDataX extends GetxController {
  List<int> numbers = List<int>.from([0,1,2,3]);

  void httpCall() async {
    await Future.delayed(Duration(seconds: 1),
            () => numbers.add(numbers.last + 1)
    );
    update();
  }

  void reset() {
    numbers = numbers.sublist(0, 3);
    update();
  }
}

class GetXListviewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ListDataX dx = Get.put(ListDataX());
    print('Page ** rebuilt');
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 8,
              child: GetBuilder<ListDataX>(
                builder: (_dx) => ListView.builder(
                    itemCount: _dx.numbers.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text('Number: ${_dx.numbers[index]}'),
                      );
                    }),
              ),
            ),
            Expanded(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    RaisedButton(
                      child: Text('Http Request'),
                      onPressed: dx.httpCall,
                    ),
                    RaisedButton(
                      child: Text('Reset'),
                      onPressed: dx.reset,
                    )
                  ],
                )
            )
          ],
        ),
      ),
    );
  }
}