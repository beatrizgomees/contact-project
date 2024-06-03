import 'package:contact_book_app/components/text_form_field_component.dart';
import 'package:contact_book_app/model/contact_model.dart';
import 'package:contact_book_app/utils/themes/AppTheme.dart';
import 'package:contact_book_app/viewmodel/create_view_model.dart';
import 'package:contact_book_app/views/list_view.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class CreateContact extends StatefulWidget {
  const CreateContact({super.key});

  @override
  State<CreateContact> createState() => _CreateContactState();
}

class _CreateContactState extends State<CreateContact> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundPrincipalColor,
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: AppTheme.backgroundPrincipalColor),
        body: Expanded(
          child: SingleChildScrollView(
            child: ChangeNotifierProvider(
                create: (context) => CreateViewModel(),
            child: Consumer<CreateViewModel>(
              builder: (context, viewModel, _) {
              return Expanded(
                child: Column(
                  children: [
                    const CircleAvatar(
                      minRadius: 50,
                      maxRadius: 100,
                      backgroundColor: Colors.white,
                    ),
                  const SizedBox(height: 20),
                          
                  ElevatedButton(
                    onPressed: () async {
                      showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return Wrap(
                            children: [
                              ListTile(
                                  title: const Text("Camera"),
                                  leading: const Icon(Icons.camera),
                                  onTap: () async {
                                  viewModel.takeImage(null);
                                  },),
                              ListTile(
                                title: const Text("Galery"),
                                leading: const Icon(Icons.photo),
                                onTap: () async {
                                  
                                  Navigator.pop(context);
                                },
                              )
                            ],
                          );
                        },
                      );
                    },
                  child: const Text("Select Image"),
                  ),
                  const SizedBox(height: 20),
                          
                  TextFormFieldComponent(
                    keyboardType: TextInputType.name,
                    label: "Name",
                    controllerText: viewModel.nameController.text,
                    value: viewModel.nameController.text,
                    icon: const Icon(Icons.person),
                  ),
                  const SizedBox(height: 20),

                  TextFormFieldComponent(
                    label: "Phone Number", 
                    keyboardType: TextInputType.phone, 
                    controllerText: viewModel.phoneController.text, 
                    icon: const Icon(Icons.phone_android_outlined), 
                    value: viewModel.phoneController.text,
                    ),
                   const SizedBox(height: 20),
                
                  TextFormFieldComponent(
                      keyboardType: TextInputType.emailAddress,
                      label: "Email",
                      controllerText: viewModel.emailController.text,
                      value: viewModel.emailController.text,
                      icon: const Icon(Icons.email),
                    ),
                     
                
                const SizedBox(height: 50),
                ],
                ),
              );
              },
            ),
            ),
          ),
        ),
       bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton.icon(
          onPressed: () {
            context.read<CreateViewModel>().handleCreate(context.read<CreateViewModel>());
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ListContactsPage(
                  contactModel: ContactModel(),
                  photo: null,
                ),
              ),
            );
          },
          label: const Text("Create"),
          icon: const Icon(Icons.create_rounded),
        ),
       ),
    );
  }
}