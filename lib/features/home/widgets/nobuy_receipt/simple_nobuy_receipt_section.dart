import 'package:flutter/material.dart';
import 'package:ttobaba/core/theme/app_colors.dart';
import 'package:ttobaba/core/theme/app_text_styles.dart';
import 'package:ttobaba/features/home/widgets/nobuy_receipt/simple_nobuy_receipt.dart';
import 'package:ttobaba/features/home/widgets/nobuy_receipt/detail_nobuy_receipt_screen.dart';

class SimpleNobuyReceiptSection extends StatelessWidget {
  const SimpleNobuyReceiptSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: AppColors.black,
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 32),
        child: Column(
          children: [
            _buildHeader(),
            const SizedBox(height: 12),
            _buildOverlappingList(context),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "전체 리스트",
            style: AppTextStyles.ptdBold(24).copyWith(color: AppColors.white),
          ),
          const Icon(Icons.tune, color: AppColors.white),
        ],
      ),
    );
  }

  Widget _buildOverlappingList(BuildContext context) {
    // 2. 테스트 데이터 무결성 확보 (줄임표 제거) [cite: 2026-02-13]
    final List<Map<String, dynamic>> items = [
      {'color': AppColors.secondaryMain, 'title': '여성 아이스제로 레이디 미들 다운자켓#2_LE'},
      {'color': AppColors.primaryMain, 'title': '여성 아이스제로 레이디 미들 다운자켓#2_LE'},
      {'color': AppColors.white, 'title': '여성 아이스제로 레이디 미들 다운자켓#2_LE'},
      {'color': AppColors.secondaryMain, 'title': '여성 아이스제로 레이디 미들 다운자켓#2_LE'},
    ];

    return Column(
      children: List.generate(items.length, (index) {
        final isLeft = index % 2 == 0;
        
        return Transform.translate(
          offset: Offset(0, index == 0 ? 0 : -140.0 * index),
          child: Align(
            alignment: isLeft ? Alignment.centerLeft : Alignment.centerRight,
            child: Padding(
              padding: EdgeInsets.only(
                left: isLeft ? 32 : 0,
                right: isLeft ? 0 : 32,
              ),
              // 3. SimpleNoBuyReceipt 클래스 사용 및 onTap 콜백 구현 [cite: 2026-02-13]
              child: SimpleNoBuyReceipt(
                backgroundColor: items[index]['color'],
                shadowColor: items[index]['color'],
                title: items[index]['title'],
                onTap: () {
                  // 👈 4. 클릭 시 상세 화면으로 이동하는 로직 주입 [cite: 2026-02-13]
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const DetailNoBuyReceiptScreen(),
                    ),
                  );
                },
              ),
            ),
          ),
        );
      }),
    );
  }
}