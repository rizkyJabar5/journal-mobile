import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:journal_florist/features/ledger/model/summary_store.dart';
import 'package:journal_florist/features/ledger/summaries_service.dart';

import 'package:journal_florist/utilities/app_styles.dart';
import 'dart:math' as math;

final nominalCurrency = NumberFormat("#,##0.00", "id_ID");
final _rp = "IDR ";

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<dynamic>? _storeSummary;
  Future<dynamic>? _userLoggedIn;

  final timeNow = DateFormat("E, dd MMMM yyyy").format(DateTime.now());

  String _greeting() {
    String morning = 'Morning ☀️';
    String afternoon = 'Afternoon 🌤️';
    String evening = 'Evening 🌙';
    var hour = DateTime.now().hour;
    
    if (hour < 12) {
      return morning;
    }
    if (hour < 17) {
      return afternoon;
    }
    return evening;
  }


  Future<dynamic> _getData() async {
    final data = await SummaryService().getStore();

    return Future.delayed(Duration(milliseconds: 200)).then((value) => data);
  }

  @override
  void initState() {
    initializeDateFormatting();

    super.initState();
    _storeSummary = _getData();
  }

  Future<void> refreshList() async {
    setState(() {
      _storeSummary = _getData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: ScrollPhysics(),
        child: Column(
          // mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SafeArea(
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/header-welcome.png'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: FutureBuilder(
                    future: _userLoggedIn,
                    builder: (context, snapshot) => Row(
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
                              RichText(
                                text: TextSpan(
                                    text: "Good, ",
                                    style: TextStyle(
                                        color: Colors.black54,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: "Poppins"),
                                    children: [
                                      TextSpan(
                                        text: _greeting(),
                                        style: TextStyle(
                                            color: Colors.amber,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: "Poppins",),
                                      ),
                                    ]),
                              ),
                              Text(
                                "${timeNow}",
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
              ),
            ),
            const Gap(10),
            FutureBuilder(
                future: _storeSummary,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CircularProgressIndicator(),
                          Padding(
                            padding: EdgeInsets.only(top: 16),
                            child: Text('Loading...'),
                          ),
                        ],
                      ),
                    );
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  }

                  final store = snapshot.data as SummaryStore;
                  return RefreshIndicator(
                    onRefresh: refreshList,
                    child: Column(
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
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 15),
                                child: Text(
                                  'Recent Orders',
                                  style: Styles.captionStyle,
                                ),
                              ),
                            ],
                          ),
                        ),
                        store.recentOrders!.isEmpty
                            ? Padding(
                                padding: const EdgeInsets.only(top: 100),
                                child: Center(
                                  child: Text(
                                    'Sorry, no order for today 😢.',
                                    style: TextStyle(
                                      color: Colors.black87,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: "Poppins",
                                    ),
                                  ),
                                ),
                              )
                            : _recentOrders(recentOrder: store.recentOrders)
                      ],
                    ),
                  );
                }),
          ],
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

Widget _recentOrders({List<RecentOrder>? recentOrder = const <RecentOrder>[]}) {
  return ListView.builder(
    shrinkWrap: true,
    physics: const BouncingScrollPhysics(),
    itemCount: recentOrder?.length,
    itemBuilder: (c, i) {
      final order = recentOrder?[i];
      return ListTile(
        // minLeadingWidth: 20,
        minVerticalPadding: 5,
        horizontalTitleGap: 10,
        contentPadding: const EdgeInsets.symmetric(horizontal: 15),
        leading: CircleAvatar(
          backgroundColor:
              Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
                  .withOpacity(1.0),
          child: Text(
            '${order?.customerName![0]}',
          ),
        ),
        title: Text(
          '${order?.customerName}',
          style: TextStyle(
              color: Styles.primaryAccent,
              fontSize: 16,
              fontWeight: FontWeight.bold,
              fontFamily: "Poppins"),
        ),
        subtitle: RichText(
          text: TextSpan(
            text: '${order?.detailOfOrderProducts?.first.productName}\n',
            style: TextStyle(
                color: Styles.textColor,
                fontSize: 14,
                fontWeight: FontWeight.w400,
                fontFamily: "Poppins"),
            children: [
              TextSpan(
                  text: '${order?.createdAt}', style: Styles.paragraftStyle),
            ],
          ),
        ),
        trailing: RichText(
          text: TextSpan(text: _rp, style: Styles.paragraftStyle, children: [
            TextSpan(
              text: "${nominalCurrency.format(order?.paymentAmount)}",
              style: TextStyle(
                  color: Styles.primaryAccent,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Poppins"),
            ),
          ]),
        ),
      );
    },
  );
}
