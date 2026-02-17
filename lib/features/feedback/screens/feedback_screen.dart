import 'package:flutter/material.dart';
import 'package:ttobaba/core/theme/app_colors.dart';
import 'package:ttobaba/core/theme/app_text_styles.dart';
import 'package:ttobaba/core/widgets/app_back_bar.dart';
import 'package:ttobaba/core/widgets/app_indicator.dart';
import 'package:ttobaba/core/widgets/two_buttons.dart';
import 'package:ttobaba/core/widgets/app_longtext_field.dart';
import 'package:ttobaba/features/feedback/widgets/vertical_button_list.dart';

class FeedbackScreen extends StatefulWidget {
  const FeedbackScreen({super.key});

  @override
  State<FeedbackScreen> createState() => _FeedbackScreenState();
}

class _FeedbackScreenState extends State<FeedbackScreen> {
  int _currentIndex = 0; // 현재 질문 인덱스
  bool _isReturned = false; // 반품 여부 (분기 결정)

  // 뒤로가기 로직 처리
  void _handleBack() {
    if (_currentIndex > 0) {
      setState(() => _currentIndex--);
    } else {
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    // 반품 여부에 따른 전체 페이지 수 결정
    int totalPages = _isReturned ? 2 : 3;

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBackBar(
        title: "내가 산 옷 평가하기",
        currentPage: _currentIndex + 1,
        onBackPressed: _handleBack,
      ),
      body: SafeArea(
        child: Column(
          children: [
            const Divider(height: 0.5, thickness: 0.5, color: AppColors.lightGrey),
            _buildProductSummary(),
            const Divider(height: 0.5, thickness: 0.5, color: AppColors.lightGrey),

            Expanded(
              child: _buildMainQuestionArea(),
            ),

            AppIndicator(
              currentPage: _currentIndex,
              totalPage: totalPages,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProductSummary() {
    return Container(
      color: AppColors.white,
      padding: const EdgeInsets.fromLTRB(32, 32, 32, 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset('assets/images/product_sample.png', width: 100, height: 100, fit: BoxFit.cover),
          ),
          const SizedBox(width: 24),
          Expanded(
            child: SizedBox(
              height: 100,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text("에이블리", style: AppTextStyles.ptdBold(12).copyWith(color: AppColors.black)),
                      Text("❤️기모선택❤️찰랑 하이웨스트 와이드 롱팬츠", 
                        style: AppTextStyles.ptdRegular(12).copyWith(color: AppColors.black), 
                        textAlign: TextAlign.right, maxLines: 2, overflow: TextOverflow.ellipsis),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text("구매한 지 18일 지남", style: AppTextStyles.ptdRegular(10).copyWith(color: AppColors.grey)),
                      // const SizedBox(height: 4),
                      Text("22,200원", style: AppTextStyles.ptdBold(24).copyWith(color: AppColors.black)),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMainQuestionArea() {
    // 👈 핑거 이모지: 현재 단계가 이유 입력 단계인지 확인합니다. [cite: 2026-02-17]
    bool isReasonStep = (_isReturned && _currentIndex == 1) || (!_isReturned && _currentIndex == 2);

    return Padding(
      padding: const EdgeInsets.fromLTRB(32, 60, 32, 16),
      child: Column(
        children: [
          _buildQuestionText(),
          
          // 👈 핑거 이모지: 입력 단계와 버튼 단계의 레이아웃을 분리합니다. [cite: 2026-02-17]
          if (isReasonStep) 
            // [입력 단계] 입력창이 Expanded 역할을 수행하여 공간을 채웁니다.
            Expanded(child: _buildStepContent())
          else ...[
            // [버튼 단계] Spacer가 질문과 버튼 사이를 벌려 버튼을 바닥으로 밉니다.
            const Spacer(),
            _buildStepContent(),
          ],
        ],
      ),
    );
  }

  Widget _buildQuestionText() {
    String qNum = "Q${_currentIndex + 1}.";
    String title = "";

    // 2. 분기 로직에 따른 타이틀 결정
    if (_currentIndex == 0) {
      title = "혹시 반품했나요?";
    } else if (_isReturned) {
      title = "반품 이유를 알려 주세요!";
    } else {
      if (_currentIndex == 1) {
        title = "만족하시나요?";
      } else {
        title = "이유를 알려 주세요!";
      }
    }

    return Column(
      children: [
        Text(
          qNum,
          style: AppTextStyles.ptdBold(24).copyWith(color: AppColors.black),
        ),
        const SizedBox(height: 4),
        Text(
          title,
          style: AppTextStyles.ptdBold(24).copyWith(color: AppColors.black),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildStepContent() {
    if (_currentIndex == 0) {
      return _buildQ1Buttons();
    }

    // 반품한 경우 (isReturned = true)
    if (_isReturned) {
      // 2단계: 바로 이유 입력창 노출
      return _buildReasonArea();
    } 
    
    // 반품 안 한 경우 (isReturned = false)
    else {
      // 2단계: 만족도 선택 버튼 리스트
      if (_currentIndex == 1) {
        return _buildSatisfactionArea();
      } 
      // 3단계: 이유 입력창 노출
      else {
        return _buildReasonArea();
      }
    }
  }

  Widget _buildQ1Buttons() {
    return TwoButtons(
      leftText: "아뇨",
      rightText: "네",
      onLeftPressed: () {
        setState(() {
          _isReturned = false;
          _currentIndex = 1;
        });
      },
      onRightPressed: () {
        setState(() {
          _isReturned = true;
          _currentIndex = 1;
        });
      },
    );
  }

  Widget _buildReasonArea() {
    return Column(
      children: [
        // 👈 핑거 이모지: 입력 단계는 가이드에 따라 질문 아래 32px 여백을 둡니다.
        const SizedBox(height: 32),
        const Expanded(
          child: AppLongtextField(hintText: "이유를 입력해 주세요"),
        ),
        const SizedBox(height: 32),
        TwoButtons(
          leftText: "스킵할래요",
          rightText: "제출할래요",
          leftBackgroundColor: AppColors.lightGrey,
          onLeftPressed: () => Navigator.pop(context),
          onRightPressed: () => Navigator.pop(context),
        ),
      ],
    );
  }
  
  Widget _buildSatisfactionArea() {
    final List<FeedbackButtonData> satisfactionItems = [
      FeedbackButtonData(text: "너무너무 별로예요..", color: const Color(0xFFA1C1FF), onTap: () => setState(() => _currentIndex = 2)),
      FeedbackButtonData(text: "조금 별로예요", color: const Color(0xFFC6D9FF), onTap: () => setState(() => _currentIndex = 2)),
      FeedbackButtonData(text: "이 정도면 괜찮죠", color: const Color(0xFFFEE7A1), onTap: () => setState(() => _currentIndex = 2)),
      FeedbackButtonData(text: "최고예요!", color: AppColors.primaryMain, onTap: () => setState(() => _currentIndex = 2)),
    ];

    // Spacer가 위에서 밀어주므로 여기서는 버튼 리스트만 리턴합니다. [cite: 2026-02-17]
    return VerticalButtonList(
      items: satisfactionItems,
      borderRadius: 12,
      spacing: 20,
    );
  }
}



  