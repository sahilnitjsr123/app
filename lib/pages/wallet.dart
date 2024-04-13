import 'package:flutter/material.dart';
import 'package:food_delivery_app/widget/widget_support.dart';

class Wallet extends StatefulWidget {
  const Wallet({Key? key}) : super(key: key);

  @override
  State<Wallet> createState() => _WalletState();
}

class _WalletState extends State<Wallet> {
  TextEditingController _amountController = TextEditingController();
  double walletAmount = 100; // Initial wallet amount

  void _showAddMoneyDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Add Money'),
          content: TextField(
            controller: _amountController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(labelText: 'Enter amount'),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                double amountToAdd = double.tryParse(_amountController.text) ?? 0;
                setState(() {
                  walletAmount += amountToAdd;
                });
                Navigator.of(context).pop();
                _showSnackBar('Added $amountToAdd successfully!');
              },
              child: Text('Add'),
            ),
          ],
        );
      },
    );
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 60.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Material(
              elevation: 2.0,
              child: Container(
                padding: EdgeInsets.only(bottom: 10.0),
                child: Column(
                  children: [
                    Center(
                      child: Text(
                        "Wallet",
                        style: AppWidget.HeadlineTextFieldStyle(),
                      ),
                    ),
                    SizedBox(height: 30.0),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(color: Color(0xFFF2F2F2)),
                      child: Row(
                        children: [
                          Image.asset(
                            "images/wallet.png",
                            height: 60.0,
                            width: 60,
                            fit: BoxFit.cover,
                          ),
                          SizedBox(width: 40.0),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Your Wallet", style: AppWidget.LightTextFieldStyle()),
                              SizedBox(height: 5.0),
                              Text("\$" + walletAmount.toString(), style: AppWidget.boldTextFieldStyle()),
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 20.0),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: Text("Add money", style: AppWidget.boldTextFieldStyle()),
                    ),
                    SizedBox(height: 10.0,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              border: Border.all(color: Color(0xFFE9E2E2)),
                              borderRadius: BorderRadius.circular(5)
                          ),
                          child: Text("\$"+"100", style: AppWidget.boldTextFieldStyle(),),
                        ),
                        Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              border: Border.all(color: Color(0xFFE9E2E2)),
                              borderRadius: BorderRadius.circular(5)
                          ),
                          child: Text("\$"+"500", style: AppWidget.boldTextFieldStyle(),),
                        ),
                        Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              border: Border.all(color: Color(0xFFE9E2E2)),
                              borderRadius: BorderRadius.circular(5)
                          ),
                          child: Text("\$"+"1000", style: AppWidget.boldTextFieldStyle(),),
                        ),
                        Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              border: Border.all(color: Color(0xFFE9E2E2)),
                              borderRadius: BorderRadius.circular(5)
                          ),
                          child: Text("\$"+"2000", style: AppWidget.boldTextFieldStyle(),),
                        )
                      ],
                    ),
                    SizedBox(height: 10.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Amount buttons...
                      ],
                    ),
                    SizedBox(height: 50.0),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 20.0),
                      padding: EdgeInsets.symmetric(vertical: 12.0),
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: Color(0xFF008080),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: TextButton(
                        onPressed: _showAddMoneyDialog,
                        child: Text(
                          "Add Money",
                          style: TextStyle(color: Colors.white, fontSize: 16.0, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
