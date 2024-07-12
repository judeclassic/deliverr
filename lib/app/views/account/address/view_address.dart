import 'package:donitaa_client/app/global_widgets/appbar.dart';
import 'package:donitaa_client/app/global_widgets/auth_button.dart';
// import 'package:donitaa_client/app/global_widgets/auth_button.dart';
import 'package:donitaa_client/app/global_widgets/inputfield.dart';
import 'package:donitaa_client/app/global_widgets/texts.dart';
import 'package:donitaa_client/app/models/address_model.dart';
import 'package:donitaa_client/app/models/simple/country_model.dart';
import 'package:donitaa_client/app/repositories/country_repo.dart';
import 'package:donitaa_client/app/repositories/user_repo.dart';
import 'package:donitaa_client/app/views/account/address/addresses.dart';
import 'package:donitaa_client/app/views/account/address/edit_address.dart';
import 'package:donitaa_client/common/strings/resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';

class ViewAddress extends StatefulWidget {
  const ViewAddress({Key? key, required this.address}) : super(key: key);

  final Address address;

  @override
  _ViewAddressState createState() => _ViewAddressState();
}

class _ViewAddressState extends State<ViewAddress> {
  late Address address = Address();

  @override
  void initState() {
    super.initState();
    address = widget.address;
    getLocation();
  }
  String country = '';
  String state = '';
  String area = '';

  @override
  Widget build(BuildContext context) {
    print(widget.address.toMap());
    return Scaffold(
      backgroundColor: backGroudColor,
      appBar: CustomAppBar(
        icon: backIcon,
        onTap1: () => Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => SavedAddress()),
            (route) => false),
        text: 'View Address',
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Divider(
              thickness: 2,
              color: divider,
            ),
            AddressEntryField(
              height: 80,
              entry: "First Name",
              value: widget.address.first_name ?? '',
              onPress: (data) {
                setState(() {
                  address.first_name = data;
                });
              },
            ),
            AddressEntryField(
              height: 80,
              entry: "Last Name",
              value: widget.address.last_name ?? '',
              onPress: (data) {
                setState(() {
                  address.last_name = data;
                });
              },
            ),
            AddressEntryField(
              height: 80,
              entry: "Business Type",
              value: (widget.address.type == null || widget.address.type == 'null')
               ? 'Business Address'
               : widget.address.type ?? 'Business Address',
              onPress: (data) {
                setState(() {
                  address.type = data;
                });
              },
            ),
            AddressEntryField(
              height: 80,
              entry: "Phone",
              value: widget.address.phone ?? '',
              onPress: (data) {
                setState(() {
                  address.phone = data;
                });
              },
            ),
            AddressEntryField(
              height: 100,
              entry: "Address",
              value: widget.address.address ?? '',
              onPress: (data) {
                setState(() {
                  address.address = data;
                });
              },
            ),
            AddressEntryField(
              height: 80,
              entry: "Area",
              value: area,
              onPress: (data) {
                setState(() {
                  address.area_id = data;
                });
              },
            ),
            AddressEntryField(
              height: 80,
              entry: "State",
              value: state,
              onPress: (data) {
                setState(() {
                  address.state_id = data;
                });
              },
            ),
            AddressEntryField(
              height: 80,
              entry: "Country",
              value: country,
              onPress: (data) {
                setState(() {
                  address.country_id = data;
                });
              },
            ),
            AddressEntryField(
              height: 80,
              entry: "Zip Code",
              value: widget.address.zip_code ?? '',
              onPress: (data) {
                setState(() {
                  address.zip_code = data;
                });
              },
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
              child: authButton(context, () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => EditAddressPage(address: address)));
                print('Edit Account');
              }, text: 'Edit Address', backGroundColor: red),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
              child: authButton(context, () {
                confirm();
              }, text: 'Delete Address', backGroundColor: red),
            )
          ],
        ),
      ),
    );
  }

  Future<void> getLocation() async {
    final Stream<Country> stream = await getCountries();
    stream.listen((Country _country) async{
      if (_country.id == address.country_id){
        // setState((){
          country = _country.name!;
        // });
        final Stream<States> stateStream = await getStates(_country.id.toString());
        stateStream.listen((States _state) async{
          if (_state.id == address.state_id){
            // setState((){
              state = _state.name;
            // });
            final Stream<Area> areaStream = await getAreas(_state.id.toString());
            areaStream.listen((Area _area) {
              if (_area.id == address.area_id){
                // setState((){
                  area = _area.name;
                // });
                return;
              }
            },
            onDone: () {
              setState(() {});
            });
            return;
          }
        });
        return;
      }
    }, onError: (a) {
      print(a);
    }, onDone: () {});
  }

  Future<bool> confirm() async {
    final bool? isConfirm = await showDialog<bool>(
      context: context,
      builder: (_) => WillPopScope(
        child: AlertDialog(
          title: Text('Confirm'),
          content: Text('Are you sure you want to delete this Address'),
          actions: <Widget>[
            TextButton(
              child: Text('CANCEL'),
              onPressed: () => Navigator.pop(context, false),
            ),
            TextButton(
              child: Text('CONTINUE'),
              onPressed: () {
                Navigator.pop(context, false);
                Loader.show(context,
                  isAppbarOverlay: true,
                  isBottomBarOverlay: true,
                  progressIndicator: CircularProgressIndicator(
                    backgroundColor: Theme.of(context).primaryColor,
                  ),
                  themeData: Theme.of(context),
                  overlayColor: Color(0x99E8EAF6));
                deleteAddress(widget.address).then((value) {
                  Navigator.pop(context, false);
                  Navigator.pop(context, false);
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SavedAddress()));
                  Loader.hide();
                }).catchError((err) {
                  Loader.hide();
                }).onError((error, stackTrace){
                  Loader.hide();
                });
              }
            ),
          ],
        ),
        onWillPop: () async {
          Navigator.pop(context, false);
          return true;
        },
      ),
    );

    return (isConfirm != null) ? isConfirm : false;
  }
}

class AddressEntryField extends StatefulWidget {
  final Function onPress;
  final double height;
  final String value;
  final String entry;

  AddressEntryField(
      {Key? key,
      required this.entry,
      required this.value,
      required this.height,
      required this.onPress})
      : super(key: key);

  @override
  State<AddressEntryField> createState() => _AddressEntryFieldState();
}

class _AddressEntryFieldState extends State<AddressEntryField> {
  bool isOnEdit = false;

  final TextEditingController text = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.value != '---') {
      text.text = widget.value;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height,
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  widget.entry,
                  style: TextStyle(
                    color: grey,
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Container(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    children: [
                      Row(
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width - 100,
                                  child: Text(
                                    widget.value,style: TextStyle(
                                    color: black,
                                    fontSize: 17,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      dividerWidget()
                    ],
                  )),
            ],
          ),
        ],
      ),
    );
  }
}
