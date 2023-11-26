import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tdc_coach_admin/app/helpers/dialog_helper.dart';
import 'package:tdc_coach_admin/app/manager/color_manager.dart';
import 'package:tdc_coach_admin/domain/model/top_up.dart';
import 'package:tdc_coach_admin/presentation/garage/top_up/component/payment_item.dart';
import 'package:tdc_coach_admin/presentation/garage/top_up/controller/top_up_controller.dart';

class TopUpScreen extends StatelessWidget {
  TopUpScreen({super.key});
  final DatabaseReference db = FirebaseDatabase.instance.ref().child('top_ups');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primary,
      appBar: AppBar(
        title: const Text('Danh sách nạp tiền'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        margin: const EdgeInsets.all(5),
        child: FirebaseAnimatedList(
          query: db,
          itemBuilder: (context, snapshot, animation, index) {
            String id = snapshot.child('id').value.toString();
            String idUser = snapshot.child('idUser').value.toString();
            String phoneUser = snapshot.child('phoneUser').value.toString();
            String paymentMethod =
                snapshot.child('paymentMethod').value.toString();
            String accountNumber =
                snapshot.child('accountNumber').value.toString();
            String accountOwner =
                snapshot.child('accountOwner').value.toString();
            String payContent = snapshot.child('payContent').value.toString();
            String creatAt = snapshot.child('creatAt').value.toString();
            String money = snapshot.child('money').value.toString();
            int status = snapshot.child('status').value as int;
            final topUp = TopUp(
              id: id,
              idUser: idUser,
              phoneUser: phoneUser,
              money: int.parse(money),
              paymentMethod: paymentMethod,
              accountNumber: accountNumber,
              accountOwner: accountOwner,
              payContent: payContent,
              creatAt: creatAt,
              status: status,
            );
            if (topUp.status == 0) {
              return PaymentItem(
                topUp: topUp,
                onTapSucces: () {
                  final String fmoney = formatCurrency(topUp.money.toString());
                  DialogHelper.showConfirmDialog(
                    context: context,
                    onPressConfirm: () {
                      TopUpController.instance.addMoneyInWallerUser(
                        userID: topUp.idUser,
                        topUpID: topUp.id,
                        money: int.parse(money),
                      );
                    },
                    message: 'Xác nhận nạp cho tài khoản này $fmoney đ ?',
                  );
                },
                onTapCancel: () {
                  DialogHelper.showConfirmDialog(
                    context: context,
                    onPressConfirm: () {
                      TopUpController.instance.cancelTopUP(
                        topUpID: topUp.id,
                      );
                    },
                    message: 'Xác nhận hủy nạp?',
                  );
                },
              );
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }

  String formatCurrency(String value) {
    final formatter = NumberFormat("#,###", "vi_VN");
    try {
      int parsedValue = int.parse(value.replaceAll('.', ''));
      return formatter.format(parsedValue);
    } catch (e) {
      return value;
    }
  }
}
