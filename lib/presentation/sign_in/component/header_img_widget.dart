import 'package:flutter/material.dart';
import 'package:tdc_coach_admin/app/constants/image_constants.dart';

class HeaderImageWidget extends StatelessWidget {
  const HeaderImageWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(ImageConstants.backgroundLogin),
          fit: BoxFit.fill,
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            left: 30,
            width: 80,
            height: 160,
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(ImageConstants.light1Login),
                ),
              ),
            ),
          ),
          Positioned(
            left: 140,
            width: 80,
            height: 150,
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(ImageConstants.light1Login),
                ),
              ),
            ),
          ),
          Positioned(
            right: 40,
            top: 40,
            width: 80,
            height: 150,
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(ImageConstants.clockLogin),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
