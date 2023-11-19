import 'package:flutter/material.dart';
import 'package:tdc_coach_admin/app/manager/color_manager.dart';
import 'package:tdc_coach_admin/domain/model/seat.dart';

class SeatItemDriver extends StatelessWidget {
  final Seat seat;
  final void Function()? onTapConfirm;
  final void Function()? onTapCancel;
  const SeatItemDriver({
    super.key,
    required this.onTapConfirm,
    required this.onTapCancel,
    required this.seat,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: seat.status == 0
            ? Colors.grey
            : seat.status == 1
                ? AppColor.primary
                : seat.status == 2
                    ? Colors.green
                    : seat.status == 3
                        ? Colors.redAccent
                        : Colors.grey,
        borderRadius: BorderRadius.circular(5),
      ),
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.only(bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Ghế: ${seat.name}',
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                'Code: ${seat.code}',
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                seat.userID ?? 'Chưa đặt',
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                seat.userPhone ?? 'Chưa đặt',
              ),
            ],
          ),
          SizedBox(
            width: 10,
          ),
          Column(
            children: [
              GestureDetector(
                onTap: seat.status == 0
                    ? null
                    : seat.status == 1
                        ? onTapConfirm
                        : seat.status == 2
                            ? null
                            : seat.status == 3
                                ? null
                                : null,
                child: Container(
                  width: 80,
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: seat.status == 0
                        ? Colors.grey[400]
                        : seat.status == 1
                            ? Colors.green
                            : seat.status == 2
                                ? Colors.grey
                                : seat.status == 3
                                    ? Colors.grey
                                    : Colors.grey,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Text('Xác nhận'),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: onTapCancel,
                child: Container(
                  width: 80,
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: seat.status == 0
                        ? Colors.grey[400]
                        : seat.status == 1
                            ? Colors.red
                            : seat.status == 2
                                ? Colors.grey
                                : seat.status == 3
                                    ? Colors.grey
                                    : Colors.grey,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Text('Hủy'),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
