import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:tdc_coach_admin/app/manager/color_manager.dart';
import 'package:tdc_coach_admin/domain/model/top_up.dart';

class PaymentItem extends StatefulWidget {
  final TopUp topUp;
  const PaymentItem({
    super.key,
    required this.topUp,
  });

  @override
  State<PaymentItem> createState() => _PaymentItemState();
}

class _PaymentItemState extends State<PaymentItem> {
  DatabaseReference db = FirebaseDatabase.instance.ref();
  String userName = 'Loading...';
  String userPhone = 'Loading...';

  Future<void> fectUser() async {
    try {
      DataSnapshot snapshotName = await db
          .child('customers')
          .child(widget.topUp.idUser)
          .child('fullName')
          .get();
      DataSnapshot snapshotPhone = await db
          .child('customers')
          .child(widget.topUp.idUser)
          .child('fullName')
          .get();
      userName = snapshotName.value.toString();
      userPhone = snapshotPhone.value.toString();
      setState(() {});
    } catch (e) {
      EasyLoading.showError(e.toString());
    }
  }

  @override
  void initState() {
    super.initState();
    fectUser();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColor.primary[400],
        borderRadius: BorderRadius.circular(10),
      ),
      padding: EdgeInsets.all(16),
      margin: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            userName,
            style: TextStyle(
              color: AppColor.white,
            ),
          ),
          Text(
            userPhone,
            style: TextStyle(
              color: AppColor.white,
            ),
          ),
          Row(
            children: [
              Text(
                'Số tiền nạp: ',
                style: TextStyle(
                  fontSize: 16,
                  color: AppColor.white,
                ),
              ),
              Text(
                widget.topUp.money.toString(),
                style: TextStyle(
                  color: AppColor.white,
                ),
              ),
            ],
          ),
          Row(
            children: [
              Text(
                'Phương thức: ',
                style: TextStyle(
                  fontSize: 16,
                  color: AppColor.white,
                ),
              ),
              Text(
                widget.topUp.paymentMethod,
                style: TextStyle(
                  color: AppColor.white,
                ),
              ),
            ],
          ),
          Wrap(
            children: [
              Text(
                'Lời nhắn: ',
                style: TextStyle(
                  fontSize: 16,
                  color: AppColor.white,
                ),
              ),
              Text(
                widget.topUp.payContent,
                style: TextStyle(
                  color: AppColor.white,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  'Xác nhận',
                  style: TextStyle(
                    color: AppColor.white,
                  ),
                ),
              ),
              Container(
                width: 90,
                alignment: Alignment.center,
                padding: EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  'Huỷ',
                  style: TextStyle(
                    color: AppColor.white,
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
