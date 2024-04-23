import 'dart:io';
import 'package:demo/product/company_products/model/get_all_product_model.dart';
import 'package:demo/product/general/enum/http_methods.dart';
import 'package:demo/product/general/model/base_response.dart';
import 'package:demo/product/general/service/api_service.dart';
import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';

class CompanyProductService extends ApiService {
  Future<BaseResponse> createProduct(
    XFile image,
    String title,
    String description,
    double price,
    int tax,
    int weight,
    int stockAmount,
  ) async {
    return requestMethod(
      path: '/company/product',
      headers: {
        'Content-Type': 'application/json',
      },
      responseConverter: (p0) {},
      requestModel: null,
      queryParameters: null,
      method: HttpMethod.post,
      formData: FormData.fromMap(
        {
          'image': await MultipartFile.fromFile(
            File(image.path).path,
            filename: image.name, // Sunucudaki dosya adı
          ),
          // Diğer form alanlarını buraya ekleyebilirsiniz
          'title': title,
          'description': description,
          'price': price,
          'tax': tax,
          'weight': weight,
          'stock_amount': stockAmount,
          'status': 1, //her zaman true yapıyorum !
        },
      ),
    );
  }

  Future<BaseResponse<List<CompanyProductModel>>> getAllProduct() {
    return requestMethod<List<CompanyProductModel>>(
      path: '/company/product/all',
      headers: {
        'Content-Type': 'application/json',
      },
      responseConverter: (p0) {
        if (p0 is List<dynamic>) {
          return p0
              .map((json) =>
                  CompanyProductModel.fromJson(json as Map<String, dynamic>))
              .toList();
        } else {
          // Uygun bir hata işleme stratejisi
          throw const FormatException(
              'Invalid data format for CompanyProductModel list');
        }
      },
      requestModel: null,
      queryParameters: null,
      method: HttpMethod.get,
    );
  }

  Future<BaseResponse<CompanyProductModel?>> getByIdProduct(
    int id,
  ) {
    return requestMethod<CompanyProductModel?>(
      path: '/company/product/$id',
      headers: {
        'Content-Type': 'application/json',
      },
      responseConverter: (p0) {
        if (p0 != null) {
          return CompanyProductModel.fromJson(p0 as Map<String, dynamic>);
        } else {
          return null;
        }
      },
      requestModel: null,
      queryParameters: null,
      method: HttpMethod.get,
    );
  }

  Future<BaseResponse> updateProduct(
    int id,
    XFile image,
    String title,
    String description,
    double price,
    int tax,
    int weight,
    int stockAmount,
  ) async {
    return requestMethod(
      path: '/company/product/$id',
      headers: {
        'Content-Type': 'application/json',
      },
      responseConverter: (p0) {},
      requestModel: null,
      queryParameters: null,
      method: HttpMethod.put,
      formData: FormData.fromMap(
        {
          'image': await MultipartFile.fromFile(
            File(image.path).path,
            filename: image.name, // Sunucudaki dosya adı
          ),
          // Diğer form alanlarını buraya ekleyebilirsiniz
          'title': title,
          'description': description,
          'price': price,
          'tax': tax,
          'weight': weight,
          'stock_amount': stockAmount,
          'status': 1, //her zaman true yapıyorum !
        },
      ),
    );
  }

  Future<BaseResponse> productDelete(
    int id,
  ) {
    return requestMethod(
      path: '/company/product/$id',
      headers: {
        'Content-Type': 'application/json',
      },
      responseConverter: (p0) => null,
      requestModel: null,
      queryParameters: null,
      method: HttpMethod.delete,
    );
  }
}
