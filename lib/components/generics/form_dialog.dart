import 'package:flutter/material.dart';

Future<T?> showFormDialog<T>({
  required BuildContext context,
  required String formLabel,
  required StatefulWidget form,
}) {
  return showGeneralDialog<T>(
    context: context,
    barrierDismissible: true,
    barrierLabel: formLabel,
    pageBuilder:
        (_, _, _) => Align(
          alignment: Alignment.centerRight,
          child: Material(
            color: Colors.transparent,
            child: Container(
              height: double.infinity,
              width: MediaQuery.of(context).size.width * 0.3,
              decoration: BoxDecoration(
                color: Theme.of(context).dialogTheme.backgroundColor,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10.0,
                    offset: Offset(-5, 0),
                  ),
                ],
              ),
              child:
                  form, // TODO: handle this later for dynamic form providing thingy
            ),
          ),
        ),
    transitionBuilder: (_, anim, _, child) {
      return SlideTransition(
        position: Tween(begin: Offset(1, 0), end: Offset(0, 0)).animate(anim),
        child: child,
      );
    },
  );
}
