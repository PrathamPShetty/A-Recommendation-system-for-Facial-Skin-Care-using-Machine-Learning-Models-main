import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';

import 'package:meta/meta.dart';
import 'package:farm_link_ai/consts/host.dart';
import 'package:farm_link_ai/core/cubit/customer/product/product.dart';

part 'product_state.dart';

class CustomerProductCubit extends Cubit<ProductState> {
  final Dio _dio = Dio();

  CustomerProductCubit() : super(ProductInitial());

  Future<void> fetchProducts() async {
    try {
      emit(ProductLoading());



      final response = await _dio.get('$host/customer/viewAllProducts');

      if (response.statusCode == 200) {
        final data = response.data['products'];

        // Check if data is a valid list
        if (data is List) {

        } else {
          emit(ProductError("Unexpected response structure: $data"));
        }
      } else {
        emit(ProductError(
            "Failed to load products: Status code ${response.statusCode}, Response: ${response.data}"));
      }
    } catch (e) {
      print("Error fetching products: $e");
      if (e is DioError) {
        print("DioError Response: ${e.response?.data}");
      }

      emit(ProductError("An error occurred while loading products."));
    }
  }
}
