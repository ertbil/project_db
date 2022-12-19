import 'package:flutter/material.dart';

import 'drop_down_button.dart';

class Footer extends StatelessWidget {
  const Footer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        color: Colors.grey,
        height: MediaQuery
            .of(context)
            .size
            .height * 0.3,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            SizedBox(
              width: MediaQuery
                  .of(context)
                  .size
                  .width * 0.3,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  CustomDropDownButton(
                    items: [], hintText: "Anakara", onChanged: (value) {

                  },
                  ),
                  CustomDropDownButton(
                    hintText: "Anakara", onChanged: (value) {

                  }, items: [],
                  ),
                  CustomDropDownButton(
                    hintText: "Anakara", onChanged: (value) {

                  }, items: [],
                  ),

                ],
              ),

            ),
            SizedBox(
              width: MediaQuery
                  .of(context)
                  .size
                  .width * 0.2,
              height: MediaQuery
                  .of(context)
                  .size
                  .height * 0.2,
              child: Image.asset("assets/images/maps.png",
                fit: BoxFit.cover,),

            )
          ],
        ),
      ),
    );
  }
}