import 'package:agenda_contatos/helpers/contact_helper.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ContactHelper helper = ContactHelper();

  @override
  void initState() {
    super.initState();

    Contact c = Contact();
    c.name = "Felipe Souza";
    c.email = "felipe@gmail.com";
    c.phone = "1194646855";
    c.img = "imgTeste";

    helper.saveContact(c);
  }
 
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
