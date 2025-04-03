import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:dartz/dartz.dart';
import '../../domain/entities/product.dart';
import '../../domain/repositories/product_repository.dart';
import '../models/product_model.dart';

class ProductRepositoryImpl implements ProductRepository {
  final http.Client client;

  ProductRepositoryImpl({required this.client});

  @override
  Future<Either<String, List<Product>>> getProducts() async {
    try {
      final response = await client.get(
        Uri.parse('https://fakestoreapi.com/products'),
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        final List<Product> products =
            data.map((json) => ProductModel.fromJson(json)).toList();
        return Right(products);
      } else {
        return const Left('Failed to fetch products');
      }
    } catch (e) {
      return Left(e.toString());
    }
  }
}
