import 'package:flutter/material.dart';

class ProductDetailPage extends StatelessWidget {
  const ProductDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: const Text("Produt name",style: TextStyle(fontSize: 20),),
                ),
              ],
            ),

            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.4,
                    height: MediaQuery.of(context).size.height * 0.4,
                    child: Image.network(
                      'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.4,
                     height: MediaQuery.of(context).size.height * 0.4,


                    child: ListView(
                      children: [
                        ListTile(
                          title: const Text("Product Name"),
                        ),
                        Divider(),
                        ListTile(
                          title: const Text("Product Price"),
                        ),
                        Divider(),
                        ListTile(
                          title: const Text("Product Description"),
                        ),
                        Divider(),
                        ListTile(
                          title: const Text("Product Category"),
                        ),
                        Divider(),
                        ListTile(
                          title: const Text("Product Brand"),
                        ),
                        Divider(),
                        ListTile(
                          title: const Text("Product Color"),
                        ),
                        Divider(),



                      ],
                    ),
                  ),
                )


              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: const Text("Yorumlar",style: TextStyle(fontSize: 20),),
                ),
              ],
            ),
           ListView.separated(itemBuilder: (context,index){

             return ListTile(
               leading: const CircleAvatar(
                 child: Icon(Icons.person),
               ),
               title: const Text("john Doe"),
               subtitle: const Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed euismod, nunc vel tincidunt luctus, nunc nunc aliquet nisl, eu aliquet nunc nunc euismod nisl. Sed euismod, nunc vel tincidunt luctus, nunc nunc aliquet nisl, eu aliquet nunc nunc euismod nisl."),

               trailing: const Icon(Icons.star),


             );
           },itemCount: 10,shrinkWrap: true, separatorBuilder: (BuildContext context, int index) { return Divider(); },)
          ],
        ),
      ),
    );
  }
}
