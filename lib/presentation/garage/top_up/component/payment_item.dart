import 'package:flutter/material.dart';
import 'package:tdc_coach_admin/app/manager/color_manager.dart';

class PaymentItem extends StatelessWidget {
  const PaymentItem({
    super.key,
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
          Text(
            'Trần Đăng Khoa',
            style: TextStyle(
              color: AppColor.white,
            ),
          ),
          Text(
            '0902800234',
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
                '100.000 đ',
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
                'Nạp 1000000 vao 090234456 tdc coach',
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
