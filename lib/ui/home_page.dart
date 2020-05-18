import 'dart:io';

import 'package:agenda_contatos/helpers/contact_helper.dart';
import 'package:flutter/material.dart';

import 'contact_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ContactHelper helper = ContactHelper();

  List<Contact> contacts = List();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // Contact c = Contact();
    // c.name = "Felipe Souza 2";
    // c.email = "felipe@gmail.com";
    // c.phone = "1194646855";
    // c.img = "";
    // helper.saveContact(c);

    // helper.deleteContact(1);

    helper.getAllContacts().then((list) {
      contacts = list;
      print(contacts);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contatos"),
        backgroundColor: Colors.red,
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
        backgroundColor: Colors.red,
      ),
      body: ListView.builder(
          padding: EdgeInsets.all(10.0),
          itemCount: contacts.length,
          itemBuilder: (context, index) {
            return _contactCard(context, index);
          }),
    );
  }

  Widget _contactCard(BuildContext context, int index) {
    return GestureDetector(
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Row(
            children: <Widget>[
              Container(
                width: 80.0,
                height: 80.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image:
                        contacts[index].img != null && contacts[index].img != ""
                            ? FileImage(File(contacts[index].img))
                            : AssetImage("images/person.png"),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      contacts[index].name ?? "",
                      style: TextStyle(
                          fontSize: 22.0, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      contacts[index].email ?? "",
                      style: TextStyle(fontSize: 18.0),
                    ),
                    Text(
                      contacts[index].phone ?? "",
                      style: TextStyle(fontSize: 18.0),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _showContactPage({Contact contact}) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => ContactPage(contact: contact)));
  }
}
