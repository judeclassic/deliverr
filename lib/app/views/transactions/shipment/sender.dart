import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:donitaa_client/app/models/address_model.dart';
import 'package:donitaa_client/app/repositories/user_repo.dart';
import 'package:donitaa_client/app/views/transactions/shipment/card.dart';
import 'package:donitaa_client/app/views/transactions/shipment/reciever.dart';
import 'package:flutter/material.dart';

import 'package:donitaa_client/app/global_widgets/appbar.dart';
import 'package:donitaa_client/app/global_widgets/auth_button.dart';
import 'package:donitaa_client/app/global_widgets/inputfield.dart';
import 'package:donitaa_client/app/global_widgets/textfield.dart';
import 'package:donitaa_client/app/global_widgets/texts.dart';
import 'package:donitaa_client/app/models/shipment_model.dart';
import 'package:donitaa_client/app/models/simple/country_model.dart';
import 'package:donitaa_client/app/repositories/country_repo.dart';
import 'package:donitaa_client/common/strings/resources.dart';
import 'package:donitaa_client/common/styles/styles.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class Sender extends StatefulWidget {
  Sender({
    Key? key,
    required this.oneShipment,
  }) : super(key: key);
  final OneShipment oneShipment;

  @override
  _SenderState createState() => _SenderState(oneShipment);
}

class _SenderState extends State<Sender> {
  OneShipment _oneShipment;

  _SenderState(this._oneShipment);

  @override
  void initState() {
    super.initState();
    setAddress();
    listenForCountries();
  }

  List icons = [Icons.work, Icons.home, Icons.school, Icons.shop];
  List typeList = [
    'Business Address',
    'Office Address',
    'School Address',
    'Others'
  ];
  List<Address> addresses = [];
  List<Address> searchAddress = [];
  String searchedText = '';
  IconData getIcon(type) {
    int index = typeList.indexOf(type);
    return icons[index == -1 ? 3 : index];
  }

  Future<void> setAddress() async {
    Stream<Address> data = await getAddresses();
    data.listen((address) {
      setState(() {
        addresses.add(address);
        searchAddress.add(address);
      });
    });
  }

  int selectedAddress = 1;
  List<String> errorMsg = [];

  int dispatch = 1;

  List<Country> countries = <Country>[];
  GlobalKey<FormState> senderInfoFormkey = GlobalKey<FormState>();
  GlobalKey<FormState> newAddress = GlobalKey<FormState>();

  List countriesList = ['Select country'];
  List statesList = ['Select state'];
  List areasList = ['Select area'];
  Map<String, dynamic> countryId = {};
  Map<String, dynamic> statesId = {};
  Map<String, dynamic> areasId = {};
  int address = 0;
  int isCompany = 1;
  int index1 = 0;
  int index2 = 0;
  int index3 = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGroudColor,
      appBar: CustomAppBar(
          icon: backIcon,
          onTap1: () => Navigator.pop(context),
          text: 'Sender Info'),
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
                child: title('Dispatch', black),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                child: Row(
                  children: [
                    ShipmentBox(
                      shipmentZone: dispatch,
                      size: Size(140, 180),
                      padding: 20,
                      value: 1,
                      onRadio: () {
                        setState(() {
                          dispatch = 1;
                        });
                      },
                      text: const Padding(
                        padding: EdgeInsets.all(4.0),
                        child: SizedBox(
                          width: 130,
                          child: Text(
                            'Agent Pickup Package',
                            maxLines: 2,
                            style: TextStyle(
                              color: white,
                              fontSize: 11,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                      imgSize: const Size(80, 100),
                      image: agentPickupPackagePng,
                    ),
                    const SizedBox(width: 10),
                    ShipmentBox(
                      shipmentZone: dispatch,
                      size: const Size(140, 180),
                      padding: 20,
                      value: 2,
                      onRadio: () {
                        setState(() {
                          dispatch = 2;
                        });
                      },
                      text: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: SizedBox(
                          width: 130,
                          child: Text(
                            'Client Dropoff to Our Store',
                            maxLines: 2,
                            style: TextStyle(
                              color: white,
                              fontSize: 11,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                      imgSize: const Size(140, 180),
                      image: clientDropOffPng,
                    ),
                  ],
                ),
              ),
              TextFieldWidget(
                onSaved: (val) => _oneShipment.shipment.client_first_name = val,
                hintText: 'First Name',
                textInputAction: TextInputAction.next,
                initialVal: currentUser.value.name != null
                    ? currentUser.value.name!.split(' ').first
                    : '',
                labelText: 'First Name',
                validator: (val) {
                  return val.toString().isEmpty
                      ? 'Please enter first name'
                      : null;
                },
              ),
              TextFieldWidget(
                onSaved: (val) => _oneShipment.shipment.client_last_name = val,
                hintText: 'Last Name',
                initialVal: currentUser.value.name != null
                    ? currentUser.value.name!.split(' ').last
                    : '',
                labelText: 'Last Name',
                textInputAction: TextInputAction.go,
                validator: (val) {
                  return val.toString().isEmpty
                      ? 'Please enter last name'
                      : null;
                },
              ),
              Row(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Radio(
                        value: 1,
                        groupValue: isCompany,
                        onChanged: (val) {
                          setState(() {
                            isCompany = 1;
                          });
                        },
                      ),
                      Text(
                        'Personal',
                        style: title4(13, black),
                      )
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Radio(
                        value: 0,
                        groupValue: isCompany,
                        onChanged: (val) {
                          setState(() {
                            isCompany = 0;
                          });
                        },
                      ),
                      Text(
                        'Company',
                        style: title4(13, black),
                      )
                    ],
                  ),
                ],
              ),
              if (isCompany == 0)
                TextFieldWidget(
                  onSaved: (val) => _oneShipment.shipment.client_company = val,
                  hintText: 'Sender Company',
                  labelText: 'Sender Company',
                  initialVal: _oneShipment.shipment.client_company ?? '',
                  // validator: (val) {
                  //   return val.toString().isEmpty
                  //       ? 'Please enter company name'
                  //       : null;
                  // },
                ),
              dispatch == 1
                  ? Container(
                      padding: const EdgeInsets.only(
                          top: 20, bottom: 14, left: 20, right: 20),
                      margin: const EdgeInsets.only(
                          left: 20, right: 20, top: 10, bottom: 10),
                      decoration: BoxDecoration(
                        color: white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: const [
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
                            'Pickup Date',
                            textAlign: TextAlign.start,
                            style: title4(12, black),
                          ),
                          DateTimeField(
                            format: DateFormat('EEEEEE d, MMM ' 'yyyy'),
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                            ),
                            initialValue:
                                DateTime.now().add(const Duration(days: 3)),
                            validator: (val) {
                              if (val != null) {
                                _oneShipment.shipment.pickup_date =
                                    DateFormat('EEEEEE d, MMM ' 'yyyy')
                                        .format(val);
                                return null;
                              }
                              return dispatch == 1
                                  ? 'please select a pickup date'
                                  : null;
                            },
                            onChanged: (value) {
                              setState(() {
                                _oneShipment.shipment.pickup_date =
                                    DateFormat('EEEEEE d, MMM ' 'yyyy')
                                        .format(value!);
                              });
                            },
                            onShowPicker: (context, currentValue) {
                              return showDatePicker(
                                context: context,
                                firstDate:
                                    DateTime.now().add(const Duration(days: 3)),
                                initialDate:
                                    DateTime.now().add(const Duration(days: 3)),
                                lastDate: DateTime(2023, 12, 31),
                              );
                            },
                          ),
                        ],
                      ),
                    )
                  : const SizedBox(),
              Row(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Radio(
                        value: 0,
                        groupValue: address,
                        onChanged: (val) {
                          setState(() {
                            address = 0;
                          });
                        },
                      ),
                      Text(
                        'Existing Address',
                        style: title4(13, black),
                      )
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Radio(
                        value: 1,
                        groupValue: address,
                        onChanged: (val) {
                          setState(() {
                            address = 1;
                          });
                        },
                      ),
                      Text(
                        'Address',
                        style: title4(13, black),
                      )
                    ],
                  ),
                ],
              ),
              address == 1
                  ? SizedBox(
                      child: Column(
                        children: <Widget>[
                          TextFieldWidget(
                            onSaved: (val) =>
                                _oneShipment.shipment.client_address = val,
                            hintText: 'Address',
                            initialVal: currentUser.value.address ??
                                _oneShipment.shipment.client_address_2,
                            labelText: 'Sender Address',
                            textInputAction: TextInputAction.next,
                            validator: (val) {
                              return val.toString().isEmpty
                                  ? address == 1
                                      ? 'Please enter an adress'
                                      : null
                                  : null;
                            },
                          ),
                          TextFieldWidget(
                            onSaved: (val) =>
                                _oneShipment.shipment.client_address_2 = val,
                            initialVal:
                                _oneShipment.shipment.client_address_2 ?? '',
                            hintText: 'Floor/Apt No.',
                            labelText: 'Floor/Apt No.',
                            textInputAction: TextInputAction.next,
                            validator: (val) {
                              return val.toString().isEmpty
                                  ? address == 1
                                      ? 'Please enter Floor/Apt No.'
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
                                      decoration: const InputDecoration(
                                        border: InputBorder.none,
                                        contentPadding:
                                            EdgeInsets.symmetric(horizontal: 5),
                                      ),
                                      isEmpty: countriesList[index1] == '',
                                      child: DropdownButtonHideUnderline(
                                        child: DropdownButton<String>(
                                          value: countriesList[index1],
                                          dropdownColor:
                                              const Color(0xFFDEEFF5),
                                          icon: Image.asset(dropdownIcon),
                                          isDense: true,
                                          onChanged: (newValue) {
                                            if (index1 !=
                                                countriesList
                                                    .indexOf(newValue)) {
                                              setState(() {
                                                index1 = countriesList
                                                    .indexOf(newValue);
                                              });
                                              _oneShipment.shipment
                                                      .from_country_id =
                                                  countryId[newValue]
                                                      .toString();
                                              index2 = 0;
                                              index3 = 0;
                                              statesList = ['Select State'];
                                            }
                                            listenForStates(
                                                countryId[newValue]);
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
                                    color: grey,
                                    blurRadius: 10,
                                    offset: Offset(0, 5)),
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
                                          dropdownColor:
                                              const Color(0xFFDEEFF5),
                                          isDense: true,
                                          onChanged: (newValue) {
                                            if (index2 !=
                                                statesList.indexOf(newValue)) {
                                              setState(() {
                                                index2 = statesList
                                                    .indexOf(newValue);
                                                _oneShipment.shipment
                                                        .from_state_id =
                                                    statesId[newValue]
                                                        .toString();
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
                                    color: grey,
                                    blurRadius: 10,
                                    offset: Offset(0, 5)),
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
                                          dropdownColor:
                                              const Color(0xFFDEEFF5),
                                          isDense: true,
                                          onChanged: (newValue) {
                                            setState(() {
                                              index3 =
                                                  areasList.indexOf(newValue);
                                              _oneShipment
                                                      .shipment.from_area_id =
                                                  areasId[newValue].toString();
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
                            onSaved: (val) =>
                                _oneShipment.shipment.client_zip_code = val,
                            hintText: 'Zip/Postal Code',
                            labelText: 'Zip/Postal Code',
                            textFormatters: [
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            textInputAction: TextInputAction.next,
                            initialVal:
                                _oneShipment.shipment.client_zip_code ?? '',
                            validator: (val) {
                              return val.toString().isEmpty
                                  ? address == 1
                                      ? 'Please enter Zip/Postal Code'
                                      : null
                                  : null;
                            },
                          ),
                          TextFieldWidget(
                            onSaved: (val) =>
                                _oneShipment.shipment.client_email = val,
                            hintText: 'Sender Email',
                            initialVal: currentUser.value.email,
                            labelText: 'Sender Email',
                            textInputAction: TextInputAction.next,
                            validator: (val) {
                              return !val.toString().contains('@')
                                  ? address == 1
                                      ? 'Please enter a valid email address'
                                      : null
                                  : null;
                            },
                          ),
                          TextFieldWidget(
                            onSaved: (val) =>
                                _oneShipment.shipment.client_phone = val!
                                    .replaceAll(' ', '')
                                    .replaceAll('(', '')
                                    .replaceAll(')', '')
                                    .replaceAll('-', ''),
                            hintText: 'Sender Phone',
                            initialVal: currentUser.value.phone,
                            formatter: true,
                            labelText: 'Sender Phone',
                            textInputAction: TextInputAction.done,
                            validator: (val) {
                              return !val.toString().startsWith('+')
                                  ? address == 1
                                      ? 'Please enter phone number'
                                      : null
                                  : null;
                            },
                          ),
                        ],
                      ),
                    )
                  : Column(
                      children: [
                        Container(
                          child: Column(
                            children: <Widget>[
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
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    Text(
                                      'Choose Address',
                                      textAlign: TextAlign.start,
                                      style: title4(12, black),
                                    ),
                                    TextField(
                                        textInputAction: TextInputAction.search,
                                        onChanged: (text) {
                                          searchedText = text;
                                          if (!(text == '')) {
                                            setState(() {
                                              searchAddress =
                                                  addresses.where((element) {
                                                return element.type!
                                                    .toLowerCase()
                                                    .contains(text);
                                              }).toList();
                                            });
                                          } else {
                                            setState(() {
                                              searchAddress = addresses;
                                            });
                                          }
                                        },
                                        decoration: InputDecoration(
                                          suffixIcon: GestureDetector(
                                            child: Icon(
                                              Icons.search,
                                              color: red,
                                            ),
                                          ),
                                          border: InputBorder.none,
                                          hintText: "Search Address",
                                          hintStyle: title4(
                                            13,
                                            black.withOpacity(.3),
                                          ),
                                        )),
                                    Divider(
                                      thickness: 1,
                                      height: 0,
                                      color: divider,
                                    ),
                                    Container(
                                      padding: EdgeInsets.only(
                                          top: 15,
                                          left: 20,
                                          right: 20,
                                          bottom: 10),
                                      child: ListView.builder(
                                        shrinkWrap: true,
                                        scrollDirection: Axis.vertical,
                                        primary: true,
                                        itemCount: searchAddress.length,
                                        physics: ScrollPhysics(),
                                        itemBuilder:
                                            (BuildContext contex, int index) {
                                          return InkWell(
                                            onTap: () {
                                              print("Go to address page");
                                              // Navigator.push(context,
                                              //   MaterialPageRoute(builder: (context) => ViewAddress(address: searchAddress[index]))
                                              // );
                                            },
                                            child: SizedBox(
                                              height: 88,
                                              child: Column(
                                                children: [
                                                  Row(
                                                    children: <Widget>[
                                                      Container(
                                                        padding:
                                                            EdgeInsets.all(10),
                                                        decoration:
                                                            BoxDecoration(
                                                          shape:
                                                              BoxShape.circle,
                                                          color: black,
                                                        ),
                                                        child: Icon(
                                                          getIcon(searchAddress[
                                                                  index]
                                                              .type),
                                                          size: 20,
                                                          color: white,
                                                        ),
                                                      ),
                                                      SizedBox(width: 17),
                                                      SizedBox(
                                                        width: 150,
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              searchAddress[index]
                                                                              .type ==
                                                                          '' ||
                                                                      searchAddress[index]
                                                                              .type ==
                                                                          'null'
                                                                  ? 'Business Address'
                                                                  : searchAddress[
                                                                              index]
                                                                          .type ??
                                                                      'Business Address',
                                                              style:
                                                                  appBarTitle(),
                                                            ),
                                                            SizedBox(height: 5),
                                                            Text(
                                                              searchAddress[index]
                                                                          .address ==
                                                                      'null'
                                                                  ? ''
                                                                  : searchAddress[
                                                                              index]
                                                                          .address ??
                                                                      '',
                                                              overflow:
                                                                  TextOverflow
                                                                      .fade,
                                                              maxLines: 2,
                                                              style: captionText2(
                                                                  12,
                                                                  Colors.black),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Spacer(),
                                                      Radio(
                                                          value: index,
                                                          groupValue:
                                                              selectedAddress,
                                                          onChanged: (data) {
                                                            _oneShipment
                                                                    .shipment
                                                                    .from_country_id =
                                                                searchAddress[
                                                                        index]
                                                                    .country_id
                                                                    .toString();
                                                            _oneShipment
                                                                    .shipment
                                                                    .from_state_id =
                                                                searchAddress[
                                                                        index]
                                                                    .state_id
                                                                    .toString();
                                                            _oneShipment
                                                                    .shipment
                                                                    .from_area_id =
                                                                searchAddress[
                                                                        index]
                                                                    .area_id
                                                                    .toString();
                                                            _oneShipment
                                                                    .shipment
                                                                    .client_address =
                                                                searchAddress[
                                                                        index]
                                                                    .address;
                                                            _oneShipment
                                                                    .shipment
                                                                    .client_first_name =
                                                                searchAddress[
                                                                        index]
                                                                    .first_name;
                                                            _oneShipment
                                                                    .shipment
                                                                    .client_phone =
                                                                searchAddress[
                                                                        index]
                                                                    .phone;
                                                            _oneShipment
                                                                    .shipment
                                                                    .client_zip_code =
                                                                searchAddress[
                                                                        index]
                                                                    .zip_code;
                                                            _oneShipment
                                                                    .shipment
                                                                    .client_email =
                                                                currentUser
                                                                    .value
                                                                    .email;
                                                            setState(() {
                                                              selectedAddress =
                                                                  index;
                                                            });
                                                          })
                                                    ],
                                                  ),
                                                  Divider(
                                                    thickness: 1,
                                                    height: 30,
                                                    color: divider,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 25),
                child: authButton(context, () {
                  if (senderInfoFormkey.currentState!.validate()) {
                    setState(() {
                      _oneShipment.shipment.type = dispatch.toString();
                    });
                    senderInfoFormkey.currentState!.save();
                    print('Saved');
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                Receiver(oneShipment: _oneShipment)),
                        (route) => true);
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
}
