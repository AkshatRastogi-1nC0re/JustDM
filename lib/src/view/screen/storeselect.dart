import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class StoreSelect extends StatefulWidget {
  const StoreSelect({Key? key}) : super(key: key);

  @override
  _StoreSelectState createState() => _StoreSelectState();

}

int col1=0;
class _StoreSelectState extends State<StoreSelect> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Color(0xfffcf0d6),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 20,),
              MediaQuery.of(context).size.width>470?Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Image(
                    height: 100,
                    image: AssetImage(
                      "assets/logo1.png",
                    ),
                    fit: BoxFit.cover,
                  ),
                  SizedBox(width: 20,),

                  Text(
                      "Select PickUp Point",
                      style: TextStyle(
                          height: 1.3,
                          fontFamily: "Metrisch-ExtraBold",
                          fontSize: 30)),
                ],
              ):Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                // crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Image(
                    height: 100,
                    image: AssetImage(
                      "assets/logo1.png",
                    ),
                    fit: BoxFit.cover,
                  ),
                  SizedBox(height: 20,),

                  Text(
                      "Select PickUp Point",
                      style: TextStyle(
                          height: 1.3,
                          fontFamily: "Metrisch-ExtraBold",
                          fontSize: 30)),
                ],
              ),
              SizedBox(height: 50,),
              ResponsiveBuilder(
                breakpoints: ScreenBreakpoints(tablet: 550, desktop: 800, watch: 300),
                builder: (context, sizingInformation) {
                  // Check the sizing information here and return your UI
                  if (sizingInformation.deviceScreenType == DeviceScreenType.desktop) {
                    return ;
                  }

                  // return ;
                },
              )

            ],
          ),
        ),
      ),
    );
  }
}
