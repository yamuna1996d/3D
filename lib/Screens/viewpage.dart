import 'package:dapp/NavBar_Components/whishlist_products.dart';
import 'package:dapp/Screens/Catagory_Screen.dart';
import 'package:dapp/Screens/Details.dart';
import 'package:dapp/Screens/MyBag.dart';
import 'package:dapp/components/glitch.dart';
import 'package:dapp/constraints.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:imageview360/imageview360.dart';
import 'package:flutter/material.dart';

class DemoPage extends StatefulWidget {
  DemoPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _DemoPageState createState() => _DemoPageState();
}

class _DemoPageState extends State<DemoPage> {
  List<AssetImage> imageList = List<AssetImage>();
  bool autoRotate = true;
  int rotationCount = 2;
  int swipeSensitivity = 2;
  bool allowSwipeToRotate = true;
  RotationDirection rotationDirection = RotationDirection.anticlockwise;
  Duration frameChangeDuration = Duration(milliseconds: 50);
  bool imagePrecached = false;

  @override
  void initState() {
    //* To load images from assets after first frame build up.
    WidgetsBinding.instance
        .addPostFrameCallback((_) => updateImageList(context));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor:PrimaryColor,
      body: SingleChildScrollView(
        child: Column(
                   children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 0),
                                child: SizedBox(
                                  height: 600,
                                  child: Row(
                                    children: <Widget>[
                                      Expanded(
                                        child: Padding(
                                          padding:
                                          const EdgeInsets.symmetric(vertical: DefaultPadding * 7),
                                          child: Column(
                                            children: <Widget>[
                                              GestureDetector(
                                                  onTap: (){
                                                    Navigator.pop(context);
                                                  },
                                                  child: IconCard(icon: "assets/reply-message.svg")),
                                              GestureDetector(
                                                  onTap: (){

                                                  },
                                                  child: IconCard(icon: "assets/paintbrush.svg")),
                                              GestureDetector(
                                                  onTap: (){
                                                    Navigator.push(context, MaterialPageRoute(builder: (context)=>CategoryScreen()));
                                                  },
                                                  child: IconCard(icon: "assets/category.svg")),

                                            ],
                                          ),
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(top: 0),
                                        height: 480 ,
                                        width: size.width * 0.75,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(63),
                                            bottomLeft: Radius.circular(63),
                                          ),
                                          boxShadow: [
                                            BoxShadow(
                                              offset: Offset(0, 10),
                                              blurRadius: 60,
                                              color: PrimaryColor.withOpacity(0.29),
                                            ),
                                          ],
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.only(top: 90,left: 10),
                                          child: Column(
                                            children: [
                                              Container(
                                                color: Colors.white,
                                                child: GlithEffect(
                                                  child: Text("swipe",style: TextStyle(color: PrimaryColor,),),
                                                ),
                                              ),
                                              (imagePrecached == true)
                                                  ? ImageView360(
                                                key: UniqueKey(),
                                                imageList: imageList,
                                                autoRotate: false,
                                                rotationCount: 2,
                                                rotationDirection: RotationDirection.anticlockwise,
                                                frameChangeDuration: Duration(milliseconds: 170),
                                                swipeSensitivity: swipeSensitivity,
                                                allowSwipeToRotate: allowSwipeToRotate,
                                              )
                                                  : Text("Pre-Caching images..."),
                                            ],
                                          ),
                                        )

                                      ),
                                    ],
                                  ),
                                ),

                  ),
            Container(
              child: Padding(
                padding: const EdgeInsets.only(right: 10,left: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "CAMERA",
                          style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          "SONY",
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.white70,
                          ),
                        ),
                        SizedBox(height: 8),
                        RatingBar.builder(
                          initialRating: 4,
                          minRating: 1,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemSize: 13,
                          itemCount: 5,
                          itemPadding: EdgeInsets.symmetric(horizontal: 1),
                          itemBuilder: (context, _) => Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          unratedColor: Colors.grey,
                          onRatingUpdate: (rating) {
                            //print(rating);
                          },
                        )
                      ],
                    ),
                    Text(
                      "\₹450,000",
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Container(
                  width: 343,
                  child: Text(
                    "The 2020 All New Honda City has been launched in India. A fifth generation for the City, it is being offered in three trims that include V, VX and ZX. There are five colours including radiant red metallic, platinum pearl white, modern steel metallic, golden brown metallic and lunar silver metallic. The prices range from Rs 10.89 lakh to Rs 14.64 lakh (all prices, ex-showroom, Delhi)",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      letterSpacing: 1,
                      height: 1.5,
                    ),
                  ),
                ),
              ),


            // Container(
            //   height: 200,
            //   child: ListView.builder(
            //     itemCount: 4,
            //     scrollDirection: Axis.horizontal,
            //     itemBuilder: (context, index) {
            //       return Container(
            //           decoration: BoxDecoration(
            //               color: PrimaryColor,
            //               borderRadius: BorderRadius.circular(20)),
            //           padding: EdgeInsets.only(bottom: 10,top: 10),
            //           //margin: EdgeInsets.only(bottom: 2,top: 2),
            //           //height: 50,
            //           width: 100,
            //           child: Column(
            //             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //             children: <Widget>[
            //               index == 0
            //                   ? Icon(
            //                 Icons.av_timer,
            //                 size: 40,
            //                 color: Colors.grey[300],
            //               )
            //                   : Icon(
            //                 Icons.add_road,
            //                 size: 40,
            //                 color: Colors.grey[300],
            //               ),
            //               index == 0
            //                   ? Text(
            //                 "410 KM/h",
            //                 style: TextStyle(
            //                     fontSize: 15,
            //                     fontWeight: FontWeight.w800,
            //                     letterSpacing: 1.5,
            //                     color: Colors.grey[300]),
            //               )
            //                   : Text(
            //                 "13.6L",
            //                 style: TextStyle(
            //                     fontSize: 18,
            //                     fontWeight: FontWeight.w800,
            //                     letterSpacing: 1.5,
            //                     color: Colors.grey[300]),
            //               )
            //             ],
            //           ));
            //     },
            //   ),
            // ),
            Padding(
              padding: const EdgeInsets.only(top: 41),
              child: Row(
                children: <Widget>[
                  SizedBox(
                    width: size.width / 2,
                    height: 69,
                    child: FlatButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(40),
                        ),
                      ),
                      color: Colors.white,
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>MyWishlist()));
                      },
                      child: Text(
                        "Add to WishList",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: FlatButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(40),
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CheckOutPage(),
                          ),
                        );
                      },
                      child: Text("Add to Cart",style: TextStyle(color: Colors.white),),
                    ),
                  ),
                ],
              ),
            ),

          ],
        ),
        ),

    );
  }

  void updateImageList(BuildContext context) async {
    for (int i = 1; i <= 27; i++) {
      imageList.add(AssetImage('assets/car/$i.jpeg'));
      //* To precache images so that when required they are loaded faster.
      await precacheImage(AssetImage('assets/car/$i.jpeg'), context);
    }
    setState(() {
      imagePrecached = true;
    });
  }
}