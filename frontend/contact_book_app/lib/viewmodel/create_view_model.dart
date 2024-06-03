import 'package:contact_book_app/model/contact_model.dart';
import 'package:contact_book_app/service/contact_service_impl.dart';
import 'package:contact_book_app/service/image_service.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class CreateViewModel extends ChangeNotifier{

TextEditingController nameController = TextEditingController();
TextEditingController phoneController = TextEditingController();
TextEditingController emailController = TextEditingController();
XFile? photo;
var imageService = ImageService();
var contactService = ContactService();


takeImage(XFile? photo) async {
 imageService.takeImage(photo);
}


createContact(ContactModel contactModel){
  contactModel.phone = phoneController.text;
  contactModel.name = nameController.text;
  contactModel.email = emailController.text;
  contactModel.photo = photo!.path;
  contactService.createContact(contactModel);
}

void handleCreate(CreateViewModel homeViewModel) async {
  if (homeViewModel.nameController.text.isNotEmpty &&
      homeViewModel.phoneController.text.isNotEmpty) {
        
    bool createSucess = await homeViewModel.createContact(
     ContactModel(
      email: homeViewModel.emailController.text, 
      name: homeViewModel.nameController.text, 
      phone: homeViewModel.phoneController.text, 
      photo: homeViewModel.photo!.path)
    );

    if (createSucess) {
     
    } else {
    
    }
  } else {
 
  }
}

}