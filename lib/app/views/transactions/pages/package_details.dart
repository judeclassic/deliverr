import 'dart:developer';

import 'package:donitaa_client/app/models/category_model.dart';
import 'package:donitaa_client/app/repositories/shipment_repo.dart';
import 'package:donitaa_client/app/repositories/user_repo.dart';
import 'package:donitaa_client/app/views/transactions/shipment/package_payment.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:donitaa_client/app/global_widgets/appbar.dart';
import 'package:donitaa_client/app/global_widgets/auth_button.dart';
import 'package:donitaa_client/app/global_widgets/inputfield.dart';
import 'package:donitaa_client/app/global_widgets/textfield.dart';
import 'package:donitaa_client/app/global_widgets/texts.dart';
import 'package:donitaa_client/app/models/shipment_model.dart';
import 'package:donitaa_client/common/strings/resources.dart';
import 'package:donitaa_client/common/styles/styles.dart';
import 'package:donitaa_client/generated/l10n.dart';

class PackageDetails extends StatefulWidget {
  PackageDetails({
    Key? key,
    required this.oneShipment,
  }) : super(key: key);
  final OneShipment oneShipment;

  @override
  _PackageDetailsState createState() => _PackageDetailsState(oneShipment);
}

class _PackageDetailsState extends State<PackageDetails> {
  final OneShipment _oneShipment;
  PackageList _packageList = PackageList();
  List<PackageList> packageLists = <PackageList>[];
  List<Package> packages1 = <Package>[];
  Package _package = Package();

  int active = 1000000;
  int activeCategory = 0;
  bool frozenfood = false;
  bool notPerishable = false;
  bool fragileIte = false;
  bool additionalInsuarance = false;
  Map<String, dynamic> newPackage = {};
  TextEditingController packagetName = TextEditingController();
  TextEditingController packagetDesc = TextEditingController();
  TextEditingController packagetQua = TextEditingController();
  GlobalKey<FormState> addPackageContentKey = GlobalKey<FormState>();
  GlobalKey<FormState> addPackageKey = GlobalKey<FormState>();
  List<Category> categories = <Category>[];
  List<PackageCategory> packageCategories = <PackageCategory>[];

  _PackageDetailsState(this._oneShipment);
  @override
  void initState() {
    litsenForCategories();
    litsenForPackages(1.toString());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGroudColor,
      appBar: CustomAppBar(
        icon: backIcon,
        onTap1: () => Navigator.pop(context),
        text: S.of(context).package_details,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            dividerTopWidget(2),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: title('Chooose Category', black),
            ),
            Container(
              height: 60,
              margin: EdgeInsets.only(left: 20, right: 20, bottom: 10),
              child: categories.isNotEmpty
                  ? ListView.builder(
                      itemCount: categories.length,
                      primary: true,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        var _category = categories.elementAt(index);
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              activeCategory = index;
                              active = 1000000000;
                            });
                            packageCategories.clear();
                            litsenForPackages(_category.id.toString());
                          },
                          child: Container(
                            alignment: Alignment.center,
                            margin: EdgeInsets.only(right: 10),
                            padding: EdgeInsets.symmetric(
                                vertical: 7, horizontal: 30),
                            decoration: BoxDecoration(
                              color: index == activeCategory
                                  ? green.withOpacity(.6)
                                  : red.withOpacity(.6),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Text(
                              _category.name,
                              style: title4(15, black)
                                  .copyWith(fontWeight: FontWeight.w500),
                            ),
                          ),
                        );
                      },
                    )
                  : Center(child: Text('Loading categories')),
            ),
            Container(
              height: 110,
              margin: EdgeInsets.only(top: 10, bottom: 25, left: 20),
              child: packageCategories.isNotEmpty
                  ? ListView.builder(
                      itemCount: packageCategories.length,
                      primary: true,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      physics: ScrollPhysics(),
                      itemBuilder: (context, index) {
                        var _packageCategory =
                            packageCategories.elementAt(index);
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              active = index;
                              _package.package_id =
                                  _packageCategory.id.toString();
                            });
                            transBottomSheet(
                                context, _package, _packageCategory.name);
                          },
                          child: Container(
                            margin: EdgeInsets.only(right: 15),
                            padding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 7),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                    color: index == active ? red : grey,
                                    width: 1.6)),
                            alignment: Alignment.center,
                            child: Column(
                              children: <Widget>[
                                Text(
                                  _packageCategory.name,
                                  style: title4(14, black)
                                      .copyWith(fontWeight: FontWeight.w500),
                                ),
                                SizedBox(height: 8),
                                Row(
                                  children: <Widget>[
                                    SvgPicture.asset(packageSvg),
                                    SizedBox(width: 7),
                                    Text(
                                      getCategory(_packageCategory.category_id),
                                      style: title4(14, black).copyWith(
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 15),
                                Text(
                                  "Cost : " +
                                      _packageCategory.cost.toString() +
                                      ' \$',
                                  style:
                                      captionText2(11, black.withOpacity(.5)),
                                ),
                                SizedBox(height: 3),
                                Text(
                                  "Insurence fee" +
                                      _packageCategory.insurance_fee
                                          .toString() +
                                      ' \$',
                                  style:
                                      captionText2(11, black.withOpacity(.5)),
                                )
                              ],
                            ),
                          ),
                        );
                      })
                  : Center(child: Text('Loading packges')),
            ),
            GestureDetector(
              onTap: () => print('Miaaau'),
              child: Container(
                margin: EdgeInsets.only(left: 20, right: 20, bottom: 10),
                width: 200,
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                decoration: BoxDecoration(
                  color: red.withOpacity(.1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: <Widget>[
                    Icon(Icons.add),
                    SizedBox(width: 5),
                    Text('Add Custom Package')
                  ],
                ),
              ),
            ),
            dividerTopWidget(6),
            Container(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    S.of(context).item_details,
                    style:
                        title4(17, black).copyWith(fontWeight: FontWeight.w500),
                  ),
                  SizedBox(height: 15),
                  Container(
                    child: Row(
                      children: <Widget>[
                        Checkbox(
                          value: fragileIte,
                          onChanged: (val) {
                            setState(() {
                              fragileIte = val!;
                            });
                          },
                        ),
                        Text(
                          S.of(context).fragile_item,
                          style: title4(14, black)
                              .copyWith(fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                  ),
                  dividerTopWidget(1),
                  Container(
                    child: Row(
                      children: <Widget>[
                        Checkbox(
                          value: additionalInsuarance,
                          onChanged: (val) {
                            setState(() {
                              additionalInsuarance = val!;
                            });
                          },
                        ),
                        Text(
                          S.of(context).additional_insurance,
                          style: title4(14, black)
                              .copyWith(fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                  ),
                  dividerTopWidget(1),
                  Text(
                    'Package Content',
                    style:
                        title4(17, black).copyWith(fontWeight: FontWeight.w500),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              width: MediaQuery.of(context).size.width / 5.9,
                              child: Text(
                                'Name',
                                style: title4(14, black)
                                    .copyWith(fontWeight: FontWeight.w500),
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width / 5,
                              child: Text(
                                'Description',
                                style: title4(14, black)
                                    .copyWith(fontWeight: FontWeight.w500),
                              ),
                            ),
                            Text(
                              'Quantity',
                              style: title4(14, black)
                                  .copyWith(fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                        dividerTopWidget(1),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: ListView.builder(
                      itemCount: packageContent.length,
                      shrinkWrap: true,
                      primary: true,
                      physics: ScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Dismissible(
                          key: UniqueKey(),
                          onDismissed: (val) {
                            setState(() {
                              packageContent.remove(packageContent[index]);
                            });
                          },
                          child: Container(
                              child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width / 5.9,
                                    child: Text(
                                      packageContent[index]['item_name'],
                                      style: title4(13, black),
                                    ),
                                  ),
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width - 180,
                                    child: Text(
                                      packageContent[index]['description'],
                                      style: title4(12, black.withOpacity(.5)),
                                    ),
                                  ),
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width / 10,
                                    child: Text(
                                      packageContent[index]['qty'],
                                      style: title4(12, black).copyWith(
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                ],
                              ),
                              dividerTopWidget(1),
                            ],
                          )),
                        );
                      },
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return Dialog(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ), //this right here
                            child: SingleChildScrollView(
                              child: Container(
                                height: 500,
                                child: Form(
                                  key: addPackageContentKey,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SizedBox(height: 15),
                                      title('Add Package content', black),
                                      TextFieldWidget(
                                        onSaved: (val) => print(''),
                                        controller: packagetName,
                                        hintText: 'Contern Name',
                                        labelText: 'Name',
                                      ),
                                      TextFieldWidget(
                                        onSaved: (val) => print(''),
                                        controller: packagetDesc,
                                        hintText: 'Decription',
                                        labelText: 'Decription',
                                      ),
                                      TextFieldWidget(
                                        onSaved: (val) => print(''),
                                        hintText: 'Quanity',
                                        controller: packagetQua,
                                        labelText: 'Quanity',
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(20.0),
                                        child: authButton(context, () {
                                          setState(() {
                                            _packageList.item_name =
                                                packagetName.text;
                                            _packageList.description =
                                                packagetDesc.text;
                                            _packageList.qty = packagetQua.text;
                                          });

                                          setState(() {
                                            packageContent
                                                .add(_packageList.toMap());
                                            packageLists.add(_packageList);
                                            _package.package_list =
                                                packageLists;
                                          });

                                          packagetName.clear();
                                          packagetDesc.clear();
                                          packagetQua.clear();
                                          Navigator.pop(context);
                                        },
                                            text: S.of(context).done,
                                            backGroundColor: red),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    },
                    child: Container(
                      padding: EdgeInsets.only(top: 10, left: 15),
                      child: Row(
                        children: <Widget>[
                          Icon(Icons.add, color: red),
                          SizedBox(width: 5),
                          Text(
                            'Add Content List',
                            style: title4(14, black)
                                .copyWith(fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 35),
                  Container(
                    padding: EdgeInsets.only(top: 10, left: 15),
                    child: Row(
                      children: <Widget>[
                        Text(
                          S.of(context).total_payment + ' : Rp 8.000',
                          style: title4(14, black)
                              .copyWith(fontWeight: FontWeight.w500),
                        ),
                        Spacer(),
                        GestureDetector(
                          onTap: () => print('Go to details'),
                          child: Text(
                            S.of(context).details,
                            style: title4(14, red)
                                .copyWith(fontWeight: FontWeight.w500),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 35),
                  authButton(context, () {
                    packages1.add(_package);
                    setState(() => _oneShipment.package = packages1);
                    // print(_oneShipment.package!
                    //     .elementAt(0)
                    //     .shipment_insurance!
                    //     .elementAt(0)
                    //     .runtimeType
                    //     .toString());
                    print(currentUser.value.email);
                    print('Save details then');
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                PackagePayment(oneShipment: _oneShipment)),
                        (route) => true);
                    // Navigator.pop(context);
                  }, text: S.of(context).done, backGroundColor: red)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  List packageContent = [];

  void transBottomSheet(context, Package package, String packageName) {
    showModalBottomSheet(
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10), topRight: Radius.circular(1))),
      context: context,
      builder: (BuildContext context) {
        return DraggableScrollableSheet(
          initialChildSize: .75,
          builder: (context, controller) => Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(1),
              ),
              color: backGroudColor,
            ),
            margin: EdgeInsets.only(top: 100),
            padding: EdgeInsets.only(bottom: 20),
            child: Form(
              key: addPackageKey,
              child: ListView(
                controller: controller,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 100, vertical: 10),
                    child: Center(
                      child: Divider(
                        thickness: 4,
                        color: red.withOpacity(.5),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: title('Add Package:', black),
                  ),
                  SizedBox(height: 5),
                  TextFieldWidget(
                      onSaved: (val) => print(val),
                      hintText: 'Package Name',
                      initialVal: packageName,
                      labelText: 'Package Name'),
                  TextFieldWidget(
                      onSaved: (val) => _package.description = val,
                      hintText: 'Package Description',
                      labelText: 'Package Description'),
                  TextFieldWidget(
                      onSaved: (val) => _package.weight = val,
                      hintText: 'Weight (Kg)',
                      labelText: 'Weight (Kg)'),
                  TextFieldWidget(
                      onSaved: (val) => _package.length = val,
                      hintText: 'Length (cm)',
                      labelText: 'Length (cm)'),
                  TextFieldWidget(
                      onSaved: (val) => _package.width = val,
                      hintText: 'Width (cm)',
                      labelText: 'Width (cm)'),
                  TextFieldWidget(
                      onSaved: (val) => _package.height = val,
                      hintText: 'Height (cm)',
                      labelText: 'Height (cm)'),
                  SizedBox(
                    child: Row(
                      children: <Widget>[
                        Checkbox(
                          value: additionalInsuarance,
                          onChanged: (val) {
                            setState(() {
                              additionalInsuarance = val!;
                            });
                          },
                        ),
                        Text(
                          S.of(context).additional_insurance,
                          style: title4(14, black)
                              .copyWith(fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                  ),
                  // TextFieldWidget(
                  //     onSaved: (val) => ,
                  //     hintText: 'Protection Value (1-10)',
                  //     labelText: 'Protection Value'),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 25),
                    child: authButton(context, () {
                      List<String> insr = [];
                      insr.add(additionalInsuarance == true ? "1" : "0");
                      setState(() {
                        _package.shipment_price = "0";
                        _package.shipment_insurance = insr;
                      });
                      addPackageKey.currentState!.save();
                      Navigator.pop(context);
                    }, text: 'Save', backGroundColor: red),
                  ),
                  const SizedBox(height: 200),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  String getCategory(int id) {
    var _category = categories.where((element) => element.id == id);
    return _category.first.name;
  }

  Future<void> litsenForCategories() async {
    final Stream<Category> stream = await getCategories();
    stream.listen((Category _category) {
      setState(() => categories.add(_category));
    }, onError: (a) {
      print(a);
    }, onDone: () {
      log(categories.toString());
    });
  }

  Future<void> litsenForPackages(String id) async {
    final Stream<PackageCategory> stream = await getPackages(id);
    stream.listen((PackageCategory _packageCategory) {
      setState(() => packageCategories.add(_packageCategory));
    }, onError: (a) {
      print(a);
    }, onDone: () {});
  }
}
