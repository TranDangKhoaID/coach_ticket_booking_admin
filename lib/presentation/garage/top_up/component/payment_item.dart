import 'package:flutter/material.dart';
import 'package:tdc_coach_admin/app/manager/color_manager.dart';
import 'package:tdc_coach_admin/domain/model/top_up.dart';

class PaymentItem extends StatelessWidget {
  final TopUp topUp;
  final void Function()? onTapSucces;
  final void Function()? onTapCancel;
  const PaymentItem({
    super.key,
    required this.topUp,
    required this.onTapSucces,
    required this.onTapCancel,
  });

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
                topUp.money.toString(),
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
                topUp.paymentMethod,
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
                topUp.payContent,
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
              GestureDetector(
                onTap: onTapSucces,
                child: Container(
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
              ),
              GestureDetector(
                onTap: onTapCancel,
                child: Container(
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
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
