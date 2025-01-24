import 'package:flutter/material.dart';

class AddListPage extends StatefulWidget {
  @override
  _AddListPageState createState() => _AddListPageState();
}

class _AddListPageState extends State<AddListPage> {
  final _formKey = GlobalKey<FormState>();
  final _todoController = TextEditingController();

  void _submitList() {
    if (_formKey.currentState!.validate()) {
      Navigator.pop(context, _todoController.text);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lime,
        title: Text(
          'Tambahkan Pekerjaaan',
          style: TextStyle(
              color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Masukkan Pekerjaan Baru:',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: _todoController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Masukan Di sini',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'HARUS DI ISI TIDAK BOLEH KOSONG !!!!';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: _submitList,
                  child: Text(
                    'Simpan',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
