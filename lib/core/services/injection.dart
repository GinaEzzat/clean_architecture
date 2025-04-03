import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import '../../features/main_user_screen/data/repositories/product_repository_impl.dart';
import '../../features/main_user_screen/domain/repositories/product_repository.dart';
import '../../features/main_user_screen/domain/useCases/get_products.dart';
import '../../features/main_user_screen/presentation/bloc/product_bloc.dart';



final sl = GetIt.instance;

void init() {
  // Register HTTP Client
  sl.registerLazySingleton(() => http.Client());

  // Register Repository
  sl.registerLazySingleton<ProductRepository>(
    () => ProductRepositoryImpl(client: sl()),
  );

  // Register Use Case
  sl.registerLazySingleton(() => GetProducts(sl()));

  // Register Bloc
  sl.registerFactory(() => ProductBloc(getProducts: sl()));
}
