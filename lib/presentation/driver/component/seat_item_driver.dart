import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:tdc_coach_admin/app/manager/color_manager.dart';
import 'package:tdc_coach_admin/domain/model/seat.dart';

class SeatItemDriver extends StatefulWidget {
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
  State<SeatItemDriver> createState() => _SeatItemDriverState();
}

class _SeatItemDriverState extends State<SeatItemDriver> {
  String? name;
  DatabaseReference db = FirebaseDatabase.instance.ref();
  //
  Future<void> fetchName() async {
    DataSnapshot snapshotName = await db
        .child('customers')
        .child(widget.seat.userID!)
        .child('fullName')
        .get();

    if (mounted) {
      name = snapshotName.value.toString();
      setState(() {});
    }
  }

  @override
  void initState() {
    super.initState();
    fetchName();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: widget.seat.status == 0
            ? Colors.grey
            : widget.seat.status == 1
                ? AppColor.primary
                : widget.seat.status == 2
                    ? Colors.green
                    : widget.seat.status == 3
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
                'Ghế: ${widget.seat.name}',
                style: TextStyle(
                  color: AppColor.white,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                'Code: ${widget.seat.code}',
                style: TextStyle(
                  color: AppColor.white,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                name ?? '',
                style: TextStyle(
                  color: AppColor.white,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                widget.seat.userPhone!.isEmpty
                    ? 'Chưa đặt'
                    : widget.seat.userPhone.toString(),
                style: TextStyle(
                  color: AppColor.white,
                ),
              ),
            ],
          ),
          SizedBox(
            width: 10,
          ),
          Column(
            children: [
              GestureDetector(
                onTap: widget.seat.status == 0
                    ? null
                    : widget.seat.status == 1
                        ? widget.onTapConfirm
                        : widget.seat.status == 2
                            ? null
                            : widget.seat.status == 3
                                ? null
                                : null,
                child: Container(
                  width: 80,
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: widget.seat.status == 0
                        ? Colors.grey[400]
                        : widget.seat.status == 1
                            ? Colors.green
                            : widget.seat.status == 2
                                ? Colors.grey
                                : widget.seat.status == 3
                                    ? Colors.grey
                                    : Colors.grey,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Text(
                    'Xác nhận',
                    style: TextStyle(
                      color: AppColor.white,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: widget.onTapCancel,
                child: Container(
                  width: 80,
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: widget.seat.status == 0
                        ? Colors.grey[400]
                        : widget.seat.status == 1
                            ? Colors.red
                            : widget.seat.status == 2
                                ? Colors.grey
                                : widget.seat.status == 3
                                    ? Colors.grey
                                    : Colors.grey,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Text(
                    'Hủy',
                    style: TextStyle(
                      color: AppColor.white,
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
