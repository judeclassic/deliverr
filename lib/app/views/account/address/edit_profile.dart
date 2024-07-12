import 'package:donitaa_client/app/models/usermodel.dart';
import 'package:donitaa_client/app/repositories/user_repo.dart';
import 'package:donitaa_client/common/strings/resources.dart';
import 'package:donitaa_client/common/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';

import 'package:donitaa_client/app/global_widgets/appbar.dart';
import 'package:donitaa_client/app/global_widgets/auth_button.dart';
import 'package:donitaa_client/app/global_widgets/inputfield.dart';
import 'package:donitaa_client/app/global_widgets/textfield.dart';
import 'package:donitaa_client/app/global_widgets/texts.dart';

class EditProfile extends StatefulWidget {
  EditProfile({
    Key? key,
  }) : super(key: key);

  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  int dispatch = 1;
  User user = User();
  GlobalKey<FormState> senderInfoFormkey = GlobalKey<FormState>();
  GlobalKey<FormState> newAddress = GlobalKey<FormState>();

  int newAddressNum = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGroudColor,
      appBar: CustomAppBar(
          icon: backIcon,
          onTap1: () => Navigator.pop(context),
          text: 'Edit Profile'),
      body: SingleChildScrollView(
        child: Form(
          key: senderInfoFormkey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              dividerTopWidget(2),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: title('Change Details Below', black),
              ),
              TextFieldWidget(
                onSaved: (val) => user.name = val,
                hintText: 'Name',
                initialVal:
                    currentUser.value.name != null ? currentUser.value.name : '',
                labelText: 'Name',
                validator: (val) {
                  return val.toString().isEmpty
                      ? 'Please enter name'
                      : null;
                },
              ),
              TextFieldWidget(
                onSaved: (val) => user.email = val,
                hintText: 'Email',
                initialVal: currentUser.value.email != null ? currentUser.value.email : '',
                labelText: 'Email',
                validator: (val) {
                  return val.toString().isEmpty
                      ? 'Please enter email'
                      : null;
                },
              ),
              SizedBox(height: 30),
              Container(
                child: Column(
                  children: <Widget>[
                    TextFieldWidget(
                      onSaved: (val) => user.address = val,
                      hintText: 'Address',
                      initialVal: currentUser.value.address,
                      labelText: 'Address',
                      validator: (val) {
                        return val.toString().isEmpty
                            ? newAddressNum == 1
                                ? 'Please enter an adress'
                                : null
                            : null;
                      },
                    ),

                    TextFieldWidget(
                      onSaved: (val) => user.postal_code = int.parse(val!),
                      hintText: 'Postal Code',
                      initialVal: (currentUser.value.postal_code ?? '').toString(),
                      textFormatters: [FilteringTextInputFormatter.digitsOnly],
                      labelText: 'Postal Code',
                      validator: (val) {
                        return val.toString().isEmpty
                            ? newAddressNum == 1
                                ? 'Please enter phone number'
                                : null
                            : null;
                      },
                    ),

                    TextFieldWidget(
                      onSaved: (val) => user.phone = val!
                          .replaceAll(' ', '')
                          .replaceAll('(', '')
                          .replaceAll(')', '')
                          .replaceAll('-', ''),
                      hintText: 'Phone',
                      initialVal: currentUser.value.phone ?? '',
                      formatter: true,
                      labelText: 'Phone',
                      validator: (val) {
                        return !val.toString().startsWith('+')
                            ? newAddressNum == 1
                                ? 'Please enter phone number'
                                : null
                            : null;
                      },
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
                child: authButton(context, () {
                  if (senderInfoFormkey.currentState!.validate()) {
                    senderInfoFormkey.currentState!.save();
                    _updateUser();
                  }
                }, text: 'Save', backGroundColor: red),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _updateUser() async {
    print('started');
    Loader.show(context,
        isAppbarOverlay: true,
        isBottomBarOverlay: true,
        progressIndicator: CircularProgressIndicator(
          backgroundColor: Theme.of(context).primaryColor,
        ),
        themeData: Theme.of(context),
        overlayColor: Color(0x99E8EAF6));
    await edituser(user);

    print('Saved');

    Loader.hide();
  }
}
