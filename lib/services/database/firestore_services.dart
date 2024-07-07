import 'package:cloud_firestore/cloud_firestore.dart';

class FireStoreService {
  //get collection of order
  final CollectionReference orders =
      FirebaseFirestore.instance.collection("orders");

  //save order to db
  Future<void> saveOrderToDatabase(
      String receipt, String deliveryAddress, String phoneNumber) async {
    await orders.add(
      {
        "date": DateTime.now(), 
        "oder": receipt,
        "Delivery address": deliveryAddress,
        "Phone No.": phoneNumber

        //add more fields as necessary
      },
    );
  }
}
