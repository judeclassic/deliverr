import 'package:donitaa_client/app/global_widgets/appbar.dart';
import 'package:donitaa_client/app/global_widgets/auth_button.dart';
import 'package:donitaa_client/app/global_widgets/textfield.dart';
import 'package:donitaa_client/common/strings/resources.dart';
import 'package:flutter/material.dart';

class RedeemPromoPage extends StatefulWidget {
  const RedeemPromoPage({ Key? key }) : super(key: key);

  @override
  _RedeemPromoPageState createState() => _RedeemPromoPageState();
}

class _RedeemPromoPageState extends State<RedeemPromoPage> {
  GlobalKey<FormState> senderInfoFormKey = GlobalKey();
  String promoCode = '';

   void handlerMessage () {
    setState(() {
      promoCode = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
          icon: backIcon,
          onTap1: () => Navigator.pop(context),
          text: 'Redeem Promo Code'),
      body: SingleChildScrollView(
        child: Form(
          key: senderInfoFormKey,
          child: Column(
            children: [
              SizedBox(height: 20),
        
              TextFieldWidget(
                onSaved: (val) => promoCode = val??'',
                hintText: 'Promo Code',
                initialVal: promoCode,
                labelText: 'Promo Code',
                validator: (val) {
                  return val.toString().isEmpty
                      ? 'Please enter Code'
                      : 'Please enter valid Code';
                },
              ),
        
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
                child: authButton(context, () {
                  if (senderInfoFormKey.currentState!.validate()) {
                    senderInfoFormKey.currentState!.save();
                    handlerMessage();
                  }
                }, text: 'Next', backGroundColor: red),
              )
            ],
          ),
        ),
      )
    );
  }
}