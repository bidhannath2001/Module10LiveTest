import 'package:flutter/material.dart';

class ContactList extends StatelessWidget {
  const ContactList({super.key});

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    final TextEditingController nameController = TextEditingController();
    final TextEditingController phoneController = TextEditingController();
    List<String> Names = ['Jawad', 'Ferdous', 'Hasn', 'Hasan', 'Bidhan'];
    List<String> contacts = [
      '01817-77777',
      '01667-77777',
      '01745-77777',
      '01816-77777',
      '01835-272050'
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text('Contact List'),
        centerTitle: true,
        backgroundColor: Colors.blueGrey[200],
        foregroundColor: Colors.white,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Form(
                  key: _formKey,
                  child: Column(children: [
                    TextFormField(
                      controller: nameController,
                      validator: (value) =>
                          value!.isEmpty ? 'Enter Name' : null,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          labelText: 'Name'),
                    ),
                    const SizedBox(
                      height: 16.0,
                    ),
                    TextFormField(
                      controller: phoneController,
                      validator: (value) =>
                          value!.isEmpty ? 'Enter Phone Number' : null,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          labelText: 'Phone Number'),
                    ),
                  ])),
              const SizedBox(
                height: 16.0,
              ),
              SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      nameController.clear();
                      phoneController.clear();
                    },
                    child: Text('Add'),
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.blueGrey[200]),
                  )),
              const SizedBox(
                height: 20.0,
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        leading: const Icon(Icons.person),
                        title: Text('${Names[index]}',
                            style: const TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.bold)),
                        subtitle: Text('${contacts[index]}'),
                        trailing: IconButton(
                          icon: const Icon(Icons.phone, color: Colors.blue),
                          onPressed: () {},
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
