import 'package:flutter_test/flutter_test.dart';

import 'package:state_management/models.dart';

void main() {
  test('adding item increases total cost', () {
    final cart = CartModel();
    final startingPrice = cart.totalPrice;
    var i = 0;
    cart.addListener(() {
      expect(cart.totalPrice, greaterThan(startingPrice));
      i++;
    });
    cart.add(Item(title: 'Dash'));
    expect(i, 1);
  });
}
