import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'output_page.dart';

class BelajarForm extends StatefulWidget {
  const BelajarForm({super.key});

  @override
  State<BelajarForm> createState() => _BelajarFormState();
}

class _BelajarFormState extends State<BelajarForm> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController tglLahirController = TextEditingController();

  String _jk = "";
  String? _jkerror;
  String _pilihAgama = "";

  final List<String> agama = ["Islam", "Kristen", "Katolik", "Hindu", "Budha"];
  @override
  void initState() {
    tglLahirController.text = ""; //set the initial value of text field
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: double.infinity,
        color: Colors.blueGrey,
        child: Center(
          child: SingleChildScrollView(
            child: Card(
              elevation: 4,
              margin: EdgeInsets.all(16),
              shape: RoundedRectangleBorder(
                side: BorderSide(color: Colors.black),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Padding(
                padding: EdgeInsets.all(24),
                  child: Form(
                    key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        "Formulir Biodata",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                        textAlign: TextAlign.center,
                      ),

                      SizedBox(height: 18),
                      TextFormField(
                        controller: nameController,
                        decoration: InputDecoration(
                          labelText: "Nama Lengkap",
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) return 'Input Nama';
                          return null;
                        },
                      ),
                      SizedBox(height: 18),

                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Jenis Kelamin",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),

                      Row(
                        children: [
                          Radio<String>(
                            value: "Laki-laki",
                            groupValue: _jk,
                            onChanged: (value) {
                              setState(() {
                                _jk = value!;
                                _jkerror = null;
                              });
                            },
                          ),
                          Text("Laki-laki"),
                          SizedBox(height: 24),
                          Radio<String>(
                            value: "Perempuan",
                            groupValue: _jk,
                            onChanged: (value) {
                              setState(() {
                                _jk = value!;
                                _jkerror = null;
                              });
                            },
                          ),
                          Text("Perempuan"),
                        ],
                      ),
                      if (_jkerror != null)
                        Padding(
                          padding: EdgeInsets.only(left: 8.0),
                          child: Text(
                            _jkerror!,
                            style: TextStyle(
                              color: const Color.fromARGB(255, 4, 118, 232),
                            ),
                          ),
                        ),
                      const SizedBox(height: 18),
                      
                      TextFormField(
                        controller: tglLahirController,
                        decoration: InputDecoration(
                          hintText: "Tanggal Lahir",
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) return 'Input Tanggal Lahir';
                          return null;
                        },
                        readOnly: true,
                        onTap: () async {
                          DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(1900),
                            lastDate: DateTime(2100),
                          );
                          if (pickedDate != null) {
                            setState(() {
                              tglLahirController.text = DateFormat('yyyy-MM-dd')
                                  .format(pickedDate);
                            });
                          }
                        },
                      ),

                      SizedBox(height: 18),
                      DropdownButtonFormField<String>(
                        decoration: InputDecoration(
                          labelText: "Pilih Agama",
                          border: OutlineInputBorder(),
                        ),
                        items: agama
                            .map(
                              (item) => DropdownMenuItem<String>(
                                value: item,
                                child: Text(item),
                              ),
                            )
                            .toList(),
                        onChanged: (value) {
                          setState(() {
                            _pilihAgama = value!;
                          });
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Pilih Agama';
                          }
                          return null;
                        },
                      ),

                      SizedBox(height: 24,),
                      SizedBox(
                        width: MediaQuery.sizeOf(context).width * 0.8,
                        height: MediaQuery.sizeOf(context).height * 0.075,
                        child: ElevatedButton(style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromARGB(255, 74, 91, 246),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8),
                          side: BorderSide(color: Colors.black)),
                        ) , onPressed: _submit, child: Text("Simpan", style: TextStyle(color: Colors.white))),)
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _submit() {
    final isValid = _formKey.currentState!.validate();
    if (_jk.isEmpty) {
      setState(() => _jkerror = 'Pilih Jenis Kelamin');
    }

    if (!isValid || _jk.isEmpty) return;

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => OutputFormScreen(
          nama: nameController.text,
          jk: _jk,
          tglLahir: tglLahirController.text,
          agama: _pilihAgama,
        ),
      ),
    );
  }
}
