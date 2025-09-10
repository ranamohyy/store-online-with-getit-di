part of 'package:implement_clean_code_for_store/features/views/home_nav/screens/home_page.dart';

class AllCategories extends StatefulWidget {
  const AllCategories({super.key});

  @override
  State<AllCategories> createState() => _AllCategoriesState();
}

class _AllCategoriesState extends State<AllCategories> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return  BlocBuilder<CategoriesCubit, CategoriesState>(
      builder: (context, state) {
        if (state is CategoriesSuccess) {
          return ListView.builder(
            itemCount: state.model.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedIndex = index;
                  });

                  if (state.model[index] == 'All') {
                    BlocProvider.of<ProductCubit>(context)
                        .getAllProducts();
                  } else {
                    BlocProvider.of<ProductCubit>(context)
                        .getCategoryProduct(state.model[index]);
                  }
                },
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 6),
                  padding: EdgeInsets.symmetric(horizontal: 12),

                  // width: 70,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10),
                      color: selectedIndex == index
                          ? AppColors.primaryColor
                          : Colors.white),
                  child: Center(
                      child: Text(
                        state.model[index],
                        style: TextStyle(
                            color: selectedIndex == index
                                ? Colors.white
                                : AppColors.primaryColor),
                      )),
                ),
              );
            },
          );
        }
        return Container();
      },
    );
  }
}
