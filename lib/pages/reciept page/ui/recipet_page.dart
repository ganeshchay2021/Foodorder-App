// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:foodorderapp/Resources/restaurant.dart';
import 'package:foodorderapp/pages/reciept%20page/widget/build_bottom_navbar.dart';
import 'package:foodorderapp/pages/reciept%20page/widget/my_reciept.dart';
import 'package:foodorderapp/services/database/firestore_services.dart';

class RecieptPage extends StatefulWidget {
  final String phoneNumber;
  const RecieptPage({
    super.key,
    required this.phoneNumber,
  });

  @override
  State<RecieptPage> createState() => _RecieptPageState();
}

class _RecieptPageState extends State<RecieptPage> {
  FireStoreService db = FireStoreService();

  @override
  void initState() {
    super.initState();

    String receipt = context.read<Restaurant>().displayCartReceipt();
    String deliveryAddress = context.read<Restaurant>().deliveryAddress;
    db.saveOrderToDatabase(receipt, deliveryAddress, widget.phoneNumber);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Reciept"),
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        leading: BackButton(
          onPressed: () {
            Navigator.pop(context);
            context.read<Restaurant>().clearCart();
          },
        ),
      ),
      bottomNavigationBar: const BuildBottomNavBar(),
      body: const Column(
        children: [
          MyReciept(),
        ],
      ),
    );
  }
}
