import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:journal_florist/json/recent_orders.dart';
import 'package:journal_florist/utilities/app_styles.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 15.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/header-welcome.png'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            RichText(
                              text: TextSpan(
                                  text: "Hi, ",
                                  style: Styles.paragraftStyle,
                                  children: [
                                    TextSpan(
                                      text: "AQEELA",
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: "Poppins"),
                                    ),
                                  ]),
                            ),
                            Text(
                              "Good, Morning",
                              style: Styles.subHeadingStyle,
                            ),
                            Text(
                              "21 November 2022",
                              style: Styles.paragraftStyle,
                            ),
                          ]),
                      Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: const DecorationImage(
                            // fit: BoxFit.cover,
                            image: AssetImage("assets/images/avatar.png"),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const Gap(10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    width: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.only(
                              top: 12, right: 12, left: 12),
                          child: Icon(
                            CupertinoIcons.graph_circle,
                            size: 28,
                            color: Styles.primaryAccent,
                          ),
                        ),
                        Container(
                            padding: const EdgeInsets.all(12),
                            child: Text(
                              "80",
                              style: TextStyle(
                                color: Styles.primaryAccent,
                                fontSize: 16,
                                fontFamily: "Poppins",
                                fontWeight: FontWeight.bold,
                              ),
                            )),
                        Container(
                          alignment: Alignment.center,
                          width: Get.width,
                          decoration: const BoxDecoration(
                              color: Colors.deepPurple,
                              borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(12),
                                  bottomLeft: Radius.circular(12))),
                          child: Text(
                            "Last Sale",
                            style: TextStyle(
                              color: Styles.bgColor,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 10),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.only(
                              top: 12, right: 12, left: 12),
                          child: Icon(
                            CupertinoIcons.waveform_path_ecg,
                            size: 28,
                            color: Styles.primaryAccent,
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(12),
                          child: RichText(
                            text: TextSpan(
                                text: "Rp. ",
                                style: Styles.paragraftStyle,
                                children: [
                                  TextSpan(
                                    text: "4.000.000",
                                    style: TextStyle(
                                        color: Styles.primaryAccent,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: "Poppins"),
                                  ),
                                ]),
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          width: Get.width,
                          decoration: const BoxDecoration(
                              color: Colors.deepPurple,
                              borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(12),
                                  bottomLeft: Radius.circular(12))),
                          child: Text(
                            "Total Revenue",
                            style: TextStyle(
                              color: Styles.bgColor,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 10),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const Gap(20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    width: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.only(
                              top: 12, right: 12, left: 12),
                          child: Icon(
                            CupertinoIcons.doc_chart,
                            size: 28,
                            color: Styles.primaryAccent,
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(12),
                          child: RichText(
                            text: TextSpan(
                                text: "Rp. ",
                                style: Styles.paragraftStyle,
                                children: [
                                  TextSpan(
                                    text: "3.000.000",
                                    style: TextStyle(
                                        color: Styles.primaryAccent,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: "Poppins"),
                                  ),
                                ]),
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          width: Get.width,
                          decoration: const BoxDecoration(
                              color: Colors.deepPurple,
                              borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(12),
                                  bottomLeft: Radius.circular(12))),
                          child: Text(
                            "Total Debt",
                            style: TextStyle(
                              color: Styles.bgColor,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 10),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.only(
                              top: 12, right: 12, left: 12),
                          child: Icon(
                            CupertinoIcons.person_3_fill,
                            size: 28,
                            color: Styles.primaryAccent,
                          ),
                        ),
                        Container(
                            padding: const EdgeInsets.all(12),
                            child: Text(
                              "150",
                              style: TextStyle(
                                color: Styles.primaryAccent,
                                fontSize: 16,
                                fontFamily: "Poppins",
                                fontWeight: FontWeight.bold,
                              ),
                            )),
                        Container(
                          alignment: Alignment.center,
                          width: Get.width,
                          decoration: const BoxDecoration(
                              color: Colors.deepPurple,
                              borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(12),
                                  bottomLeft: Radius.circular(12))),
                          child: Text(
                            "Customers",
                            style: TextStyle(
                              color: Styles.bgColor,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 10),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const Gap(10),
              Divider(
                color: Colors.black26,
              ),
              const Gap(10),
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Text(
                        'Recent Orders',
                        style: Styles.captionStyle,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  itemCount: recentOrders.length,
                  itemBuilder: (c, i) {
                    final trs = recentOrders[i];
                    return ListTile(
                      minLeadingWidth: 20,
                      minVerticalPadding: 20,
                      horizontalTitleGap: 10,
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 15),
                      leading: Container(
                          width: 40,
                          height: 40,
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Styles.primaryColor,
                            boxShadow: [
                              BoxShadow(
                                offset: const Offset(0, 1),
                                color: Colors.white.withOpacity(0.1),
                                blurRadius: 2,
                                spreadRadius: 1,
                              )
                            ],
                            image: i == 0
                                ? null
                                : DecorationImage(
                                    image: AssetImage(trs['avatar']),
                                    fit: BoxFit.cover,
                                  ),
                            shape: BoxShape.circle,
                          ),
                          child: i == 0
                              ? Icon(trs['icon'],
                                  color: const Color(0xFFFF736C), size: 20)
                              : const SizedBox()),
                      title: Text(trs['name'],
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500)),
                      subtitle: Text(trs['date'],
                          style: TextStyle(color: Colors.black)),
                      trailing: Text(trs['amount'],
                          style: const TextStyle(
                              fontSize: 17, color: Colors.black)),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
