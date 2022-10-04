

import 'package:flutter/material.dart';
import 'package:tick2do/widgets/todo_form_widget.dart';
// class AddTodoDialogWidget extends StatefulWidget {
//
//   @override
//   State<AddTodoDialogWidget> createState() => _AddTodoDialogWidgetState();
// }
//
// class _AddTodoDialogWidgetState extends State<AddTodoDialogWidget> {
//   final _formKey= GlobalKey<FormState>();
//   String title= '';
//   String description='';
//   @override
//   Widget build(BuildContext context) => AlertDialog(
//   content: Column(
//         mainAxisSize: MainAxisSize.min,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             'Add a Task',
//             style: TextStyle(
//               fontWeight: FontWeight.bold,
//               fontSize: 22
//             ),),
//
//         ],
//       ),
//
//   );
//   }



//
class AddTodoDialogWidget extends StatefulWidget {

  @override
  _AddTodoDialogWidgetState createState() => _AddTodoDialogWidgetState();
}

class _AddTodoDialogWidgetState extends State<AddTodoDialogWidget> {
 final _formKey= GlobalKey<FormState>();
 String title= '';
 String description='';

  @override
  Widget build(BuildContext context) =>
    AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Add a Task',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18
            ),
          ),
          const SizedBox(height: 8),
          FormWidget(
            onChangedTitle:(title)=> setState(()=> this.title=title),
            onChangedDescription: (description)=> setState(()=> this.description=description),
            onSavedTodo: () {},
          ),
        ],
      ),
    );
  }




