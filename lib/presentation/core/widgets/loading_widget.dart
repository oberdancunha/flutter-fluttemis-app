import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Center(
        child: Shimmer.fromColors(
          baseColor: Colors.red,
          highlightColor: Colors.blue,
          period: const Duration(milliseconds: 500),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 400,
                height: 7,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 15),
              const Text(
                'Loading data....',
                style: TextStyle(fontSize: 15),
              ),
            ],
          ),
        ),
      );
}
