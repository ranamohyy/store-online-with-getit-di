part of 'package:implement_clean_code_for_store/features/views/home_nav/screens/home_page.dart';

class AllProducts extends StatelessWidget {
  const AllProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit, ProductState>(
      builder: (context, state) {
        if (state is ProductLoading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is ProductFailure) {
          return Center(child: Text("No Data"));
        }
        if (state is ProductSuccess) {
          return GridView.builder(
            itemCount: state.model.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, childAspectRatio: 0.8),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BlocProvider.value(
                          value: getIt<CartCubit>(),
                          child: ProductDetails(model: state.model[index]),
                        ),
                      ));
                },
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(
                        child: Image.network(state.model[index].image ?? ""),
                      ),
                      Text(
                        state.model[index].title ?? "Shoes",
                        style: AppStyles.textStyle16Black,
                      ),
                      Text(
                        r"$" + state.model[index].price.toString(),
                        style: AppStyles.textStyle12Grey,
                      ),
                    ],
                  ),
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
