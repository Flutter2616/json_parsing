import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:json_parsing/model/cart_model.dart';
import 'package:json_parsing/model/product_model.dart';
import 'package:json_parsing/utils/product_api.dart';
import 'package:json_parsing/provider/Product_provider.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class Productscreen extends StatefulWidget {
  const Productscreen({Key? key}) : super(key: key);

  @override
  State<Productscreen> createState() => _ProductscreenState();
}

class _ProductscreenState extends State<Productscreen> {
  Productprovider? pf;
  Productprovider? pt;

  @override
  void initState() {
    super.initState();
    Provider.of<Productprovider>(context, listen: false).productjson();
  }

  @override
  Widget build(BuildContext context) {
    pf = Provider.of<Productprovider>(context, listen: false);
    pt = Provider.of<Productprovider>(context, listen: true);
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
        leading: Icon(Icons.menu, color: Colors.black, size: 18.sp),
        actions: [
          Icon(Icons.search, size: 18.sp, color: Colors.black),
          SizedBox(width: 10),
          Icon(Icons.notifications_none_sharp,
              size: 18.sp, color: Colors.black),
          SizedBox(width: 10),
          Icon(Icons.shopping_bag_outlined, size: 18.sp, color: Colors.black),
          SizedBox(width: 10),
        ],
        title: Text("Season",
            style: GoogleFonts.ibmPlexSansArabic(
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontSize: 20.sp)),
      ),
      body: FutureBuilder(
        future: pt!.productjson(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Productmodel> product = [];
            product = snapshot.data!;
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Column(
                children: [
                  SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 6.h,
                        width: 78.w,
                        alignment: Alignment.center,
                        padding: EdgeInsets.only(left: 8),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                        ),
                        child: TextFormField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            suffixIcon: Icon(Icons.keyboard_arrow_down_rounded,
                                color: Colors.black, size: 22.sp),
                            hintText: "Casual Dress",
                            hintStyle: TextStyle(
                                color: Colors.black,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                      Container(
                        height: 6.h,
                        width: 6.h,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(5.sp)),
                        ),
                        child: Icon(Icons.tune_outlined,
                            size: 20.sp, color: Colors.black),
                      ),
                    ],
                  ),
                  SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        child: Text("All",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 11.sp,
                                fontWeight: FontWeight.w300)),
                        height: 4.h,
                        width: 20.w,
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(3.sp)),
                      ),
                      Container(
                        alignment: Alignment.center,
                        child: Text("Pants",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 11.sp,
                                fontWeight: FontWeight.w500)),
                        height: 4.h,
                        width: 20.w,
                        decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(3.sp)),
                      ),
                      Container(
                        alignment: Alignment.center,
                        child: Text("Blazer",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 11.sp,
                                fontWeight: FontWeight.w500)),
                        height: 4.h,
                        width: 20.w,
                        decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(3.sp)),
                      ),
                      Container(
                        alignment: Alignment.center,
                        child: Text("Jackets",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 11.sp,
                                fontWeight: FontWeight.w500)),
                        height: 4.h,
                        width: 20.w,
                        decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(3.sp)),
                      ),
                    ],
                  ),
                  SizedBox(height: 15),
                  Expanded(
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10,
                          mainAxisExtent: 40.h),
                      itemBuilder: (context, index) {
                        return Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5.sp)),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            // crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                alignment: Alignment.center,
                                width: 20.h,
                                height: 25.h,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    image: DecorationImage(
                                        image: NetworkImage(
                                            "${product[index].image}"),
                                        fit: BoxFit.fill)),
                              ),
                              SizedBox(height: 5),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "\$${product[index].price}",
                                    style: GoogleFonts.poppins(
                                        color: Colors.black, fontSize: 15.sp),
                                  ),
                                  Icon(Icons.favorite_border,
                                      color: Colors.black, size: 20.sp),
                                ],
                              ),
                              SizedBox(height: 5),
                              Row(
                                children: [
                                  Text("Rating"),
                                  SizedBox(width: 10),
                                  Text("${product[index].ratingmodel!.rate}"),
                                ],
                              )
                            ],
                          ),
                        );
                      },
                      itemCount: product.length,
                    ),
                  )
                ],
              ),
            );
          }

          return Center(child: CircularProgressIndicator(color: Colors.black));
        },
      ),
    );
  }
}
