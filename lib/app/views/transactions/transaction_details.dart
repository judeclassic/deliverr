import 'package:donitaa_client/app/global_widgets/auth_button.dart';
import 'package:donitaa_client/app/global_widgets/inputfield.dart';
import 'package:donitaa_client/app/global_widgets/texts.dart';
import 'package:donitaa_client/common/strings/resources.dart';
import 'package:donitaa_client/common/styles/styles.dart';
import 'package:donitaa_client/generated/l10n.dart';
import 'package:flutter/material.dart';

class TransDetails extends StatefulWidget {
  const TransDetails({Key? key}) : super(key: key);

  @override
  _TransDetailsState createState() => _TransDetailsState();
}

class _TransDetailsState extends State<TransDetails> {
  List groupvalue = [5];
  int first = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGroudColor,
      appBar: AppBar(
        backgroundColor: backGroudColor,
        elevation: 0,
        leading: GestureDetector(
          child: Image.asset(backIcon),
        ),
        title: Text(' '),
        actions: [
          GestureDetector(
            child: Icon(
              Icons.share_outlined,
              color: black,
            ),
          ),
          SizedBox(width: 15),
          GestureDetector(
            child: Icon(
              Icons.more_vert_outlined,
              color: black,
            ),
          ),
          SizedBox(width: 20)
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            dividerTopWidget(2),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Transform.scale(
                    scale: 2,
                    child: Radio(
                      value: groupvalue,
                      groupValue: groupvalue,
                      onChanged: (val) {
                        setState(() {
                          groupvalue.add(val);
                        });
                      },
                    ),
                  ),
                  Text(
                    '- - -',
                    style: TextStyle(color: red, fontSize: 10),
                  ),
                  Transform.scale(
                    scale: 2,
                    child: Radio(
                      value: groupvalue,
                      groupValue: groupvalue,
                      onChanged: (val) {
                        setState(() {
                          groupvalue.add(val);
                        });
                      },
                    ),
                  ),
                  Text(
                    '- - -',
                    style: TextStyle(color: red, fontSize: 10),
                  ),
                  Transform.scale(
                    scale: 2,
                    child: Radio(
                      value: groupvalue,
                      groupValue: groupvalue,
                      onChanged: (val) {
                        setState(() {
                          groupvalue.add(val);
                        });
                      },
                    ),
                  ),
                  Text(
                    '- - -',
                    style: TextStyle(color: red, fontSize: 10),
                  ),
                  Transform.scale(
                    scale: 2,
                    child: Radio(
                      value: 4,
                      groupValue: groupvalue,
                      onChanged: (val) {
                        setState(() {
                          groupvalue.add(val);
                        });
                      },
                    ),
                  ),
                  Text(
                    '- - -',
                    style: TextStyle(color: red, fontSize: 10),
                  ),
                  Transform.scale(
                    scale: 2,
                    child: Radio(
                      value: 2,
                      groupValue: groupvalue,
                      onChanged: (val) {
                        setState(() {
                          groupvalue.add(val);
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
            dividerTopWidget(5),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  authButton(context, () => print('View Detailed status'),
                      text: 'View Detailed Status', backGroundColor: red),
                  SizedBox(height: 20),
                  title('Delivery Details', black),
                  SizedBox(height: 10),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Image.asset(originIcon),
                      SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Rifki Aflaza Arba | +6289912345678',
                            style: title4(14, black),
                          ),
                          SizedBox(height: 10),
                          Text(
                            'Jl. Muria Tanjakan No.4',
                            style: title4(10, black.withOpacity(.5)),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width - 100,
                            child: dividerTopWidget(1),
                          ),
                          Text(
                            S.of(context).pickup,
                            style: title4(12, black.withOpacity(.5)),
                          ),
                          SizedBox(height: 10),
                          Text(
                            'Sunday, May 23 16:00 - 18:00',
                            style: title4(13, black),
                          ),
                          SizedBox(height: 4),
                          Container(
                            width: MediaQuery.of(context).size.width - 100,
                            child: dividerTopWidget(1),
                          ),
                        ],
                      )
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Image.asset(destinationIcon),
                      SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Rifki Aflaza Arba | +6289912345678',
                            style: title4(14, black),
                          ),
                          SizedBox(height: 10),
                          Text(
                            'Jl. Muria Tanjakan No.4',
                            style: title4(10, black.withOpacity(.5)),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width - 100,
                            child: dividerTopWidget(1),
                          ),
                          Text(
                            S.of(context).pickup,
                            style: title4(12, black.withOpacity(.5)),
                          ),
                          SizedBox(height: 10),
                          Text(
                            'Sunday, May 23 16:00 - 18:00',
                            style: title4(13, black),
                          ),
                          SizedBox(height: 4),
                          Container(
                            width: MediaQuery.of(context).size.width - 100,
                            child: dividerTopWidget(1),
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
            dividerTopWidget(5),
            Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  title(S.of(context).package_details, black),
                  SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Books & Documents',
                        style: title4(14, black)
                            .copyWith(fontWeight: FontWeight.w500),
                      ),
                      Text(
                        ' ',
                        style: title4(
                          12,
                          black.withOpacity(.5),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 7),
                  dividerTopWidget(1),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        S.of(context).small,
                        style: title4(14, black)
                            .copyWith(fontWeight: FontWeight.w500),
                      ),
                      Text(
                        '20x20x8 cm',
                        style: title4(
                          12,
                          black.withOpacity(.5),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 7),
                  dividerTopWidget(1),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Insurance',
                        style: title4(14, black)
                            .copyWith(fontWeight: FontWeight.w500),
                      ),
                      Text(
                        'Up to IDR 1.000.000 covered',
                        style: title4(
                          12,
                          black.withOpacity(.5),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 7),
                  dividerTopWidget(1),
                ],
              ),
            ),
            dividerTopWidget(5),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    S.of(context).total_payment + ': Rp 8.000',
                    style:
                        title4(14, black).copyWith(fontWeight: FontWeight.w500),
                  ),
                  GestureDetector(
                    onTap: () => print('Show Details'),
                    child: Text(
                      'Show Details',
                      style:
                          title4(14, red).copyWith(fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
