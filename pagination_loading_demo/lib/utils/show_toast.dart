import 'package:flutter/material.dart';

Future<void> showToast(BuildContext context, String msg) async {
  OverlayState overlayState = Overlay.of(context);
  OverlayEntry? entry = OverlayEntry(
    builder: (context) => Positioned(
      top: 100,
      left: MediaQuery.of(context).size.width / 2 - 50, 
      child: Material(
        type: MaterialType.transparency,
        child: Container(
          height: 30,
          width: 100,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(msg, style: TextStyle(color: Colors.white),),
        )
      )
    )
  );
  overlayState.insert(entry);
  await Future.delayed(Duration(seconds: 3));
  entry.remove();
  entry = null;
}