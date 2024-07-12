import 'package:donitaa_client/app/models/address_model.dart';
import 'package:donitaa_client/app/repositories/user_repo.dart';
import 'package:donitaa_client/app/views/account/address/addresses.dart';
import 'package:flutter/material.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';

import 'package:donitaa_client/app/global_widgets/appbar.dart';
import 'package:donitaa_client/app/global_widgets/auth_button.dart';
import 'package:donitaa_client/app/global_widgets/inputfield.dart';
import 'package:donitaa_client/app/global_widgets/textfield.dart';
import 'package:donitaa_client/app/global_widgets/texts.dart';
import 'package:donitaa_client/app/models/simple/country_model.dart';
import 'package:donitaa_client/app/repositories/country_repo.dart';
import 'package:donitaa_client/common/strings/resources.dart';
import 'package:donitaa_client/common/styles/styles.dart';

class EditAddressPage extends StatefulWidget {
  const EditAddressPage({
    Key? key,
    required this.address,
  }) : super(key: key);

  final Address address;

  @override
  _EditAddressPageState createState() => _EditAddressPageState();
}

class _EditAddressPageState extends State<EditAddressPage> {
  int dispatch = 1;
  Address address = Address();

  List<Country> countries = <Country>[];
  GlobalKey<FormState> senderInfoFormkey = GlobalKey<FormState>();
  GlobalKey<FormState> newAddress = GlobalKey<FormState>();

  List countriesList = ['Select country'];
  List statesList = ['Select state'];
  List areasList = ['Select area'];
  List typeList = [
    'Business Address',
    'Office Address',
    'Home Address',
    'Others',
  ];

  Map<String, dynamic> countryId = {};
  Map<String, dynamic> statesId = {};
  Map<String, dynamic> areasId = {};
  Map<String, dynamic> typeId = {};
  int newAddressNum = 0;
  int index1 = 0;
  int index2 = 0;
  int index3 = 0;
  int index4 = 0;
  bool isOthers = false;

  @override
  void initState() {
    super.initState();
    address = widget.address;
    listenForCountries();
    if (address.type == null || address.type == '') {
      address.type = typeList.first;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGroudColor,
      appBar: CustomAppBar(
          icon: backIcon,
          onTap1: () => Navigator.pop(context),
          text: 'Update Address'),
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
                child: title('Enter Details Below', black),
              ),
              TextFieldWidget(
                onSaved: (val) => address.first_name = val,
                hintText: 'First Name',
                initialVal: address.first_name ??
                    (currentUser.value.name != null
                        ? currentUser.value.name!.split(' ').first
                        : ''),
                labelText: 'First Name',
                validator: (val) {
                  return val.toString().isEmpty
                      ? 'Please enter first name'
                      : null;
                },
              ),
              TextFieldWidget(
                onSaved: (val) => address.last_name = val,
                hintText: 'Last Name',
                initialVal: address.first_name ??
                    (currentUser.value.name != null
                        ? currentUser.value.name!.split(' ').last
                        : ''),
                labelText: 'Last Name',
                validator: (val) {
                  return val.toString().isEmpty
                      ? 'Please enter last name'
                      : null;
                },
              ),
              const SizedBox(height: 30),
              Container(
                padding: const EdgeInsets.only(
                    top: 20, bottom: 14, left: 20, right: 20),
                margin: const EdgeInsets.only(
                    left: 20, right: 20, top: 10, bottom: 10),
                decoration: BoxDecoration(
                  color: white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: const [
                    BoxShadow(
                        color: grey, blurRadius: 10, offset: Offset(0, 5)),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'Address type',
                      textAlign: TextAlign.start,
                      style: title4(12, black),
                    ),
                    FormField(
                      builder: (FormFieldState state) {
                        return InputDecorator(
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(horizontal: 5),
                          ),
                          // isEmpty: typeList[index3] == '',
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              value: typeList[index4],
                              icon: Image.asset(dropdownIcon),
                              dropdownColor: const Color(0xFFDEEFF5),
                              isDense: true,
                              onChanged: (newValue) {
                                setState(() {
                                  if (newValue == 'Others') {
                                    isOthers = true;
                                  } else {
                                    isOthers = false;
                                  }
                                  print(newValue);
                                  Map<String, dynamic> typeId = {};
                                  index4 = typeList.indexOf(newValue);
                                  address.type = newValue;
                                });
                              },
                              items: typeList.map((value) {
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
              Column(
                children: <Widget>[
                  if (isOthers)
                    TextFieldWidget(
                      onSaved: (val) {
                        if (isOthers) {
                          address.type = val;
                        }
                      },
                      hintText: 'Other Address Type',
                      initialVal: address.type,
                      labelText: '',
                    ),
                  TextFieldWidget(
                    onSaved: (val) => address.address = val,
                    hintText: 'Address',
                    initialVal: currentUser.value.address ?? address.address,
                    labelText: 'Address',
                    validator: (val) {
                      return val.toString().isEmpty
                          ? newAddressNum == 1
                              ? 'Please enter an address'
                              : null
                          : null;
                    },
                  ),
                  Container(
                    padding: const EdgeInsets.only(
                        top: 20, bottom: 14, left: 20, right: 20),
                    margin: const EdgeInsets.only(
                        left: 20, right: 20, top: 10, bottom: 10),
                    decoration: BoxDecoration(
                      color: white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: const [
                        BoxShadow(
                            color: grey, blurRadius: 10, offset: Offset(0, 5)),
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
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                contentPadding:
                                    EdgeInsets.symmetric(horizontal: 5),
                              ),
                              isEmpty: countriesList[index1] == '',
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton<String>(
                                  value: countriesList[index1],
                                  dropdownColor: const Color(0xFFDEEFF5),
                                  icon: Image.asset(dropdownIcon),
                                  isDense: true,
                                  onChanged: (newValue) {
                                    if (index1 !=
                                        countriesList.indexOf(newValue)) {
                                      setState(() {
                                        index1 =
                                            countriesList.indexOf(newValue);
                                      });
                                      address.country_id = countryId[newValue];
                                      index2 = 0;
                                      index3 = 0;
                                      statesList = ['Select State'];
                                    }
                                    listenForStates(countryId[newValue]);
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
                  Container(
                    padding: const EdgeInsets.only(
                        top: 20, bottom: 14, left: 20, right: 20),
                    margin: const EdgeInsets.only(
                        left: 20, right: 20, top: 10, bottom: 10),
                    decoration: BoxDecoration(
                      color: white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: const [
                        BoxShadow(
                            color: grey, blurRadius: 10, offset: Offset(0, 5)),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          'From Region/State',
                          textAlign: TextAlign.start,
                          style: title4(12, black),
                        ),
                        FormField(
                          builder: (FormFieldState state) {
                            return InputDecorator(
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                contentPadding:
                                    EdgeInsets.symmetric(horizontal: 5),
                              ),
                              isEmpty: statesList[index2] == '',
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton<String>(
                                  value: statesList[index2],
                                  icon: Image.asset(dropdownIcon),
                                  dropdownColor: const Color(0xFFDEEFF5),
                                  isDense: true,
                                  onChanged: (newValue) {
                                    if (index2 !=
                                        statesList.indexOf(newValue)) {
                                      setState(() {
                                        index2 = statesList.indexOf(newValue);
                                        address.state_id = statesId[newValue];
                                        index3 = 0;
                                        areasList = ['Select Area'];
                                      });
                                    }
                                    listenForAreas(statesId[newValue]);
                                  },
                                  items: statesList.map((value) {
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
                  Container(
                    padding: const EdgeInsets.only(
                        top: 20, bottom: 14, left: 20, right: 20),
                    margin: const EdgeInsets.only(
                        left: 20, right: 20, top: 10, bottom: 10),
                    decoration: BoxDecoration(
                      color: white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: const [
                        BoxShadow(
                            color: grey, blurRadius: 10, offset: Offset(0, 5)),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          'From Area/City',
                          textAlign: TextAlign.start,
                          style: title4(12, black),
                        ),
                        FormField(
                          builder: (FormFieldState state) {
                            return InputDecorator(
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                contentPadding:
                                    EdgeInsets.symmetric(horizontal: 5),
                              ),
                              isEmpty: areasList[index3] == '',
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton<String>(
                                  value: areasList[index3],
                                  icon: Image.asset(dropdownIcon),
                                  dropdownColor: const Color(0xFFDEEFF5),
                                  isDense: true,
                                  onChanged: (newValue) {
                                    setState(() {
                                      index3 = areasList.indexOf(newValue);
                                      address.area_id = areasId[newValue];
                                    });
                                  },
                                  items: areasList.map((value) {
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
                  TextFieldWidget(
                    onSaved: (val) => address.zip_code = val,
                    hintText: 'Zip/Postal Code',
                    labelText: 'Zip/Postal Code',
                    initialVal: address.zip_code ?? '',
                    validator: (val) {
                      return val.toString().isEmpty
                          ? newAddressNum == 1
                              ? 'Please enter Zip/Postal Code'
                              : null
                          : null;
                    },
                  ),
                  TextFieldWidget(
                    onSaved: (val) => address.phone = val!
                        .replaceAll(' ', '')
                        .replaceAll('(', '')
                        .replaceAll(')', '')
                        .replaceAll('-', ''),
                    hintText: 'Phone',
                    initialVal: address.phone ?? currentUser.value.phone ?? '',
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
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
                child: authButton(context, () {
                  if (senderInfoFormkey.currentState!.validate()) {
                    senderInfoFormkey.currentState!.save();
                    _addAddress();
                  }
                }, text: 'Next', backGroundColor: red),
              )
            ],
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

  Future<void> listenForStates(int id) async {
    final Stream<States> stream = await getStates(id.toString());
    stream.listen((States _states) {
      !statesList.contains(_states.name)
          ? setState(() => statesList.add(_states.name))
          : print('----');
      Map<String, dynamic> newMapidEdntry = {_states.name: _states.id};
      setState(() => statesId.addAll(newMapidEdntry));
    }, onError: (a) {
      print(a);
    }, onDone: () {});
  }

  Future<void> listenForAreas(int id) async {
    final Stream<Area> stream = await getAreas(id.toString());
    stream.listen((Area _area) {
      !areasList.contains(_area.name)
          ? setState(() => areasList.add(_area.name))
          : print('---');
      Map<String, dynamic> newMapidEdntry = {_area.name: _area.id};
      setState(() => areasId.addAll(newMapidEdntry));
    }, onError: (a) {
      print(a);
    }, onDone: () {});
  }

  Future<void> _addAddress() async {
    Loader.show(context,
        isAppbarOverlay: true,
        isBottomBarOverlay: true,
        progressIndicator: CircularProgressIndicator(
          backgroundColor: Theme.of(context).primaryColor,
        ),
        themeData: Theme.of(context),
        overlayColor: const Color(0x99E8EAF6));
    setState(() {
      address.user_id = currentUser.value.id;
      address.name = address.address != ''
          ? address.address
          : currentUser.value.address ?? "";
    });
    await editAddress(address);
    Navigator.pop(context);
    Navigator.pop(context);
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => SavedAddress()),
    );

    Loader.hide();
    print('Saved');
  }
}
