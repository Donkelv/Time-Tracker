import 'package:flutter/material.dart';


class ShimmerWidget extends StatelessWidget {
  const ShimmerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Size size = MediaQuery.of(context).size;
    return const Center(
      child: CircularProgressIndicator.adaptive(),
    );
  }
}
