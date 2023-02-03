import 'package:flutter/material.dart';

class ListSwitchPanel extends StatefulWidget {
  const ListSwitchPanel({
    Key? key,
  }) : super(key: key);

  @override
  State<ListSwitchPanel> createState() => _ListSwitchPanelState();
}

class _ListSwitchPanelState extends State<ListSwitchPanel> {
  bool taskBtnEnabled = true;
  bool boardsBtnEnabled = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            TextButton(
              style: TextButton.styleFrom(padding: EdgeInsets.zero),
              onPressed: taskBtnEnabled
                  ? (() {
                      setState(() {
                        taskBtnEnabled = false;
                        boardsBtnEnabled = true;
                      });
                    })
                  : null,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white),
                      child: const Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        child: Text(
                          '12',
                          style: TextStyle(fontSize: 15),
                        ),
                      )),
                  const Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text(
                      'Tasks',
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.w300),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        Column(
          children: [
            TextButton(
              style: TextButton.styleFrom(padding: EdgeInsets.zero),
              onPressed: boardsBtnEnabled
                  ? (() {
                      setState(() {
                        taskBtnEnabled = true;
                        boardsBtnEnabled = false;
                      });
                    })
                  : null,
              child: Row(
                children: [
                  Container(
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          color: Colors.white),
                      child: const Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                        child: Text(
                          '3',
                          style: TextStyle(fontSize: 15),
                        ),
                      )),
                  const Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text(
                      'Boards',
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.w300),
                    ),
                  ),
                ],
              ),
            ),
          ],
        )
      ],
    );
  }
}
