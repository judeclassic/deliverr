import 'package:donitaa_client/app/global_widgets/appbar.dart';
import 'package:donitaa_client/app/global_widgets/inputfield.dart';
import 'package:donitaa_client/common/strings/resources.dart';
import 'package:donitaa_client/common/styles/styles.dart';
import 'package:donitaa_client/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ConfirmTopUp extends StatefulWidget {
  ConfirmTopUp({Key? key}) : super(key: key);

  @override
  _ConfirmTopUpState createState() => _ConfirmTopUpState();
}

class _ConfirmTopUpState extends State<ConfirmTopUp> {
  bool _expanded = false;
  bool _expanded1 = false;
  bool _expanded2 = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGroudColor,
      appBar:
          CustomAppBar(icon: backIcon, onTap1: () => Navigator.pop(context)),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      S.of(context).how_to_top_up,
                      style: title4(14, black),
                    ),
                    SizedBox(height: 10),
                    Text(
                      S.of(context).folow_these_steps_to_top_up,
                      style: title4(12, black.withOpacity(.5)),
                    )
                  ],
                )),
            Container(
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      S.of(context).bank_virtual_account,
                      style: title4(14, black),
                    ),
                    SizedBox(height: 10),
                    GestureDetector(
                      onTap: () {
                        Clipboard.setData(
                                ClipboardData(text: '104455987721191'))
                            .then((_) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text('Copied to your clipboard !'),
                            backgroundColor: green,
                          ));
                        });
                      },
                      child: Container(
                        width: 180,
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        decoration: BoxDecoration(
                            color: red.withOpacity(.05),
                            borderRadius: BorderRadius.circular(5)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              '104455987721191',
                              style: title4(14, red),
                            ),
                            SizedBox(width: 10),
                            Icon(Icons.copy, size: 20, color: red),
                          ],
                        ),
                      ),
                    ),
                  ],
                )),
            dividerTopWidget(6),
            Container(
                margin: EdgeInsets.all(20),
                alignment: Alignment.topLeft,
                decoration: BoxDecoration(
                  border: Border.all(color: grey, width: 1.5),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(15),
                      child: Row(
                        children: <Widget>[
                          Image.asset(bcaLogo),
                          Text(
                            'BCA',
                            style: title4(15, black)
                                .copyWith(fontWeight: FontWeight.w600),
                          )
                        ],
                      ),
                    ),
                    dividerTopWidget(2),
                    Container(
                      // margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Colors.green,
                          border:
                              Border.all(width: 0, color: Colors.transparent)),
                      child: ExpansionPanelList(
                        animationDuration: Duration(milliseconds: 800),
                        children: [
                          ExpansionPanel(
                            backgroundColor: backGroudColor,
                            headerBuilder: (context, isExpanded) {
                              return ListTile(
                                title: Text(
                                  'ATM BCA',
                                  style: title4(15, black)
                                      .copyWith(fontWeight: FontWeight.w600),
                                ),
                              );
                            },
                            body: Column(
                              children: [
                                ListTile(
                                  title: Text('This is the step 1 title',
                                      style: TextStyle(color: Colors.black)),
                                  subtitle: Text(
                                    'argument is null, the text will use the style from the closest enclosingargument is null, the text will use the style from the closest enclosing',
                                    style: captionText1().copyWith(
                                        color: black.withOpacity(.6),
                                        fontSize: 13),
                                  ),
                                ),
                                ListTile(
                                  title: Text('This is the step 2 title',
                                      style: TextStyle(color: Colors.black)),
                                  subtitle: Text(
                                    'argument is null, the text will use the style from the closest enclosingargument is null, the text will use the style from the closest enclosing',
                                    style: captionText1().copyWith(
                                        color: black.withOpacity(.6),
                                        fontSize: 13),
                                  ),
                                ),
                              ],
                            ),
                            isExpanded: _expanded,
                            canTapOnHeader: true,
                          ),
                        ],
                        elevation: 0,
                        expansionCallback: (panelIndex, isExpanded) {
                          _expanded = !_expanded;
                          setState(() {});
                        },
                      ),
                    ),
                    dividerTopWidget(2),
                    Container(
                      // margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Colors.green,
                          border:
                              Border.all(width: 0, color: Colors.transparent)),
                      child: ExpansionPanelList(
                        animationDuration: Duration(milliseconds: 800),
                        children: [
                          ExpansionPanel(
                            backgroundColor: backGroudColor,
                            headerBuilder: (context, isExpanded) {
                              return ListTile(
                                title: Text(
                                  'ATM BCA',
                                  style: title4(15, black)
                                      .copyWith(fontWeight: FontWeight.w600),
                                ),
                              );
                            },
                            body: Column(
                              children: [
                                ListTile(
                                  title: Text('This is the step 1 title',
                                      style: TextStyle(color: Colors.black)),
                                  subtitle: Text(
                                    'argument is null, the text will use the style from the closest enclosingargument is null, the text will use the style from the closest enclosing',
                                    style: captionText1().copyWith(
                                        color: black.withOpacity(.6),
                                        fontSize: 13),
                                  ),
                                ),
                                ListTile(
                                  title: Text('This is the step 2 title',
                                      style: TextStyle(color: Colors.black)),
                                  subtitle: Text(
                                    'argument is null, the text will use the style from the closest enclosingargument is null, the text will use the style from the closest enclosing',
                                    style: captionText1().copyWith(
                                        color: black.withOpacity(.6),
                                        fontSize: 13),
                                  ),
                                ),
                              ],
                            ),
                            isExpanded: _expanded1,
                            canTapOnHeader: true,
                          ),
                        ],
                        elevation: 0,
                        expansionCallback: (panelIndex, isExpanded) {
                          _expanded1 = !_expanded1;
                          setState(() {});
                        },
                      ),
                    ),
                    dividerTopWidget(2),
                    Container(
                      // margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Colors.green,
                          border:
                              Border.all(width: 0, color: Colors.transparent)),
                      child: ExpansionPanelList(
                        animationDuration: Duration(milliseconds: 800),
                        children: [
                          ExpansionPanel(
                            backgroundColor: backGroudColor,
                            headerBuilder: (context, isExpanded) {
                              return ListTile(
                                title: Text(
                                  'M-BCA (BCA MOBILE)',
                                  style: title4(15, black)
                                      .copyWith(fontWeight: FontWeight.w600),
                                ),
                              );
                            },
                            body: Column(
                              children: [
                                ListTile(
                                  title: Text('This is the step 1 title',
                                      style: TextStyle(color: Colors.black)),
                                  subtitle: Text(
                                    'argument is null, the text will use the style from the closest enclosingargument is null, the text will use the style from the closest enclosing',
                                    style: captionText1().copyWith(
                                        color: black.withOpacity(.6),
                                        fontSize: 13),
                                  ),
                                ),
                                ListTile(
                                  title: Text('This is the step 2 title',
                                      style: TextStyle(color: Colors.black)),
                                  subtitle: Text(
                                    'argument is null, the text will use the style from the closest enclosingargument is null, the text will use the style from the closest enclosing',
                                    style: captionText1().copyWith(
                                        color: black.withOpacity(.6),
                                        fontSize: 13),
                                  ),
                                ),
                              ],
                            ),
                            isExpanded: _expanded2,
                            canTapOnHeader: true,
                          ),
                        ],
                        elevation: 0,
                        expansionCallback: (panelIndex, isExpanded) {
                          _expanded2 = !_expanded2;
                          setState(() {});
                        },
                      ),
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
