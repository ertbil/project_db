import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:project_db/models/comment.dart';
import 'package:project_db/models/login.dart';
import 'package:project_db/models/past_order.dart';
import 'package:project_db/models/product.dart';

import '../consts/endpoints.dart';
import '../models/address.dart';
import '../models/bank_card.dart';
import '../models/order.dart';
import '../models/user.dart';

class DataService {
  /// Temel HTTP fonksiyonları

  static dynamic get(String path) async {
    final response = await http.get(Uri.parse('${Endpoints.baseUrl}/$path'));

    try {
      if (jsonDecode(response.body)['success']) {
        debugPrint(jsonDecode(response.body)['data'].toString());
        return jsonDecode(response.body)['data'];
      } else {
        throw Exception(jsonDecode(response.body)['error']);
      }
    } catch (e) {
      throw Exception('Something went wrong status: ${response.statusCode}');
    }
  }

  static dynamic post(String path, dynamic data) async {
    final response = await http.post(
      Uri.parse('${Endpoints.baseUrl}/$path'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(data),
    );
    try {
      if (jsonDecode(response.body)['success']) {
        debugPrint(jsonDecode(response.body)['data'].toString());
        return jsonDecode(response.body)['data'];
      } else {
        throw Exception(jsonDecode(response.body)['error']);
      }
    } catch (e) {
      throw Exception('Something went wrong status: ${response.statusCode}');
    }
  }

  static dynamic put(String path, dynamic data) async {
    final response =
        await http.put(Uri.parse('${Endpoints.baseUrl}/$path'), body: data);

    try {
      if (jsonDecode(response.body)['success']) {
        debugPrint(jsonDecode(response.body)['data'].toString());
        return jsonDecode(response.body)['data'];
      } else {
        throw Exception(jsonDecode(response.body)['error']);
      }
    } catch (e) {
      throw Exception('Something went wrong status: ${response.statusCode}');
    }
  }

  static dynamic delete(String path) async {
    final response = await http.delete(Uri.parse('${Endpoints.baseUrl}/$path'));

    try {
      if (jsonDecode(response.body)['success']) {
        debugPrint(jsonDecode(response.body)['data'].toString());
        return jsonDecode(response.body)['data'];
      } else {
        throw Exception(jsonDecode(response.body)['error']);
      }
    } catch (e) {
      throw Exception('Something went wrong status: ${response.statusCode}');
    }
  }

  /// Ürün işlemleri

  Future<List<Product>> getProducts() async {
    final decodedData = await DataService.get(Endpoints.products);
    return decodedData
        .map<Product>((product) => Product.fromJson(product))
        .toList();
  }

  Future<Product> getProduct(int id) async {
    final decodedData = await DataService.get('${Endpoints.products}/$id');
    return Product.fromJson(decodedData);
  }

  /// Kullanıcı işlemleri
  Future login(Login login) async {
    return await DataService.post('${Endpoints.users}/${Endpoints.login}', login.toJson());
  }

  Future register(User user) async {
    return await DataService.post('${Endpoints.users}/${Endpoints.register}', user.toMap());
  }

  Future deleteCustomer(int id) async {
    return await DataService.delete('${'${Endpoints.users}/${Endpoints.delete}'}/$id');
  }

  Future updateEmail(int id, String email) async {
    return await DataService.post('${'${Endpoints.users}/${Endpoints.updateEmail}'}/$id', email);
  }

  Future updatePassword(int id, String password) async {
    return await DataService.post('${'${Endpoints.users}/${Endpoints.updatePassword}'}/$id', password);
  }

  Future deleteUser (int id) async {
    return await DataService.delete('${'${Endpoints.users}/${Endpoints.delete}'}/$id');
  }

  Future createFirstCard(int id, BankCard card) async {
    return await DataService.post('${'${Endpoints.users}/${Endpoints.createFirstCard}'}/$id', card.toMap());
  }

  Future createSecondCard(int id, BankCard card) async {
    return await DataService.post('${'${Endpoints.users}/${Endpoints.createSecondCard}'}/$id', card.toMap());
  }

  Future<List<PastOrder>> getPastOrders(int id) async {
    final decodedData = await DataService.get('${'${Endpoints.users}/${Endpoints.pastOrders}'}/$id');
    return  decodedData
        .map<Product>((product) => Product.fromJson(product))
        .toList();
  }

  Future createFirstAddress(int id, Adress address) async {
    return await DataService.post('${'${Endpoints.users}/${Endpoints.createFirstAddress}'}/$id', address);
  }

  Future createSecondAddress(int id, Adress address) async {
    return await DataService.post('${'${Endpoints.users}/${Endpoints.createSecondAddress}'}/$id', address);
  }

  Future updateCustomerScore(int id) async {
    return await DataService.post('${Endpoints.products}/${Endpoints.updateCustomerScore}/$id', null);
  }

  Future getMostProduct() async {
    return await DataService.get("${Endpoints.products}/${Endpoints.mostSoldProducts}");
  }

  Future getAllCategories() async {
    return await DataService.get('${Endpoints.categories}/${Endpoints.getAll}');
  }

Future getProductsByCategory(String category) async {
    return await DataService.get('${Endpoints.categories}/${Endpoints.getone}/$category');
  }

  Future favoriteProduct(int customerId, int productId) async {
    return await DataService.post('${Endpoints.favoriteProduct}/$productId', customerId );
  }

  Future unfavoriteProduct(int customerId, int productId) async {
    return await DataService.post('${Endpoints.unfavoriteProduct}/$productId', customerId);
  }

  Future addToCart(int customerId, int productId) async {
    return await DataService.post('${Endpoints.addToBasket}/$productId', customerId);
  }

  Future removeFromCart(int customerId, int productId) async {
    return await DataService.post('${Endpoints.removeFromBasket}/$productId', customerId);
  }

  Future searchBySize(String size) async {
    return await DataService.get('${Endpoints.searchBySize}/$size');
  }

  Future searchByColor(String color) async {
    return await DataService.get('${Endpoints.searchByColor}/$color');
  }

  Future addComment(int productId, Comment comment) async {
    return await DataService.post('${Endpoints.addComment}/$productId', comment.toMap());
  }
  Future updateComment(int productId, Comment comment) async {
    return await DataService.post('${Endpoints.updateComment}/$productId', comment.toMap());
  }
  Future createOrder(Order order) async {
    return await DataService.post(Endpoints.createOrder, order.toMap());
  }

  Future refundOrder(int orderId) async {
    return await DataService.post('${Endpoints.refundOrder}/$orderId', null);
  }

  Future getRefundOrders(int customerId) async {
    return await DataService.get('${Endpoints.refundList}/$customerId');
  }

  Future getSearchBranchByCity(String city) async {
    return await DataService.get('${Endpoints.searchBranchByName}/$city');
  }

  Future getSearchBranchByPostCode(String postCode) async {
    return await DataService.get('${Endpoints.searchBranchByPostCode}/$postCode');
  }

  Future<User> getUser(int id) async {
    final decodedData = await DataService.get('${Endpoints.users}/$id');
    return User.fromJson(decodedData);
  }






}

final dataServiceProvider = Provider((ref) => DataService());
