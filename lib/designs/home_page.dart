import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:tudocheck/model.dart';

import '../provider/provider_class.dart';

import 'cart_page.dart';

class GroceriesList extends StatefulWidget {
  const GroceriesList({Key? key}) : super(key: key);

  @override
  State<GroceriesList> createState() => _GroceriesListState();
}

class _GroceriesListState extends State<GroceriesList> {
  final _textFieldController = TextEditingController();
  String newTask = '';
  //creating initState() for adding listener to controller
  @override
  void initState() {
    super.initState();
    _textFieldController.addListener(() {
      newTask = _textFieldController.text;
    });
  }
  //disposing the controller
  @override
  void dispose() {
    _textFieldController.dispose();
    super.dispose();
  }
  void _submit() {
    //we aren't interested in updating our ui so listen will be false
    Provider.of<TodoProvider>(context, listen:    false).addTask(newTask);
    //cancelling the dialog
    Navigator.pop(context);
    _textFieldController.clear();
  }
  @override
  Widget build(BuildContext context) {

    Future<void> _showAddTextDialog() async {
      return showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text("Add a new Task"),
              content: TextField(
                autofocus: true,
                controller: _textFieldController,
                decoration: const InputDecoration(hintText: "Add New Task"),
                onSubmitted: (_) => _submit(),
              ),
              actions: [
                ElevatedButton(
                  onPressed: _submit,
                  child: const Text("Submit"),
                  style: ElevatedButton.styleFrom(
                      minimumSize: const Size(120, 40)),
                )
              ],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              actionsAlignment: MainAxisAlignment.center,
            );
          });
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text("ToDo App"),
      ),
      body: TodoAction(),
      floatingActionButton: FloatingActionButton(
        onPressed: (() {
          _showAddTextDialog();
        }),
        child: const Icon(Icons.add),
        tooltip: "Add a todo",
      ),
    );
  }
}