import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../domain/entities/product.dart';
import '../../domain/usecases/get_products.dart';
import 'package:dartz/dartz.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final GetProducts getProducts;

  ProductBloc({required this.getProducts}) : super(ProductInitial()) {
    on<FetchProducts>((event, emit) async {
      emit(ProductLoading());
      final Either<String, List<Product>> result = await getProducts();
      
      result.fold(
        (failure) => emit(ProductError(failure)),
        (products) => emit(ProductLoaded(products)),
      );
    });
  }
}
