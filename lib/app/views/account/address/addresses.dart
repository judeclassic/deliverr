import 'package:donitaa_client/app/global_widgets/appbar.dart';
import 'package:donitaa_client/app/global_widgets/inputfield.dart';
import 'package:donitaa_client/app/global_widgets/texts.dart';
import 'package:donitaa_client/app/models/address_model.dart';
import 'package:donitaa_client/app/repositories/user_repo.dart';
import 'package:donitaa_client/app/views/account/address/create_address.dart';
import 'package:donitaa_client/app/views/account/address/view_address.dart';
import 'package:donitaa_client/app/views/pages/pages.dart';
import 'package:donitaa_client/common/strings/resources.dart';
import 'package:donitaa_client/common/styles/styles.dart';
import 'package:flutter/material.dart';

class SavedAddress extends StatefulWidget {
  SavedAddress({Key? key}) : super(key: key);

  @override
  _SavedAddressState createState() => _SavedAddressState();
}

class _SavedAddressState extends State<SavedAddress> {
  List icons = [Icons.work, Icons.home, Icons.school, Icons.shop];
  List typeList = [
    'Business Address',
    'Office Address',
    'Home Address',
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

  @override
  void initState() {
    super.initState();
    setAddress();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGroudColor,
      appBar: CustomAppBar(
        icon: backIcon,
        onTap1: () => Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
                builder: (context) => Pages(
                      initialIndex: 3,
                    )),
            (route) => false),
        text: 'Saved Address',
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Divider(
              thickness: 2,
              color: divider,
            ),
            Container(
              height: 50,
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: <Widget>[
                  TextField(
                    onChanged: (text) {
                      searchedText = text;
                      if (!(text == '')) {
                        setState(() {
                          searchAddress = addresses.where((element) {
                            return element.type!.toLowerCase().contains(text);
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
                        hintText: "Search...",
                        hintStyle: TextStyle(fontWeight: FontWeight.w600)),
                  ),
                  Divider(
                    thickness: 1,
                    height: 0,
                    color: divider,
                  ),
                ],
              ),
            ),
            SizedBox(height: 7),
            Container(
              height: 20,
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: title("Favourites", red),
            ),
            Container(
              padding:
                  EdgeInsets.only(top: 15, left: 20, right: 20, bottom: 10),
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                primary: true,
                itemCount: searchAddress.length,
                physics: ScrollPhysics(),
                itemBuilder: (BuildContext contex, int index) {
                  return InkWell(
                    onTap: () {
                      print("Go to address page");
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  ViewAddress(address: searchAddress[index])));
                    },
                    child: SizedBox(
                      height: 80,
                      child: Column(
                        children: [
                          Row(
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: black,
                                ),
                                child: Icon(
                                  getIcon(searchAddress[index].type),
                                  size: 20,
                                  color: white,
                                ),
                              ),
                              SizedBox(width: 17),
                              SizedBox(
                                width: 150,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      searchAddress[index].type == '' ||
                                              searchAddress[index].type ==
                                                  'null'
                                          ? 'Business Address'
                                          : searchAddress[index].type ??
                                              'Business Address',
                                      style: appBarTitle(),
                                    ),
                                    SizedBox(height: 5),
                                    Text(
                                      searchAddress[index].address == 'null'
                                          ? ''
                                          : searchAddress[index].address ?? '',
                                      maxLines: 2,
                                      overflow: TextOverflow.fade,
                                      style: captionText2(12, Colors.black),
                                    ),
                                  ],
                                ),
                              ),
                              Spacer(),
                              Icon(
                                Icons.arrow_forward_ios_sharp,
                                color: red,
                              ),
                            ],
                          ),
                          Divider(
                            thickness: 1,
                            height: 25,
                            color: divider,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            GestureDetector(
              onTap: () {
                print("Add a addree");
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CreateAddressPage()));
              },
              child: Container(
                  height: 80,
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      Row(
                        children: <Widget>[
                          Icon(
                            Icons.add,
                            size: 38,
                            color: red,
                          ),
                          SizedBox(width: 17),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              title("Add Address", red),
                              SizedBox(height: 5),
                              Text(
                                'Save your favourites address',
                                style: TextStyle(fontSize: 12, color: grey),
                              ),
                            ],
                          ),
                          Spacer(),
                          Icon(
                            Icons.arrow_forward_ios_sharp,
                            color: red,
                          ),
                        ],
                      ),
                      dividerWidget()
                    ],
                  )),
            )
          ],
        ),
      ),
    );
  }
}
