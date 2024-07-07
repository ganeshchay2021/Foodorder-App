import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:foodorderapp/Resources/restaurant.dart';
import 'package:foodorderapp/common%20widgets/my_button.dart';
import 'package:foodorderapp/common%20widgets/my_custom_textfield.dart';
import 'package:foodorderapp/pages/reciept%20page/ui/recipet_page.dart';
import 'package:provider/provider.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  TextEditingController phoneNumberController = TextEditingController();

  String cardNumber = "";
  String expiryDate = "";
  String cardHolderName = "";
  String pinCode = "";
  bool isCvvFocused = false;

  void userTappedPay() {
    if (formkey.currentState!.validate()) {
      //only show dialog if form is valid
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("Confirm payment"),
            content: SingleChildScrollView(
              child: ListBody(
                children: [
                  Text("Card Number : $cardNumber"),
                  Text("Expire Date: $expiryDate"),
                  Text("Card Holder : $cardHolderName"),
                ],
              ),
            ),
            actions: [
              //cancel button
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("Cancel")),

              //yes
              Consumer<Restaurant>(
                builder: (context, restaurent, child) {
                  return TextButton(
                      onPressed: () {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => RecieptPage(
                                phoneNumber: phoneNumberController.text,
                              ),
                            ),
                            (route) => route.isFirst);
                      },
                      child: const Text("yes"));
                },
              )
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Checkout"),
        backgroundColor: Colors.transparent,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  //credit Card
                  CreditCardWidget(
                    cardNumber: cardNumber,
                    expiryDate: expiryDate,
                    cardHolderName: cardHolderName,
                    cvvCode: pinCode,
                    showBackView: isCvvFocused,
                    onCreditCardWidgetChange: (p0) {},
                  ),

                  //credit card form
                  CreditCardForm(
                    obscureCvv: true,
                    cardNumber: cardNumber,
                    expiryDate: expiryDate,
                    cardHolderName: cardHolderName,
                    cvvCode: pinCode,
                    formKey: formkey,
                    onCreditCardModelChange: (data) {
                      setState(() {
                        cardNumber = data.cardNumber;
                        expiryDate = data.expiryDate;
                        cardHolderName = data.cardHolderName;
                        pinCode = data.cvvCode;
                      });
                    },
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const Text("Contact No"),
              const SizedBox(
                height: 10,
              ),
              MyCustomTextField(
                  controller: phoneNumberController, hintText: "+977"),
              const SizedBox(
                height: 20,
              ),
              // //paynow button
              MyButton(text: "Pay now", onTap: userTappedPay)
            ],
          ),
        ),
      ),
    );
  }
}
