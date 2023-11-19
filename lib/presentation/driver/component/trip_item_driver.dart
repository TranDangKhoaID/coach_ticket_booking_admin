import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:tdc_coach_admin/app/manager/color_manager.dart';
import 'package:tdc_coach_admin/domain/model/trip.dart';

class TripItemDriver extends StatelessWidget {
  final Trip trip;
  const TripItemDriver({
    super.key,
    required this.trip,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Row(
        children: [
          Column(
            children: [
              Text(
                'Giờ xuất bến',
                style: TextStyle(
                  fontSize: 14,
                  color: AppColor.white,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                trip.departureTime,
                style: TextStyle(
                  fontSize: 20,
                  color: AppColor.secondary,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                trip.departureDate,
                style: TextStyle(
                  color: AppColor.white,
                ),
              )
            ],
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            alignment: Alignment.centerLeft,
            height: 90,
            child: const DottedLine(
              direction: Axis.vertical,
              dashColor: AppColor.secondary,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.location_on,
                    color: AppColor.white,
                  ),
                  SizedBox(width: 5.0),
                  Text(
                    trip.departureLocation,
                    style: TextStyle(
                      color: AppColor.white,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Icon(
                    Icons.circle_notifications,
                    color: AppColor.white,
                  ),
                  SizedBox(width: 5.0),
                  Text(
                    trip.destinationLocation,
                    style: TextStyle(
                      color: AppColor.white,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Text(
                    'Sô ghế: ',
                    style: TextStyle(
                      color: AppColor.white,
                    ),
                  ),
                  SizedBox(width: 5.0),
                  Text(
                    '10',
                    style: TextStyle(
                      color: AppColor.white,
                    ),
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
