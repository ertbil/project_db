import 'package:flutter/material.dart';

class CustomDropDownButton extends StatelessWidget {
  const CustomDropDownButton({Key? key, this.items,required this.hintText, required this.onChanged,this.value}) : super(key: key);

 final  List<DropdownMenuItem<Object>>? items;
 final String hintText;
 final void Function(Object?)? onChanged;
 final value;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: DropdownButtonFormField(
          value: value,
          hint: Text(hintText),
          decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.0),
                borderSide: BorderSide.none,
              ),
              filled: true,
              fillColor: Colors.grey[200],
              prefixIcon: const Icon(Icons.class_)),
          items: items,
          onChanged: onChanged,
        )
    );
  }

  }

