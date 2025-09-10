part of 'package:implement_clean_code_for_store/features/views/home_nav/screens/home_page.dart';

class TopViewHomePage extends StatelessWidget {
  const TopViewHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 8,
      children: [
        Expanded(
            child: AppField(
          hintText: "Search for clothes...",
          prefixIcon: Icon(
            Icons.search,
            color: AppColors.boldGreyColor,
          ),
        )),
        Container(
          height: 52,
          width: 52,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: AppColors.primaryColor),
          child: SvgPicture.asset(
            AppAssets.settings,
            fit: BoxFit.scaleDown,
          ),
        )
      ],
    );
  }
}
