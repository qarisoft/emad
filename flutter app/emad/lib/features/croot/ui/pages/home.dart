import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';
// import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    // go();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      // backgroundColor: const Color(0xffE5E5E5),
      body: SafeArea(
          child: Stack(
            fit: StackFit.expand,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        top: 39,
                        bottom: 25,
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Hi John",
                                // style: GoogleFonts.workSans(
                                //   textStyle: TextStyle(
                                //     fontSize: 20.sp,
                                //     color: Colors.black,
                                //     fontStyle: FontStyle.normal,
                                //     fontWeight: FontWeight.w600,
                                //   ),
                                // ),
                              ),
                              Text(
                                DateTime.now().toString(),
                                // style: GoogleFonts.workSans(
                                //   textStyle: TextStyle(
                                //     fontSize: 16,
                                //     color: Colors.black,
                                //     fontStyle: FontStyle.normal,
                                //     fontWeight: FontWeight.w400,
                                //   ),
                                // ),
                              ),
                            ],
                          ),
                          IconButton(
                              onPressed: () {
                                // context.pop();
                              },
                              icon: const Icon(Icons.notifications))
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 31),
                      child: TextFormField(
                        readOnly: true,
                        //false
                        autofocus: false,
                        // style: ,
                        decoration: InputDecoration(
                          prefixIcon: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8),
                            child: const Icon(Icons.search, color: Colors.black),
                          ),
                          prefixIconConstraints: BoxConstraints(maxHeight: 20, maxWidth: 35),
                          hintText: "Search...",
                          // hintStyle: textFieldPlaceholderTextStyle(context),
                          isDense: true,
                          filled: true,
                          // fillColor: ColorName.grayC4,
                          // focusedBorder: AppStyles.focusedTransparentBorder,
                          // disabledBorder: AppStyles.focusedTransparentBorder,
                          // enabledBorder: AppStyles.focusedTransparentBorder,
                          // errorBorder: AppStyles.focusedTransparentBorder,
                          // focusedErrorBorder: AppStyles.focusedTransparentBorder,
                          // errorStyle: errorTextStyle(context),
                        ),
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.text,
                        onSaved: (val) {},
                        onEditingComplete: () {},
                        onChanged: (val) {},
                        // validator: (val) {},
                        onTap: () {
                          // context.pop();
                        },
                      ),
                    ),
                    SizedBox(
                      // height: 123.h,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "How do you feel today?",
                            // style: GoogleFonts.workSans(
                              // textStyle: TextStyle(
                              //   fontSize: 14.sp,
                              //   color: Colors.black,
                              //   fontStyle: FontStyle.normal,
                              //   fontWeight: FontWeight.w600,
                              // ),
                            // ),
                          ),

                          // ),
                        ],
                      ),
                    ),
                    // 15.verticalSpace,
                    Expanded(
                      child: Container(
                        // color: Colors.red,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Wrap(
                              direction: Axis.horizontal,
                              children: [
                                for (var i = 0; i < 8; i++)
                                  Container(
                                    width: 50,
                                    height: 50,
                                    margin: EdgeInsets.all(10),
                                    color: Colors.blue,
                                  )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    // ElevatedButton(onPressed: (){}, child: Text('das')),
                    SizedBox(height: 20,)
                    // Expanded(child: Container(color: Colors.black,))
                  ],
                ),
              ),
            ],
          )),
      floatingActionButton: FloatingActionButton(onPressed: ()=>{},child: Icon(Icons.add),),
    );
  }
}