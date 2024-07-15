// import 'package:emad/core/theme/theme.dart';
import 'package:emad/features/croot/ui/ex.dart';
import 'package:emad/features/croot/ui/widgets/common/search.dart';
import 'package:emad/features/croot/ui/widgets/resource/title_with_search.dart';
import 'package:flutter/material.dart';

class Resource extends StatelessWidget {
  const Resource({super.key,  required this.title,  
    required this.createFunction, required this.createForm,});
  final String title;
  final VoidCallback createFunction;
  final Widget createForm;
  

  @override
  Widget build(BuildContext context) {
    return  Padding(
        padding: EdgeInsets.all(5.w),
        child:  Column(
          children: [
             ResourceTitle(title:'Products',createForm: Center(),),
            SizedBox(height: 10.h,),
            // Expanded(child: Container(
              // color: Colors.white,
              // child: DataTableDemo(),
              // color: Colors.red,
            // ))

          ],
        ),
    );
  }
}


class _FullScreenDialogDemo extends StatelessWidget {
  const _FullScreenDialogDemo({required this.child,this.title = 'title',this.closeString='close'});
  final String title;
  final String closeString;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ApplyTextOptions(
      child: Scaffold(
        appBar: AppBar(
          title: Text(title),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                closeString,
                style: theme.textTheme.bodyMedium,
              ),
            ),
          ],
        ),
        body:child,
      ),
    );
  }
} // Ap// plies text AppOptions to a widget
