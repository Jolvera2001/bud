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
    barrierColor: Colors.black54,
    transitionDuration: Duration(milliseconds: 500),
    pageBuilder:
        (_, _, _) => Align(
          alignment: Alignment.centerRight,
          child: Material(
            color: Colors.white,
            elevation: 24,
            child: SizedBox(
              height: double.infinity,
              width: MediaQuery.of(context).size.width * 0.3,
              child: form, // TODO: handle this later for dynamic form providing thingy
            ),
          ),
        ),
    transitionBuilder: (_, anim, _, child) {
      return SlideTransition(
        position: Tween(begin: Offset(1, 0), end: Offset(0, 0))
          .animate(CurvedAnimation(parent: anim, curve: Curves.easeOutCubic)),
        child: child,
      );
    },
  );
}
