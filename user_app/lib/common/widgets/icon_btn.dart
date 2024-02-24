import 'package:flutter/material.dart';
import 'package:user_app/utils/user_full_functions.dart';

class Btn extends StatelessWidget {
  Btn(
      {super.key,
      this.textColor,
      required this.text,
      required this.color,
      required this.borderColor,
      required this.needIcon,
      this.needPdfIcon,
      required this.onTap,
      this.icon});

  final String text;
  final Color color;
  final bool needIcon;
  final Function onTap;
  final Color borderColor;
  final Color? textColor;
  final bool? needPdfIcon;
  IconData? icon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap();
      },
      child: Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.only(top: 20, bottom: 20),
          height: 50,
          width: getDeviceWidth(context) * 0.95,
          decoration: BoxDecoration(
              border: Border.all(color: borderColor),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset: const Offset(0, 3), // changes position of shadow
                ),
              ],
              color: color),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              needPdfIcon ?? false
                  ? const Row(
                      children: [
                        Icon(
                          Icons.picture_as_pdf,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                      ],
                    )
                  : const SizedBox(),
              Text(
                text,
                style: TextStyle(
                    fontSize: 18,
                    color: textColor ?? Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              needIcon
                  ? Row(
                      children: [
                        SizedBox(
                          width: 10,
                        ),
                        Icon(
                          icon ?? Icons.arrow_forward,
                          color: Colors.white,
                        )
                      ],
                    )
                  : const SizedBox()
            ],
          )),
    );
  }
}
