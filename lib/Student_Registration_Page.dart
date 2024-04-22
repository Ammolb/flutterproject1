import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';


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
  final TextEditingController _villageController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  String _gender = 'Male';
  File? _profileImage;
  String? _selectedState;
  String? _selectedDistrict;
  String? _selectedTaluka;
  List<String> states = ['Maharashtra', 'Madhya Pradesh'];
  List<String> districts = ['Pune', 'Wardha', 'Nagpur'];
  List<String> talukas = ['Warje', 'Kharadi'];

  void _submitForm() {
    final form = _formKey.currentState;
    if (form != null && form.validate()) {
      print('Name: ${_nameController.text}');
      print('Mobile No: ${_mobileController.text}');
      print(
          'Address: $_selectedState, $_selectedDistrict, $_selectedTaluka, ${_villageController.text}');
      print('Email: ${_emailController.text}');
      print('Gender: $_gender');
      print('Profile Image: $_profileImage');

      _nameController.clear();
      _mobileController.clear();
      _villageController.clear();
      _emailController.clear();
      setState(() {
        _gender = 'Male';
        _selectedState = null;
        _selectedDistrict = null;
        _selectedTaluka = null;
        _profileImage = null;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Form submitted successfully')),
      );
    }
  }

  void _pickImage(ImageSource source) async {
    final pickedImage = await ImagePicker().pickImage(source: source);
    if (pickedImage != null) {
      setState(() {
        _profileImage = File(pickedImage.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Student Registration'),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.blueGrey, Colors.black87],
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Enter Student Details',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 25.0),
                  TextFormField(
                      controller: _nameController,
                      decoration: InputDecoration(
                        labelText: 'Name',
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.person),
                      ),
                      validator: (value) {
                        if (value != null ) {
                          return 'Enter a valid name';
                        }
                      }),
                  SizedBox(height: 25.0),
                  TextFormField(
                    controller: _mobileController,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      labelText: 'Mobile No',
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.phone),
                    ),
                    validator: (value) {
                      if (value != null && value.length != 10) {
                        return 'Mobile number must be 10 digits';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 25.0),
                  Row(
                    children: [
                      DropdownButton<String>(
                        value: _selectedState,
                        onChanged: (value) {
                          setState(() {
                            _selectedState = value;
                          });
                        },
                        items: states.map((String state) {
                          return DropdownMenuItem<String>(
                            value: state,
                            child: Text(state),
                          );
                        }).toList(),
                        hint: Text('State'),
                      ),
                      SizedBox(width: 10.0),
                      DropdownButton<String>(
                        value: _selectedDistrict,
                        onChanged: (value) {
                          setState(() {
                            _selectedDistrict = value;
                          });
                        },
                        items: districts.map((String district) {
                          return DropdownMenuItem<String>(
                            value: district,
                            child: Text(district),
                          );
                        }).toList(),
                        hint: Text('District'),
                      ),
                      SizedBox(width: 10.0),
                      DropdownButton<String>(
                        value: _selectedTaluka,
                        onChanged: (value) {
                          setState(() {
                            _selectedTaluka = value;
                          });
                        },
                        items: talukas.map((String taluka) {
                          return DropdownMenuItem<String>(
                            value: taluka,
                            child: Text(taluka),
                          );
                        }).toList(),
                        hint: Text('Taluka'),
                      ),
                    ],
                  ),
                  SizedBox(height: 25.0),
                  TextFormField(
                    controller: _villageController,
                    decoration: InputDecoration(
                      labelText: 'Village',
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.location_city),
                    ),
                  ),
                  SizedBox(height: 25.0),
                  TextFormField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.email),
                    ),
                    validator: (value) {
                      if (value != null && !value.contains('@')) {
                        return 'Enter a valid email';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 25.0),
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
                    decoration: InputDecoration(
                      labelText: 'Gender',
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.person_outline),
                    ),
                  ),
                  SizedBox(height: 25.0),
                  _profileImage != null
                      ? Image.file(
                          _profileImage!,
                          height: 100,
                          width: 100,
                          fit: BoxFit.cover,
                        )
                      : ElevatedButton.icon(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text('Choose an option'),
                                  content: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      ListTile(
                                        leading: Icon(Icons.camera),
                                        title: Text('Camera'),
                                        onTap: () {
                                          _pickImage(ImageSource.camera);
                                          Navigator.pop(context);
                                        },
                                      ),
                                      ListTile(
                                        leading: Icon(Icons.image),
                                        title: Text('Gallery'),
                                        onTap: () {
                                          _pickImage(ImageSource.gallery);
                                          Navigator.pop(context);
                                        },
                                      ),
                                    ],
                                  ),
                                );
                              },
                            );
                          },
                          icon: Icon(Icons.image),
                          label: Text('Select Profile Photo'),
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.black,
                            backgroundColor: Colors.white,
                          ),
                        ),
                  SizedBox(height: 60.0),
                  ElevatedButton(
                    onPressed: _submitForm,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.yellow,
                      padding:
                          EdgeInsets.symmetric(vertical: 16.0, horizontal: 162),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    child: Text(
                      'Submit',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
