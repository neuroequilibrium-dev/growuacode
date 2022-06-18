import 'package:flutter/material.dart';

Future showErrorDialog(BuildContext context, String titleTxt, String bodyTxt, String btnTxt, {VoidCallback? action}) {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              constraints: const BoxConstraints(),
              padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(titleTxt, style: const TextStyle(fontFamily: 'Nunito', fontWeight: FontWeight.w800)),
                  const Divider(
                    height: 20,
                    color: Colors.black,
                  ),
                  Text(
                    bodyTxt,
                    style: const TextStyle(fontFamily: 'Nunito', fontWeight: FontWeight.w500),
                  ),
                  const Divider(height: 30, color: Colors.transparent),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        TextButton(
                          onPressed: () {
                            if (action != null) {
                              action();
                            }
                            Navigator.pop(context);
                          },
                          child: Text(
                            btnTxt,
                            style: const TextStyle(
                              fontFamily: 'Nunito',
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      );
    },
  );
}
