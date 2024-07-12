import 'package:donitaa_client/app/models/address_model.dart';
import 'package:donitaa_client/app/repositories/user_repo.dart';
import 'package:donitaa_client/app/views/transactions/shipment/card.dart';
import 'package:flutter/material.dart';

// import 'package:donitaa_client/app/controllers/shipement_controller.dart';
import 'package:donitaa_client/app/global_widgets/appbar.dart';
import 'package:donitaa_client/app/global_widgets/auth_button.dart';
import 'package:donitaa_client/app/global_widgets/inputfield.dart';
import 'package:donitaa_client/app/global_widgets/textfield.dart';
import 'package:donitaa_client/app/global_widgets/texts.dart';
import 'package:donitaa_client/app/models/shipment_model.dart';
import 'package:donitaa_client/app/models/simple/country_model.dart';
import 'package:donitaa_client/app/repositories/country_repo.dart';
import 'package:donitaa_client/app/views/transactions/pages/package_details.dart';
import 'package:donitaa_client/common/strings/resources.dart';
import 'package:donitaa_client/common/styles/styles.dart';
import 'package:flutter/services.dart';

class Receiver extends StatefulWidget {
  Receiver({
    Key? key,
    required this.oneShipment,
  }) : super(key: key);
  final OneShipment oneShipment;

  @override
  _ReceiverState createState() => _ReceiverState(oneShipment);
}

class _ReceiverState extends State<Receiver> {
  final OneShipment _oneShipment;

  _ReceiverState(this._oneShipment);

  @override
  void initState() {
    super.initState();
    listenForCountries();
    setAddress();
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

  int selectedAddress = 1;

  int dispatch = 1;

  List<Country> countries = <Country>[];
  GlobalKey<FormState> recieverInfoFormkey = GlobalKey<FormState>();

  List countriesList = ['Select country'];
  List statesList = ['Select state'];
  List areasList = ['Select area'];
  Map<String, dynamic> countryId = {};
  Map<String, dynamic> statesId = {};
  Map<String, dynamic> areasId = {};
  int address = 1;
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
          text: 'Reciever Info'),
      body: SingleChildScrollView(
        child: Form(
          key: recieverInfoFormkey,
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
                      size: const Size(140, 180),
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
                            'Agent Deliver to You',
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
                            'Client Pickup from Our Store',
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
                onSaved: (val) =>
                    _oneShipment.shipment.receiver_first_name = val,
                hintText: 'First Name',
                initialVal: _oneShipment.shipment.receiver_first_name ?? '',
                labelText: 'First Name',
                textInputAction: TextInputAction.next,
                validator: (val) {
                  return val.toString().isEmpty
                      ? 'Please enter first name'
                      : null;
                },
              ),
              TextFieldWidget(
                onSaved: (val) =>
                    _oneShipment.shipment.receiver_last_name = val,
                hintText: 'Last Name',
                initialVal: _oneShipment.shipment.receiver_last_name ?? '',
                labelText: 'Last Name',
                textInputAction: TextInputAction.next,
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
                        'To Reguler Address',
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
                        'Send to Company',
                        style: title4(13, black),
                      )
                    ],
                  ),
                ],
              ),
              if (isCompany == 0)
                TextFieldWidget(
                  onSaved: (val) =>
                      _oneShipment.shipment.receiver_company = val,
                  hintText: 'Receiver Company',
                  labelText: 'Receiver Company',
                  textInputAction: TextInputAction.next,
                  initialVal: _oneShipment.shipment.receiver_company ?? '',
                  // validator: (val) {
                  //   return val.toString().isEmpty
                  //       ? 'Please enter company name'
                  //       : null;
                  // },
                ),
              Row(
                children: <Widget>[
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
                        'Existing Address',
                        style: title4(13, black),
                      )
                    ],
                  ),
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
                        'Address',
                        style: title4(13, black),
                      )
                    ],
                  ),
                ],
              ),
              address == 0
                  ? Container(
                      child: Column(
                        children: <Widget>[
                          TextFieldWidget(
                            onSaved: (val) =>
                                _oneShipment.shipment.receiver_address = val,
                            hintText: 'Reciever Address',
                            initialVal:
                                _oneShipment.shipment.receiver_address ?? '',
                            labelText: 'Reciever Address',
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
                                _oneShipment.shipment.receiver_address_2 = val,
                            initialVal:
                                _oneShipment.shipment.receiver_address_2 ?? '',
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
                                  'To Country',
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
                                              _oneShipment
                                                      .shipment.to_country_id =
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
                                  'To Region',
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
                                      isEmpty: statesList[index2] == '',
                                      child: DropdownButtonHideUnderline(
                                        child: DropdownButton<String>(
                                          value: statesList[index2],
                                          icon: Image.asset(dropdownIcon),
                                          dropdownColor: Color(0xFFDEEFF5),
                                          isDense: true,
                                          onChanged: (newValue) {
                                            if (index2 !=
                                                statesList.indexOf(newValue)) {
                                              setState(() {
                                                index2 = statesList
                                                    .indexOf(newValue);
                                                _oneShipment
                                                        .shipment.to_state_id =
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
                                  'To Area',
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
                                      isEmpty: areasList[index3] == '',
                                      child: DropdownButtonHideUnderline(
                                        child: DropdownButton<String>(
                                          value: areasList[index3],
                                          icon: Image.asset(dropdownIcon),
                                          dropdownColor: Color(0xFFDEEFF5),
                                          isDense: true,
                                          onChanged: (newValue) {
                                            setState(() {
                                              index3 =
                                                  areasList.indexOf(newValue);
                                              _oneShipment.shipment.to_area_id =
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
                                _oneShipment.shipment.receiver_zip_code = val,
                            hintText: 'Zip/Postal Code',
                            labelText: 'Zip/Postal Code',
                            textFormatters: [
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            textInputAction: TextInputAction.next,
                            initialVal:
                                _oneShipment.shipment.receiver_zip_code ?? '',
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
                                _oneShipment.shipment.receiver_email = val,
                            hintText: 'Receiver Email',
                            initialVal:
                                _oneShipment.shipment.receiver_email ?? '',
                            labelText: 'Receiver Email',
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
                                _oneShipment.shipment.receiver_phone = val!
                                    .replaceAll(' ', '')
                                    .replaceAll('(', '')
                                    .replaceAll(')', '')
                                    .replaceAll('-', ''),
                            hintText: 'Receiver Phone',
                            initialVal:
                                _oneShipment.shipment.receiver_phone ?? '',
                            formatter: true,
                            labelText: 'Receiver Phone',
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
                  : Container(
                      child: Column(
                        children: <Widget>[
                          TextFieldWidget(
                              onSaved: (val) => print(val),
                              hintText: 'Search Receiver',
                              labelText: 'Choose Receiver'),
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
                                                ;
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
                                                              EdgeInsets.all(
                                                                  10),
                                                          decoration:
                                                              BoxDecoration(
                                                            shape:
                                                                BoxShape.circle,
                                                            color: black,
                                                          ),
                                                          child: Icon(
                                                            getIcon(
                                                                searchAddress[
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
                                                                searchAddress[index].type ==
                                                                            '' ||
                                                                        searchAddress[index].type ==
                                                                            'null'
                                                                    ? 'Business Address'
                                                                    : searchAddress[index]
                                                                            .type ??
                                                                        'Business Address',
                                                                overflow:
                                                                    TextOverflow
                                                                        .fade,
                                                                maxLines: 2,
                                                                style:
                                                                    appBarTitle(),
                                                              ),
                                                              SizedBox(
                                                                  height: 5),
                                                              Text(
                                                                searchAddress[index]
                                                                            .address ==
                                                                        'null'
                                                                    ? ''
                                                                    : searchAddress[index]
                                                                            .address ??
                                                                        '',
                                                                style: captionText2(
                                                                    12,
                                                                    Colors
                                                                        .black),
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
                                                                      .receiver_address =
                                                                  searchAddress[
                                                                          index]
                                                                      .address;
                                                              _oneShipment
                                                                      .shipment
                                                                      .receiver_first_name =
                                                                  searchAddress[
                                                                          index]
                                                                      .first_name;
                                                              _oneShipment
                                                                      .shipment
                                                                      .receiver_phone =
                                                                  searchAddress[
                                                                          index]
                                                                      .phone;
                                                              _oneShipment
                                                                      .shipment
                                                                      .receiver_zip_code =
                                                                  searchAddress[
                                                                          index]
                                                                      .zip_code;
                                                              _oneShipment
                                                                      .shipment
                                                                      .receiver_email =
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
                    ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 25),
                child: authButton(context, () {
                  if (recieverInfoFormkey.currentState!.validate()) {
                    setState(() {
                      _oneShipment.shipment.receiver_shipment_type =
                          dispatch.toString();
                    });
                    recieverInfoFormkey.currentState!.save();
                    print('Saved');
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                PackageDetails(oneShipment: _oneShipment)),
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
