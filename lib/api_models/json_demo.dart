// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:todo_crud_api/todo_model.dart';
//
//
// class ManageTask extends StatefulWidget {
//   final Task? task;
//   const ManageTask({Key? key,this.task}) : super(key: key);
//   @override
//   _ManageTaskState createState() => _ManageTaskState();
// }
//
// class _ManageTaskState extends State<ManageTask> {
//   var name = TextEditingController();
//   var description = TextEditingController();
//   var id;
//   DateTime? dueDate;
//   var formKey = GlobalKey<FormState>();
//   AutovalidateMode autoValidateMode = AutovalidateMode.disabled;
//   bool isEditMode = false;
//
//   @override
//   void initState() {
//     super.initState();
//     if(widget.task!=null){
//       isEditMode = true;
//       id = widget.task!.id;
//       name.text = widget.task!.name;
//       description.text = widget.task!.description;
//       dueDate = widget.task!.due;
//     }
//
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(isEditMode ? "Update Task" : "Create Task"),
//       ),
//       body: Form(
//         key: formKey,
//         autovalidateMode: autoValidateMode,
//         child: Padding(
//           padding: const EdgeInsets.all(20.0),
//           child: Column(
//             children: [
//               TextFormField(
//                 decoration: InputDecoration(
//                     labelText: 'Title', border: OutlineInputBorder()),
//                 controller: name,
//                 validator: (String? value) {
//                   if (value!.isEmpty)
//                     return "This field is required";
//                   else
//                     return null;
//                 },
//               ),
//               SizedBox(
//                 height: 20,
//               ),
//               TextFormField(
//                 decoration: InputDecoration(
//                     labelText: 'Description', border: OutlineInputBorder()),
//                 controller: description,
//                 validator: (String? value) {
//                   if (value!.isEmpty)
//                     return "This field is required";
//                   else
//                     return null;
//                 },
//               ),
//               SizedBox(
//                 height: 20,
//               ),
//               GestureDetector(
//                 onTap: () async {
//                   DateTime? selectedDate = await showDatePicker(
//                       context: context,
//                       initialDate: DateTime.now(),
//                       firstDate: DateTime.now(),
//                       lastDate: DateTime(3000));
//                   print(selectedDate);
//                   if (selectedDate != null) {
//                     dueDate = selectedDate;
//                     setState(() {});
//                   }
//                 },
//                 child: Container(
//                   height: 50,
//                   width: double.infinity,
//                   decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(5),
//                       border: Border.all(color: Colors.grey)
//                   ),
//                   child: Center(child: Text(dueDate==null  ? "Select Date Time" : dueDate!.toIso8601String())),
//                 ),
//               ),
//               ElevatedButton(
//                   onPressed: () async {
//                     if (formKey.currentState!.validate()) {
//                       if(dueDate == null) {
//                         ScaffoldMessenger.of(context).
//                         showSnackBar(SnackBar(content: Text("You must select due date")));
//                       } else {
//                         if(id!=null)
//                         {
//                           showDialog(context: context, builder: (ctx){
//                             return AlertDialog(
//                               title: SizedBox(
//                                   height: 20,
//                                   width: 20,
//                                   child: CircularProgressIndicator()),
//                               content: Text("Updating Data..."),
//                             );
//                           });
//                           await http.patch(Uri.parse("http://46.101.81.185:9500/todo"),
//                               headers: <String, String>{
//                                 'Content-Type': 'application/json; charset=UTF-8',
//                               },
//                               body: jsonEncode(Task(
//                                   id: id,
//                                   name: name.text,
//                                   description: description.text,
//                                   due: dueDate!,
//                                   completed: false
//                               ).toJson())
//                           );
//                           Navigator.pop(context);
//                           Navigator.pop(context);
//                         }
//                         else{
//                           showDialog(context: context, builder: (ctx){
//                             return AlertDialog(
//                               title: SizedBox(
//                                   height: 20,
//                                   width: 20,
//                                   child: CircularProgressIndicator()),
//                               content: Text("Creating Data..."),
//                             );
//                           });
//                           await http.post(Uri.parse("http://46.101.81.185:9500/todo"),
//                               headers: <String, String>{
//                                 'Content-Type': 'application/json; charset=UTF-8',
//                               },
//                               body: jsonEncode(Task(
//                                   name: name.text,
//                                   description: description.text,
//                                   due: dueDate!,
//                                   completed: false
//                               ).toJson())
//                           );
//                           Navigator.pop(context);
//                           Navigator.pop(context);
//                         }
//                       }
//                     } else {
//                       setState(() {
//                         autoValidateMode = AutovalidateMode.always;
//                       });
//                     }
//                   },
//                   child: Text(isEditMode ? "Update" : "Create"))
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
