import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:journal_florist/features/ledger/model/summary_store.dart';
import 'package:journal_florist/features/ledger/summaries_service.dart';
import 'package:journal_florist/json/recent_orders.dart';
import 'package:journal_florist/utilities/app_styles.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<dynamic> _getData() async {
    final data = await SummaryService().getStore();

    return data;
  }

  final nominalCurrency = NumberFormat("#,##0.00", "id_ID");

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
              FutureBuilder(
                  future: _getData(),
                  builder: (context, snapshot) {
                    Widget children;

                    switch (snapshot.connectionState) {
                      case ConnectionState.waiting:
                        children = Center(
                          child: Column(
                            children: [
                              SizedBox(
                                width: 60,
                                height: 60,
                                child: CircularProgressIndicator(),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 16),
                                child: Text('Loading...'),
                              ),
                            ],
                          ),
                        );
                        break;
                      case ConnectionState.done:
                        final store = snapshot.data as SummaryStore;

                        children = Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                _cardStore(
                                  title: 'Gross Sales Today',
                                  data:
                                      '${nominalCurrency.format(store.grossSalesToday)}',
                                  isCurrency: true,
                                  icon: Icon(
                                    CupertinoIcons.doc_chart,
                                    size: 28,
                                    color: Styles.primaryAccent,
                                  ),
                                ),
                              ],
                            ),
                            const Gap(20),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                _cardStore(
                                  title: 'Total Products',
                                  data: '${store.totalProducts}',
                                  isCurrency: false,
                                  icon: Icon(
                                    Icons.production_quantity_limits,
                                    size: 28,
                                    color: Styles.primaryAccent,
                                  ),
                                ),
                                _cardStore(
                                  title: 'Profit Today',
                                  data:
                                      '${nominalCurrency.format(store.netProfitSalesToday)}',
                                  isCurrency: true,
                                  icon: Icon(
                                    CupertinoIcons.arrow_up_right_circle_fill,
                                    size: 28,
                                    color: Styles.primaryAccent,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        );
                        break;
                      default:
                        if (snapshot.hasError)
                          return Text('Error: ${snapshot.error}');
                        else
                          return Text('Result: ${snapshot.data}');
                    }
                    return children;
                  }),
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

Widget _cardStore({
  Icon? icon,
  required String title,
  required dynamic data,
  required bool isCurrency,
}) {
  String _rp = "IDR ";

  return Container(
    width: 180,
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
          padding: const EdgeInsets.only(top: 12, right: 12, left: 12),
          child: icon,
        ),
        Container(
          padding: const EdgeInsets.all(12),
          child: RichText(
            text: TextSpan(
                text: isCurrency ? _rp : "",
                style: Styles.paragraftStyle,
                children: [
                  TextSpan(
                    text: "${data}",
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
            title,
            style: TextStyle(
              color: Styles.bgColor,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        ),
      ],
    ),
  );
}
