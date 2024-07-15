import 'package:emad_app/data/db.dart';
import 'package:emad_app/domain/responses/product.dart';
import 'package:emad_app/ui/shared/colors.dart';
import 'package:emad_app/ui/shared/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// import '../../../gen/assets.gen.dart';
// import '../../../gen/colors.gen.dart';
// import '../../res/styles.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

// import 'widgets/bottom_sheet.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  go()async{
    // insert into charges (type,quantity,positive,product_id) values ('in',10,1,1 );
    final db = await SqlHelper.db();

    // await db.rawQuery('''
    // insert into charges (type,quantity,positive,product_id) values ('in',40,1,3 );
    // ''');
    // await db.rawQuery('''
    // insert into charges (type,quantity,positive,product_id) values ('in',20,1,4 );
    // ''');
    // await db.rawQuery('''
    // insert into charges (type,quantity,positive,product_id) values ('in',10,1,2 );
    // ''');
    // await db.rawQuery('''
    // insert into charges (type,quantity,positive,product_id) values ('out',2,-1,2 );
    // ''');
    // await db.rawQuery('''
    // insert into charges (type,quantity,positive,product_id) values ('out',7,-1,2 );
    // ''');
	        // sum(CASE WHEN  positive > 0 THEN 1 ELSE  0 END) positives,
	        // sum(CASE WHEN  positive <= 0 THEN 1 ELSE 0 END) negatives
    var re = await db.rawQuery('''
    select 
          p.id,
          p.name,
          p.created_at,
          p.updated_at,
          p.active,
	        sum(quantity * positive) available
       from products p
       join charges c on p.id=c.product_id
        	GROUP by product_id;
    ''');

        for (var element in re) {
          final ProductResponse productResponse = ProductResponse.fromJson(element);
          print(productResponse);
        }
    // print(
    // );
    // re.map((a)=>print(a));
  }
  @override
  void initState() {
    // go();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        backgroundColor: const Color(0xffE5E5E5),
        body: SafeArea(
            child: Stack(
          fit: StackFit.expand,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      top: 39.h,
                      bottom: 25.h,
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
                              style: GoogleFonts.workSans(
                                textStyle: TextStyle(
                                  fontSize: 20.sp,
                                  color: Colors.black,
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            Text(
                              DateTime.now().toString(),
                              style: GoogleFonts.workSans(
                                textStyle: TextStyle(
                                  fontSize: 16.sp,
                                  color: Colors.black,
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ],
                        ),
                        IconButton(
                            onPressed: () {
                              context.pop();
                            },
                            icon: const Icon(Icons.notifications))
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 31.h),
                    child: TextFormField(
                      readOnly: true,
                      //false
                      autofocus: false,
                      // style: ,
                      decoration: InputDecoration(
                        prefixIcon: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.w),
                          child: const Icon(Icons.search, color: Colors.black),
                        ),
                        prefixIconConstraints: BoxConstraints(maxHeight: 20.w, maxWidth: 35.w),
                        hintText: "Search...",
                        // hintStyle: textFieldPlaceholderTextStyle(context),
                        isDense: true,
                        filled: true,
                        fillColor: ColorName.grayC4,
                        focusedBorder: AppStyles.focusedTransparentBorder,
                        disabledBorder: AppStyles.focusedTransparentBorder,
                        enabledBorder: AppStyles.focusedTransparentBorder,
                        errorBorder: AppStyles.focusedTransparentBorder,
                        focusedErrorBorder: AppStyles.focusedTransparentBorder,
                        errorStyle: errorTextStyle(context),
                      ),
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.text,
                      onSaved: (val) {},
                      onEditingComplete: () {},
                      onChanged: (val) {},
                      // validator: (val) {},
                      onTap: () {
                        context.pop();
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
                          style: GoogleFonts.workSans(
                            textStyle: TextStyle(
                              fontSize: 14.sp,
                              color: Colors.black,
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),

                        // ),
                      ],
                    ),
                  ),
                  15.verticalSpace,
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
                                  width: 50.w,
                                  height: 50.h,
                                  margin: EdgeInsets.all(10.w),
                                  color: Colors.blue,
                                )
                            ],
                          ),
                        ],
                      ),
                      // height: 74.h,
                      // child: ListView.separated(
                      //   physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                      //   scrollDirection: Axis.horizontal,
                      //   itemCount: moods.length,
                      //   itemBuilder: (c, i) {
                      //     return Column(
                      //       children: [
                      //         ClipRRect(
                      //           borderRadius: BorderRadius.circular(8.r),
                      //           child: Container(
                      //             width: 50.h,
                      //             height: 50.h,
                      //             color: ColorName.grayC4,
                      //             child: Center(
                      //               child: Text(
                      //                 moods[i].emoji,
                      //                 style: TextStyle(fontSize: 28.sp),
                      //               ),
                      //             ),
                      //           ),
                      //         ),
                      //         Text(
                      //           moods[i].name,
                      //           maxLines: 1,
                      //           overflow: TextOverflow.ellipsis,
                      //           style: GoogleFonts.workSans(
                      //             textStyle: TextStyle(
                      //               fontSize: 12.sp,
                      //               color: Colors.black,
                      //               fontStyle: FontStyle.normal,
                      //               fontWeight: FontWeight.w400,
                      //             ),
                      //           ),
                      //         ),
                      //       ],
                      //     );
                      //   },
                      //   separatorBuilder: (BuildContext context, int index) {
                      //     return SizedBox(
                      //       width: 42.w,
                      //     );
                      //   },
                    ),
                  ),
                  // Expanded(child: Container(color: Colors.black,))
                ],
              ),
            ),
          ],
        )),
      floatingActionButton: FloatingActionButton(onPressed: ()=>go(),child: Icon(Icons.add),),
        );
  }
}

class Mood {
  final String name;
  final String emoji;

  Mood({required this.name, required this.emoji});
}
