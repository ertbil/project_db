import 'package:flutter/material.dart';
import 'package:project_db/components/custom_drawer.dart';
import 'package:project_db/components/custom_text_form_field.dart';
import 'package:project_db/services/router_service.dart';

import '../components/Custom_carousel.dart';



class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController _controller = TextEditingController();
    _controller.text = '1';
    SliverGridDelegate gridDelegate = const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      mainAxisSpacing: 10,
      crossAxisSpacing: 10,
      childAspectRatio: 1,
    );
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: AppBar(
        title: const Text("FriendYol"),
        actions: [
          SizedBox(
            width: MediaQuery
                .of(context)
                .size
                .width * 0.5,
            child: CustomTextFormField(
              hintText: 'Search',
              prefixIcon: const Icon(Icons.search),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: PopupMenuButton(
                itemBuilder: (BuildContext context) {
                  return [
                    PopupMenuItem(child: SizedBox(
                      width: 200,
                      height: 80,
                      child: ListTile(title: const Text('product'),subtitle: Row(
                        children: [
                          IconButton(onPressed: () {

                          }, icon: const Icon(Icons.minimize)),
                          SizedBox(
                            width: 30,
                            height: 30,
                            child: TextField(
                              controller: _controller,
                              onChanged: (value) {
                                _controller.text = value;
                              },

                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),

                                ),
                                fillColor: Colors.grey,


                              ),

                            ),
                          ),
                          IconButton(onPressed: () {

                          }, icon: const Icon(Icons.add)),
                           IconButton(onPressed: () {

                           }, icon: const Icon(Icons.delete)),

                        ],
                      ),),
                    ),),

                  ];



                }, icon: const Icon(Icons.shopping_cart)),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: PopupMenuButton(
              onSelected: (value) {
                RouterService.pushNamed(context, value);

              },
                itemBuilder: (BuildContext context) {
                  return [
                    const PopupMenuItem<String>(
                      value: '/profile',
                      child: Text("My Account"),
                    ),

                    const PopupMenuItem<String>(
                      value: '/settings',
                      child: Text("Settings"),
                    ),

                    const PopupMenuItem<String>(
                      value: '/login',
                      child: Text("Logout"),
                    ),
                  ];
                },
                icon: const CircleAvatar(
                  radius: 20,
                  child: Icon(
                    Icons.person,
                    size: 20,
                  ),
                )),
          ),
        ],
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Container(
              height: MediaQuery
                  .of(context)
                  .size
                  .height * 0.5,
              child: CarouselWithIndicatorDemo(),
            ),
          ),
          SliverGrid(
            delegate: SliverChildBuilderDelegate(
                  (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    elevation: 5,
                    child: Column(
                      children: [
                        Expanded(
                          child: Image.network(
                            'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80',
                            fit: BoxFit.cover,
                          ),
                        ),
                        const Text('Product Name'),
                        const Text('Price'),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.favorite),
                              onPressed: () {},
                            ),
                            IconButton(
                                icon: const Icon(Icons.arrow_forward_outlined),
                                onPressed: () {})
                          ],
                        )
                      ],
                    ),
                  ),
                );
              },
              childCount: 10,
            ),
            gridDelegate: gridDelegate,
          ),
        ],
      ),
    );
  }
}
