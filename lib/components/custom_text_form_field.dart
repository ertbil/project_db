import 'package:flutter/material.dart';

class CustomTextFormField extends StatefulWidget {
  String hintText;
  String? labelText;
  String? errorText;
  bool isPassword;
  bool isEmail;
  bool isPhone;
  bool isNumber;
  TextEditingController? controller;
  Icon? prefixIcon;
  Icon? suffixIcon;
  bool isHidden;
  double? padding;




  CustomTextFormField(
      {
        Key? key,
        required this.hintText,
        this.labelText,
        this.errorText = "Error",
        this.isPassword = false,
        this.isEmail = false,
        this.isPhone = false,
        this.isNumber = false,
        this.controller,
         this.prefixIcon,
        this.suffixIcon,
        this.isHidden = true,
        this.padding = 8.0,



      }
      ) : super(key: key);




  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.all(widget.padding??8.0),
      child: TextFormField(
        obscureText: widget.isHidden && widget.isPassword,
        validator: (value) {
          //TODO : Add more validators
        },
        controller: widget.controller,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
            borderSide: BorderSide.none,
          ),
          labelText: widget.hintText,
          floatingLabelStyle: const TextStyle(
            height: 0.5,
          ),
          filled: true,
          fillColor: Colors.grey[200],

          prefixIcon: widget.prefixIcon,
          suffixIcon: widget.isPassword
              ? IconButton(
              onPressed: () {
                setState(() {
                  widget.isHidden = !widget.isHidden;

                });
              },
              icon: widget.isHidden
                  ? const Icon(Icons.remove_red_eye_rounded)
                  : const Icon(Icons.remove_red_eye_outlined))
              : null,
        ),
      ),
    );
  }
}
