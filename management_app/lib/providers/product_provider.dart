import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../models/product_model.dart';

class ProductProvider extends ChangeNotifier {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  List<Product> _products = [];
  bool _isLoading = false;

  List<Product> get products => _products;
  bool get isLoading => _isLoading;

  // Get all products
  Future<void> getProducts() async {
    _isLoading = true;
    notifyListeners();

    try {
      final snapshot =
          await _firestore
              .collection('products')
              .orderBy('createdAt', descending: true)
              .get();

      _products =
          snapshot.docs
              .map((doc) => Product.fromMap(doc.data(), doc.id))
              .toList();
    } catch (e) {
      debugPrint('Error getting products: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  // Add a new product
  Future<void> addProduct(Product product) async {
    _isLoading = true;
    notifyListeners();

    try {
      final docRef = await _firestore
          .collection('products')
          .add(product.toMap());
      product.id = docRef.id;
      _products.insert(0, product);
    } catch (e) {
      debugPrint('Error adding product: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  // Update an existing product
  Future<void> updateProduct(Product product) async {
    _isLoading = true;
    notifyListeners();

    try {
      await _firestore
          .collection('products')
          .doc(product.id)
          .update(product.toMap());

      final index = _products.indexWhere((p) => p.id == product.id);
      if (index != -1) {
        _products[index] = product;
      }
    } catch (e) {
      debugPrint('Error updating product: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  // Delete a product
  Future<void> deleteProduct(String id) async {
    _isLoading = true;
    notifyListeners();

    try {
      await _firestore.collection('products').doc(id).delete();
      _products.removeWhere((product) => product.id == id);
    } catch (e) {
      debugPrint('Error deleting product: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  // Get a single product by ID
  Future<Product?> getProductById(String id) async {
    try {
      final doc = await _firestore.collection('products').doc(id).get();
      if (doc.exists) {
        return Product.fromMap(doc.data()!, doc.id);
      }
    } catch (e) {
      debugPrint('Error getting product: $e');
    }
    return null;
  }
}
