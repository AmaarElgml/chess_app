import 'package:flutter/material.dart';
import '../../app_theme.dart';

Widget customDivider = Container(
  width: double.infinity,
  height: .5,
  color: Colors.white,
);

class TitleText extends StatelessWidget {
  TitleText({required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: defSpacing, bottom: defSpacing / 4),
        child: Row(children: [
          Text("$title", style: TextStyle(color: Colors.black54, fontSize: 20.0, fontWeight: FontWeight.w900))
        ]));
  }
}

class CustomTextField extends StatelessWidget {
  CustomTextField({
    required this.hint,
    this.iconData,
    required this.onSaved,
    this.controller,
    this.inputType,
    this.obscure = false,
  });

  final String hint;
  final bool obscure;
  final IconData? iconData;
  final TextInputType? inputType;
  final Function onSaved;
  final TextEditingController? controller;

  String _getErrorMessage() {
    return 'Value is empty';
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        controller: controller != null ? controller : null,
        validator: (value) {
          if (value == null || value.trim().isEmpty) return _getErrorMessage();
        },
        onSaved: (value) {
          onSaved(value);
        },
        keyboardType: inputType ?? TextInputType.text,
        obscureText: obscure,
        decoration: InputDecoration(hintText: hint, prefixIcon: Icon(iconData), fillColor: Colors.white, filled: true));
  }
}

class CustomButton extends StatelessWidget {
  CustomButton({required this.title, required this.onPressed, this.titleColor, this.backColor});

  final String title;
  final Color? titleColor;
  final Color? backColor;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          onPressed();
        },
        child: Text(
          title,
          style: TextStyle(fontSize: 18.0, color: titleColor ?? Colors.white),
        ),
        style: ButtonStyle(
          padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(defSpacing * .75)),
          shape:
              MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(defSpacing /4))),
          backgroundColor: MaterialStateProperty.all(backColor ?? primaryColor),
        ));
  }
}

class CustomIconButton extends StatelessWidget {
  CustomIconButton({
    required this.icon,
    required this.onPressed,
  });

  final IconData icon;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
        icon: Icon(icon, color: primaryColor),
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onPressed: () {
          onPressed();
        });
  }
}

class CustomCircularProgress extends StatelessWidget {
  CustomCircularProgress(this.color);

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Center(child: CircularProgressIndicator(color: color));
  }
}
