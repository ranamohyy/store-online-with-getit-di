part of 'package:implement_clean_code_for_store/features/views/home_nav/screens/cart.dart';
class CartItem extends StatelessWidget {
  const CartItem({
    super.key,
    required this.title,
    required this.v,
  });
  final String title;
  final String v;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: AppColors.greyColor)),
      child: Row(
        spacing: 20,
        children: [
          Expanded(
            child: Image.asset(
              AppAssets.shoes,
              width: 80,
              height: 80,
              fit: BoxFit.fill,
            ),
          ),
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  // spacing: 70,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "shoes",
                      style: AppStyles.textStyle16Black,
                    ),
                    Icon(
                      Icons.delete,
                      color: Colors.red,
                    ),
                  ],
                ),
                Text("size L", style: AppStyles.textStyle16Grey),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(r"$1190", style: AppStyles.textStyle16Black),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      spacing: 10,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          height: 20,
                          width: 20,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(
                                color: AppColors.greyColor,
                              )),
                          child: Icon(
                            Icons.remove,
                            size: 16,
                          ),
                        ),
                        Text(title),
                        Text(v),
                        Container(
                          height: 20,
                          width: 20,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(
                                color: AppColors.greyColor,
                              )),
                          child: Icon(Icons.add, size: 16),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
