import 'package:donitaa_client/app/global_widgets/appbar.dart';
import 'package:donitaa_client/app/global_widgets/auth_button.dart';
import 'package:donitaa_client/app/global_widgets/textfield.dart';
import 'package:donitaa_client/app/models/simple/country_model.dart';
import 'package:donitaa_client/app/repositories/country_repo.dart';
import 'package:donitaa_client/app/views/pages/pages.dart';
import 'package:donitaa_client/common/strings/resources.dart';
import 'package:donitaa_client/common/styles/styles.dart';
import 'package:flutter/material.dart';

class ContactUsPage extends StatefulWidget {
  const ContactUsPage({ Key? key }) : super(key: key);

  @override
  _ContactUsPageState createState() => _ContactUsPageState();
}

class _ContactUsPageState extends State<ContactUsPage> {
  GlobalKey<FormState> senderInfoFormKey = GlobalKey();
  String name = '';
  String email = '';
  String message = '';
  List<Country> countries = <Country>[];

  int index4 = 0;
  List countriesList = ['Select country'];
  Map<String, dynamic> countryId = {};
  int index1 = 0;


  void handlerMessage () {
    setState(() {
      name = '';
      email = '';
      message = '';
    });
  }

  @override
  void initState() {
    super.initState();
    listenForCountries();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        icon: backIcon,
        onTap1: () => Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
                builder: (context) => Pages(
                      initialIndex: 3,
                    )),
            (route) => false),
        text: 'CONTACT US',
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Form(
            key: senderInfoFormKey,
            child: Column(
              children: [
                  
                SizedBox(height: 20,),
          
                TextFieldWidget(
                  onSaved: (val) => name = val??'',
                  hintText: 'name',
                  initialVal: name,
                  labelText: 'Name',
                  validator: (val) {
                    return val.toString().isEmpty
                        ? 'Please enter name'
                        : null;
                  },
                ),

                SizedBox(height: 15),

                Container(
                  padding: EdgeInsets.only(
                      top: 20, bottom: 14, left: 20, right: 20),
                  margin: EdgeInsets.only(
                      left: 20, right: 20, top: 10, bottom: 10),
                  decoration: BoxDecoration(
                    color: white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                          color: grey,
                          blurRadius: 10,
                          offset: Offset(0, 5)),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        'From Country',
                        textAlign: TextAlign.start,
                        style: title4(12, black),
                      ),
                      FormField(
                        builder: (FormFieldState state) {
                          return InputDecorator(
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 5),
                            ),
                            isEmpty: countriesList[index1] == '',
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                value: countriesList[index1],
                                dropdownColor: Color(0xFFDEEFF5),
                                icon: Image.asset(dropdownIcon),
                                isDense: true,
                                onChanged: (newValue) {
                                  if (index1 !=
                                      countriesList.indexOf(newValue)) {
                                    setState(() {
                                      index1 =
                                          countriesList.indexOf(newValue);
                                    });
                                  }
                                },
                                items: countriesList.map((value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 15),
          
                TextFieldWidget(
                  onSaved: (val) => email = val??'',
                  hintText: 'Email',
                  initialVal: email,
                  labelText: 'Email',
                  validator: (val) {
                    return val.toString().isEmpty
                        ? 'Please enter email'
                        : null;
                  },
                ),

                SizedBox(height: 15),
          
                TextFieldWidget(
                  onSaved: (val) => message = val??'',
                  hintText: 'Message',
                  initialVal: message,
                  labelText: 'Message',
                  validator: (val) {
                    if (val == null || val.toString().isEmpty){
                      return 'Please enter message';
                    } else {
                      if (val.toString().length < 20) {
                        return 'Enter at least 20 letters';
                      } else {
                        return null;
                      }
                    }
                  },
                ),
          
                SizedBox(height: 20),
          
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
                  child: authButton(context, () {
                    if (senderInfoFormKey.currentState!.validate()) {
                      senderInfoFormKey.currentState!.save();
                      handlerMessage();
                    }
                  }, text: 'Send', backGroundColor: red),
                ),
                
              ],
              
            ),
          ),
        ),
      ),
    );
  }

  Future<void> listenForCountries() async {
    final Stream<Country> stream = await getCountries();
    stream.listen((Country _country) {
      setState(() => countriesList.add(_country.name));
      setState(() => countries.add(_country));
      Map<String, dynamic> newMapidEdntry = {_country.name!: _country.id};
      setState(() => countryId.addAll(newMapidEdntry));
    }, onError: (a) {
      print(a);
    }, onDone: () {});
  }


}