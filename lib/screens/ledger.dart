import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:journal_florist/features/ledger/model/summary_ledger.dart';
import 'package:journal_florist/features/ledger/summaries_service.dart';
import 'package:journal_florist/utilities/app_styles.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'store.dart';

class LedgerPage extends StatefulWidget {
  LedgerPage({Key? key}) : super(key: key);

  @override
  _LedgerPageState createState() => _LedgerPageState();
}

class _LedgerPageState extends State<LedgerPage> {
  Future<dynamic>? _ledgerSummary;

  Future<dynamic> _getData() async {
    final data = await SummaryService().getLedger();

    return Future.delayed(Duration(milliseconds: 200)).then((value) => data);
  }

  @override
  void initState() {
    super.initState();
    _ledgerSummary = _getData();
  }

  Future<void> refreshList() async {
    setState(() {
      _ledgerSummary = _getData();
    });
  }

  String _rp = 'IDR';
  bool _isIncome = true;

  void onTap() {
    setState(() {
      _isIncome = !_isIncome;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Ledger"),
          titleTextStyle: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.amber,
            fontFamily: "Poppins",
          ),
          elevation: 0,
          actions: [
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(right: 10),
                  child: Text(
                    "${timeNow}",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                        fontFamily: "Poppins"),
                  ),
                ),
                // IconButton(
                //   onPressed: () {},
                //   icon: Icon(
                //     Icons.arrow_drop_down,
                //     semanticLabel: "Date",
                //     size: 28,
                //     color: Colors.white,
                //   ),
                // )
              ],
            ),
          ],
          backgroundColor: Styles.primaryAccent),
      body: FutureBuilder(
          future: _ledgerSummary,
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

            final ledger = snapshot.data as SummaryLedger;

            return RefreshIndicator(
              onRefresh: refreshList,
              child: Column(
                children: [
                  _appBarBottomSection(
                    netProfit: ledger.totalNetSales,
                  ),
                  const Gap(20),
                  Text(
                    "Ledger report this year",
                    style: Styles.paragraftStyle,
                  ),
                  const Gap(10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _reportCard(
                        icon: Icon(
                          MdiIcons.store,
                          size: 28,
                          color: Styles.primaryAccent,
                        ),
                        title: "Debt Store",
                        deposit: "${nominalCurrency.format(ledger.debtStore)}",
                      ),
                      _reportCard(
                        icon: Icon(
                          MdiIcons.trendingUp,
                          size: 28,
                          color: Styles.primaryAccent,
                        ),
                        title: "Revenue",
                        deposit:
                            "${nominalCurrency.format(ledger.totalRevenue)}",
                      ),
                    ],
                  ),
                  const Gap(30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _reportCard(
                        icon: Icon(
                          MdiIcons.wallet,
                          size: 28,
                          color: Styles.primaryAccent,
                        ),
                        title: "Account Receivable",
                        deposit:
                            "${nominalCurrency.format(ledger.accountReceivable)}",
                      ),
                      _reportCard(
                        icon: Icon(
                          MdiIcons.trendingDown,
                          size: 28,
                          color: Styles.primaryAccent,
                        ),
                        title: "Expense",
                        deposit:
                            "${nominalCurrency.format(ledger.totalExpense)}",
                      )
                    ],
                  ),
                  const Gap(30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _reportCard(
                        icon: Icon(
                          MdiIcons.storefront,
                          size: 28,
                          color: Styles.primaryAccent,
                        ),
                        title: "Gross Sales",
                        deposit:
                            "${nominalCurrency.format(ledger.totalGrossSales)}",
                      ),
                    ],
                  ),
                ],
              ),
            );
          }),
    );
  }

  /// App Bar bottom section
  Container _appBarBottomSection({dynamic netProfit}) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Styles.primaryAccent,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(60),
          bottomRight: Radius.circular(60),
        ),
      ),
      child: Column(
        children: [
          Container(
            child: Icon(
              CupertinoIcons.waveform_path_ecg,
              size: 28,
              color: Colors.white,
            ),
          ),
          const Gap(10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                _rp,
                style: TextStyle(
                  color: Colors.white.withOpacity(0.5),
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  height: 1,
                ),
              ),
              Text(
                '${nominalCurrency.format(netProfit)}',
                style: TextStyle(
                  color: Colors.amber,
                  fontSize: 40,
                  fontWeight: FontWeight.w600,
                  fontFamily: "Poppins",
                  height: 1,
                ),
              ),
            ],
          ),
          Text(
            "Net Profit",
            style: TextStyle(
              color: Colors.white.withOpacity(0.8),
              fontSize: 20,
              fontWeight: FontWeight.w400,
              fontFamily: "Poppins",
            ),
          ),
          SizedBox(
            height: 32,
          ),
          // Padding(
          //   padding: const EdgeInsets.all(8.0),
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceAround,
          //     children: [
          //       GestureDetector(
          //         onTap: onTap,
          //         child: Text(
          //           "Income",
          //           style: _isIncome
          //               ? TextStyle(
          //                   color: Colors.amber,
          //                   fontSize: 20,
          //                   fontWeight: FontWeight.bold,
          //                   height: 1,
          //                 )
          //               : TextStyle(
          //                   color: Colors.white.withOpacity(0.8),
          //                   fontSize: 20,
          //                   fontWeight: FontWeight.w400,
          //                   height: 1,
          //                 ),
          //         ),
          //       ),
          //       GestureDetector(
          //         onTap: onTap,
          //         child: Text(
          //           "Outcome",
          //           style: _isIncome
          //               ? TextStyle(
          //                   color: Colors.white.withOpacity(0.8),
          //                   fontSize: 20,
          //                   fontWeight: FontWeight.w400,
          //                   height: 1,
          //                 )
          //               : TextStyle(
          //                   color: Colors.amber,
          //                   fontSize: 20,
          //                   fontWeight: FontWeight.bold,
          //                   height: 1,
          //                 ),
          //         ),
          //       ),
          //     ],
          //   ),
          // )
        ],
      ),
    );
  }

  Container _reportCard({
    required Widget icon,
    required String title,
    required String deposit,
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
              child: icon),
          Container(
            padding: const EdgeInsets.all(12),
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                text: '${_rp}\n',
                style: Styles.paragraftStyle,
                children: [
                  TextSpan(
                    text: deposit,
                    style: TextStyle(
                        color: Styles.primaryAccent,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Poppins"),
                  ),
                ],
              ),
            ),
          ),
          Container(
            alignment: Alignment.center,
            width: Get.width,
            decoration: const BoxDecoration(
              color: Colors.deepPurple,
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(12),
                bottomLeft: Radius.circular(12),
              ),
            ),
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
}
