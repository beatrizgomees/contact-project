import 'package:contact_book_app/model/contact_model.dart';
import 'package:contact_book_app/service/contact_service_impl.dart';
import 'package:contact_book_app/service/image_service.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class HomeViewModel extends ChangeNotifier{

TextEditingController nameController = TextEditingController();
TextEditingController phoneController = TextEditingController();
TextEditingController emailController = TextEditingController();
 
var imageService = ImageService();
var contactService = ContactService();
XFile? photo;

takeImage(XFile? photo) async {
 imageService.takeImage(photo);
}


getContact(){
  contactService.getContact();
}


}