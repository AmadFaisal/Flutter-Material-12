import 'package:flutter/material.dart';

class Formpage extends StatefulWidget {
  const Formpage({super.key});

  @override
  State<Formpage> createState() => _FormpageState();
}

class _FormpageState extends State<Formpage> {
  // variabel untuk menyimpan state dari form
  final _formKey = GlobalKey<FormState>();

  // variabel menampung data inputan
  final TextEditingController _usernameController = TextEditingController();

  String _outputName = '';
  String _outputEmail = '';

  @override
  void dispose() {
    _usernameController.dispose();
    super.dispose();
  }

  void _submitForm() {
    print('Username: ${_usernameController.text}');
    // print('Email: ${_emailController.text}');
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text('Processing data')));
    setState(() {
      _outputName = _usernameController.text;
    });

    _usernameController.clear();

    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text('Hello ${_outputName} !')));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Form Page'),
        backgroundColor: const Color.fromARGB(255, 78, 47, 216),
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Form(
          key: _formKey, // mengaitkan state dari form
          child: Column(
            children: [
              // Form field will go here
              Padding(
                padding: EdgeInsets.all(8),
                child: TextFormField(
                  controller: _usernameController,
                  decoration: InputDecoration(
                    labelText: 'Enter your name',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),

              // TextFormField(
              //   controller: _passwordController,
              //   decoration: InputDecoration(labelText: 'Enter your password'),
              //   obscureText: true,
              // ),
              Padding(
                padding: EdgeInsets.all(16.0),
                child: ElevatedButton(
                  onPressed: _submitForm,
                  child: Text("Submit"),
                ),
              ),

              Text("Output : $_outputName !"),
            ],
          ),
        ),
      ),
    );
  }
}
