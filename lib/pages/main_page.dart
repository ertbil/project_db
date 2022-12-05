import 'package:flutter/material.dart';
import 'package:project_db/components/custom_text_form_field.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("FriendYol"),
        actions: [
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.5,
            child: CustomTextFormField(
              hintText: 'Search',
              prefixIcon: const Icon(Icons.search),
            ),
          ),


          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(onPressed: () {

            }, icon: const Icon(Icons.shopping_cart)),
          ),


        ],
      ),
    );
  }
}


