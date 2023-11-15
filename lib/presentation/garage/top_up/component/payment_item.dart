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
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Text(
                'Số tiền nạp: ',
                style: TextStyle(
                  fontSize: 16,
                  color: AppColor.white,
                ),
              ),
              Text(
                topUp.money.toString(),
                style: const TextStyle(
                  color: AppColor.white,
                ),
              ),
            ],
          ),
          Row(
            children: [
              const Text(
                'Phương thức: ',
                style: TextStyle(
                  fontSize: 16,
                  color: AppColor.white,
                ),
              ),
              Text(
                topUp.paymentMethod,
                style: const TextStyle(
                  color: AppColor.white,
                ),
              ),
            ],
          ),
          Wrap(
            children: [
              const Text(
                'Lời nhắn: ',
                style: TextStyle(
                  fontSize: 16,
                  color: AppColor.white,
                ),
              ),
              Text(
                topUp.payContent,
                style: const TextStyle(
                  color: AppColor.white,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: onTapSucces,
                child: Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Text(
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
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Text(
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
