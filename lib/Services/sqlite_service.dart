import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class StudentRegistrationPage extends StatefulWidget {
  const StudentRegistrationPage({Key? key}) : super(key: key);

  @override
  _StudentRegistrationPageState createState() =>
      _StudentRegistrationPageState();
}

class _StudentRegistrationPageState extends State<StudentRegistrationPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  String _gender = 'Male';

  Future<Database> _database() async {
    // Get the directory for the app's local files
    Directory appDocDir = await getApplicationDocumentsDirectory();
    String dbPath = join(appDocDir.path, 'student_database.db');


    bool dbExists = await File(dbPath).exists();
    if (!dbExists) {
      ByteData data = await rootBundle.load(
          join('assets', 'student_database.db'));
      List<int> bytes = data.buffer.asUint8List();
      await File(dbPath).writeAsBytes(bytes);
    }


    return openDatabase(dbPath);
  }

  Future<void> _insertData(Student student) async {
    final db = await _database();
    await db.insert(
      'students',
      student.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Map<String, dynamic>>> getItems() async {
    final db = await _database();

    return db.query('items', orderBy: "id");
  }

  void _submitForm() async {
    final form = _formKey.currentState;
    if (form != null && form.validate()) {
      final student = Student(
        name: _nameController.text,
        mobile: _mobileController.text,
        address: _addressController.text,
        email: _emailController.text,
        gender: _gender,
      );
      await _insertData(student);

      ScaffoldMessenger.of(context as BuildContext).showSnackBar(
        SnackBar(content: Text('Form submitted successfully')),
      );

      // Clear form fields
      _nameController.clear();
      _mobileController.clear();
      _addressController.clear();
      _emailController.clear();
      setState(() {
        _gender = 'Male';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Student Registration'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(labelText: 'Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
              ),
              SizedBox(height: 12.0),
              TextFormField(
                controller: _mobileController,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(labelText: 'Mobile No'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your mobile number';
                  }
                  return null;
                },
              ),
              SizedBox(height: 12.0),
              TextFormField(
                controller: _addressController,
                decoration: InputDecoration(labelText: 'Address'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your address';
                  }
                  return null;
                },
              ),
              SizedBox(height: 12.0),
              TextFormField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(labelText: 'Email'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  if (!value.contains('@')) {
                    return 'Please enter a valid email';
                  }
                  return null;
                },
              ),
              SizedBox(height: 12.0),
              DropdownButtonFormField<String>(
                value: _gender,
                onChanged: (value) {
                  setState(() {
                    _gender = value!;
                  });
                },
                items: <String>['Male', 'Female', 'Other']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                decoration: InputDecoration(labelText: 'Gender'),
              ),
              SizedBox(height: 12.0),
              ElevatedButton(
                onPressed: _submitForm,
                style: ButtonStyle(
                  backgroundColor:
                  MaterialStateProperty.all<Color>(Colors.yellow),
                ),
                child: Text('Submit', style: TextStyle(color: Colors.black)),
              ),
            ],
          ),
        ),
      ),
    );
  }

  getApplicationDocumentsDirectory() {

  }
}

class Student {
  final String name;
  final String mobile;
  final String address;
  final String email;
  final String gender;

  Student({
    required this.name,
    required this.mobile,
    required this.address,
    required this.email,
    required this.gender,
  });


  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'mobile': mobile,
      'address': address,
      'email': email,
      'gender': gender,
    };
  }
}
