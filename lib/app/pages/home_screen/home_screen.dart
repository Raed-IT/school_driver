import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 2,
        flexibleSpace: SafeArea(
          child: SizedBox(
            height: 250.h,
            child: Column(
              children: [
                Row(
                  children: [Icon(Icons.menu,color: Colors.red,)],
                ),
                  Text(  'تجربه ' ,style:  Theme.of(context).textTheme.headline1,),
                  Text(  'تجربه ' ,style:  Theme.of(context).textTheme.headline2,),
                  Text(  'تجربه ' ,style:  Theme.of(context).textTheme.headline3,)
              ],
            ),
          ),
        ),

      ),
    );
  }
}
