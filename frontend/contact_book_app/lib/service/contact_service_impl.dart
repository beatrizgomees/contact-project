import 'package:contact_book_app/model/contact_model.dart';
import 'package:contact_book_app/interfaces/contact_service.dart';

class ContactService  implements ContactRepository {
  
  @override
  Future<void> createContact(ContactModel contactModel) {
    throw UnimplementedError();
  }
  
  @override
  Future<void> deleteContact(String id) {
    throw UnimplementedError();
  }
  
  @override
  Future<List<ContactModel>> getContact() {
    throw UnimplementedError();
  }
  
  @override
  Future<ContactModel> updateContact(ContactModel contactModel) {
    throw UnimplementedError();
  }
   
}
