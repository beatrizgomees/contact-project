import 'dart:io';

import 'package:contact_book_app/components/card_contact_component.dart';
import 'package:contact_book_app/components/text_form_field_component.dart';
import 'package:contact_book_app/model/contact_model.dart';
import 'package:contact_book_app/utils/themes/AppTheme.dart';
import 'package:contact_book_app/viewmodel/home_view_model.dart';
import 'package:contact_book_app/views/create_contact.dart';
import 'package:contact_book_app/views/list_view.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
 
  XFile? photo;
  var contactModel = ContactModel();



  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton:  FloatingActionButton.extended(onPressed: () {
          Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) =>  CreateContact(),
        ),
      );
        }, label: Text('Add Contact', 
            style: AppTheme.darkFontStyleContatcSubtitle),
            backgroundColor: Colors.blue.shade700,
            icon: Icon(Icons.add_call, color: Colors.white),
            ),
        backgroundColor: AppTheme.backgroundPrincipalColor,
        body: ChangeNotifierProvider(
            create: (context) => HomeViewModel(),
        child: Consumer<HomeViewModel>(
          builder: (context, viewModel, _) {
          return const SingleChildScrollView(
            child: Column(
              children: [
              CardContactComponent(),
              CardContactComponent(),
              CardContactComponent(),
         
              ]
            ),
          );
          },
        ),
        ),
      ),
    );
  }
}
