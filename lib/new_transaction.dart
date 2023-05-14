import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addtrans;
  NewTransaction(this.addtrans);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final TitleController = TextEditingController();

  final SubjectController = TextEditingController();
  DateTime _selectdate = DateTime.now();
  void _submitData() {
    final enteredTitle = TitleController.text;
    final enteredSubject = SubjectController.text;
    if (enteredTitle.isEmpty || enteredSubject.isEmpty || _selectdate == null) {
      return;
    }
    widget.addtrans(enteredTitle, enteredSubject, _selectdate);
    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2020),
            lastDate: DateTime.now())
        .then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _selectdate = pickedDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Card(
          elevation: 10,
          child: Container(
            margin: EdgeInsets.only(
                top: 10,
                left: 10,
                right: 10,
                bottom: MediaQuery.of(context).viewInsets.bottom + 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                TextField(
                  decoration: InputDecoration(labelText: 'Title'),
                  cursorHeight: 25,
                  controller: TitleController,
                  onSubmitted: (_) => _submitData(),
                  // onChanged: (val) {
                  //   titleInput = val;
                  // },
                ),
                TextField(
                  decoration: InputDecoration(labelText: 'Subject'),
                  cursorHeight: 25,
                  controller: SubjectController,

                  onSubmitted: (_) => _submitData(),
                  // onChanged: (val) {
                  //   amountInput = val;
                  // },
                ),
                Container(
                  height: 80,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Text(_selectdate == null
                            ? 'No date chosen'
                            : DateFormat.yMd().format(_selectdate)),
                      ),
                      TextButton(
                        onPressed: _presentDatePicker,
                        child: Text(
                          'choose date',
                          style: TextStyle(
                              color: Colors.purple,
                              fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: _submitData,
                  child: Text(
                    'Add Transaction',
                    style: TextStyle(color: Colors.white),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
