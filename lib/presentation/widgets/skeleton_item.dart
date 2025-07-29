import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class SkeletonItem extends StatelessWidget {
  const SkeletonItem({super.key});

  Widget shimmerBox({
    double height = 16,
    double width = double.infinity,
    BorderRadius? borderRadius,
  }) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: borderRadius ?? BorderRadius.circular(4),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            shimmerBox(height: 24, width: 140),
            Padding(
              padding: const EdgeInsets.only(top: 24, bottom: 24),
              child: shimmerBox(height: 30, width: 200),
            ),
            shimmerBox(height: 20, width: 80),

            Padding(
              padding: const EdgeInsets.only(top: 24, bottom: 20),
              child: shimmerBox(height: 20, width: 100),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: shimmerBox(height: 20, width: 200),
            ),
            const Padding(padding: EdgeInsets.only(top: 24), child: Divider()),

            ...List.generate(
              3,
              (index) => Padding(
                padding: const EdgeInsets.only(bottom: 13),
                child: Row(
                  children: [
                    Container(
                      width: 24,
                      height: 24,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(left: 13),
                      child: shimmerBox(height: 16, width: 180),
                    ),
                  ],
                ),
              ),
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.only(top: 12, bottom: 12),
              child: shimmerBox(height: 20, width: 100),
            ),
            shimmerBox(
              height: 170,
              width: double.infinity,
              borderRadius: BorderRadius.circular(8),
            ),
          ],
        ),
      ),
    );
  }
}
