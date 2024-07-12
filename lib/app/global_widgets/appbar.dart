import 'package:donitaa_client/common/strings/resources.dart';
import 'package:donitaa_client/common/styles/styles.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar(
      {Key? key,
      required this.icon,
      required this.onTap1,
      this.onTap2,
      this.text,
      this.icon1,
      this.buttonText})
      : super(key: key);
  final String icon;
  final Function onTap1;
  final Function? onTap2;
  final String? text;
  final String? icon1;
  final String? buttonText;
  @override
  Size get preferredSize => const Size(double.maxFinite, 50);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: GestureDetector(
        onTap: () {
          onTap1();
        },
        child: Image.asset(icon),
      ),
      centerTitle: true,
      title: Text(
        text ?? '',
        style: appBarTitle(),
      ),
      actions: [
        icon1 != null
            ? Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: GestureDetector(
                  onTap: () {
                    onTap2 != null ? onTap2!() : print('Null');
                  },
                  child: Image.asset(icon1 ?? ''),
                ),
              )
            : const SizedBox(),
        buttonText != null
            ? Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                child: GestureDetector(
                  onTap: () {
                    onTap2 != null ? onTap2!() : print('Null');
                  },
                  child: Text(
                    buttonText ?? '',
                    style: appBarTitle().copyWith(color: red),
                  ),
                ),
              )
            : const SizedBox()
      ],
    );
  }
}
