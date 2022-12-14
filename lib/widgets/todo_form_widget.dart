import 'package:flutter/material.dart';

class FormWidget extends StatelessWidget {
  final String title;
  final String description;
  final ValueChanged<String> onChangedTitle;
  final ValueChanged<String> onChangedDescription;
  final VoidCallback onSavedTodo;
  const FormWidget({
    Key? key,
    this.title='',
    this.description='',
    required this.onChangedTitle,
    required this.onChangedDescription,
    required this.onSavedTodo,


  }) : super(key: key);

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        buildTitle(),
        SizedBox(height: 8),
        buildDescription(),
        SizedBox(height: 32),
        buildButton(),

      ],
    ),
  );
      Widget buildTitle() => TextFormField(
        initialValue: title,
        onChanged: onChangedTitle,
        validator: (title){
          if(title!.isEmpty){
            return'The title must be filled';

          }
          return null;
        },
        decoration: InputDecoration(
          border: UnderlineInputBorder(),
          labelText: 'Title',


        ),

      );
  Widget buildDescription() => TextFormField(
    maxLines: 3,
    initialValue: description,
    onChanged: onChangedDescription,
    decoration: InputDecoration(
      border: UnderlineInputBorder(),
      labelText: 'Description',


    ),

  );
  
  Widget buildButton() => SizedBox(
    width: double.infinity,
      child:ElevatedButton(
        style: ButtonStyle( backgroundColor: MaterialStateProperty.all(Colors.lightBlueAccent)),
        onPressed: onSavedTodo,
        child: Text('save'),
      ),
    );
}
