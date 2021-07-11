import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

Widget todoCardSlide(Widget child, {onDel, done, unDone}) {
  return Slidable(
    closeOnScroll: true,
    actionPane: SlidableDrawerActionPane(),
    child: child,
    secondaryActions: <Widget>[
      IconSlideAction(
        caption: 'Done',
        color: Colors.green[300],
        icon: Icons.done,
        onTap: done,
      ),
      IconSlideAction(
        caption: 'In Progress',
        color: Colors.amber[300],
        icon: Icons.workspaces_sharp,
        onTap: unDone,
      ),
      IconSlideAction(
        caption: 'Delete',
        color: Colors.red,
        icon: Icons.delete,
        onTap: onDel,
      ),
    ],
  );
}
