import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:journal_florist/features/ledger/summaries_service.dart';
import 'package:journal_florist/utilities/app_styles.dart';

class LedgerPage extends StatefulWidget {
  LedgerPage({Key? key}) : super(key: key);

  @override
  _LedgerPageState createState() => _LedgerPageState();
}

class _LedgerPageState extends State<LedgerPage> {
  late final SummaryService summary = SummaryService();

  String _rp = 'Rp.';
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
                Text(
                  "21 December 2022",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                      fontFamily: "Poppins"),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.arrow_drop_down,
                    semanticLabel: "Date",
                    size: 28,
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ],
          backgroundColor: Styles.primaryAccent),
      body: Column(
        children: [
          _appBarBottomSection(),
          const Gap(20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _reportCard(
                icon: Icon(
                  CupertinoIcons.alarm,
                  size: 28,
                  color: Styles.primaryAccent,
                ),
                title: "Debt Store",
                deposit: "5.000.0000",
              ),
              _reportCard(
                icon: Icon(
                  CupertinoIcons.alarm,
                  size: 28,
                  color: Styles.primaryAccent,
                ),
                title: "Debt Store",
                deposit: "5.000.0000",
              ),
            ],
          ),
          const Gap(20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _reportCard(
                icon: Icon(
                  CupertinoIcons.alarm,
                  size: 28,
                  color: Styles.primaryAccent,
                ),
                title: "Debt Store",
                deposit: "5.000.0000",
              ),
              _reportCard(
                icon: Icon(
                  CupertinoIcons.smiley,
                  size: 28,
                  color: Styles.primaryAccent,
                ),
                title: "Expense",
                deposit: "2.450.000",
              )
            ],
          ),
          const Gap(20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _reportCard(
                icon: Icon(
                  CupertinoIcons.alarm,
                  size: 28,
                  color: Styles.primaryAccent,
                ),
                title: "Debt Store",
                deposit: "5.000.0000",
              ),
              _reportCard(
                icon: Icon(
                  CupertinoIcons.smiley,
                  size: 28,
                  color: Styles.primaryAccent,
                ),
                title: "Expense",
                deposit: "2.450.000",
              )
            ],
          ),
        ],
      ),
    );
  }

  /// App Bar bottom section
  Container _appBarBottomSection() {
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
                '5.000.000',
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
              padding: const EdgeInsets.only(top: 12, right: 12, left: 12),
              child: icon),
          Container(
            padding: const EdgeInsets.all(12),
            child: RichText(
              text: TextSpan(
                text: "Rp. ",
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
