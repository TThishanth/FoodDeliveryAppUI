import 'package:FoodDeliveryAppUI/data/data.dart';
import 'package:FoodDeliveryAppUI/models/order.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  _buildCartItem(order) {
    return Container(
      padding: EdgeInsets.all(20.0),
      height: 170.0,
      child: Row(
        children: [
          Expanded(
            child: Row(
              children: [
                Container(
                  width: 150.0,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(order.food.imageUrl),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(12.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          order.food.name,
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(height: 10.0),
                        Text(
                          order.restaurant.name,
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w600,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(height: 10.0),
                        Container(
                          width: 100.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            border: Border.all(
                              width: 1.0,
                              color: Colors.black54,
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: () {},
                                child: Text(
                                  '-',
                                  style: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              SizedBox(width: 20.0),
                              Text(
                                order.quantity.toString(),
                                style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(width: 20.0),
                              GestureDetector(
                                onTap: () {},
                                child: Text(
                                  '+',
                                  style: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            child: Text(
              '\$${order.quantity * order.food.price}',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double totalPrice = 0;
    currentUser.cart.forEach((Order order) {
      totalPrice += order.quantity * order.food.price;
    });

    return Scaffold(
      appBar: AppBar(
        title: Text('Cart (${currentUser.cart.length})'),
        centerTitle: true,
      ),
      body: ListView.separated(
        itemCount: currentUser.cart.length + 1,
        itemBuilder: (context, index) {
          if (index < currentUser.cart.length) {
            Order order = currentUser.cart[index];
            return _buildCartItem(order);
          }
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Estimated Delivery Time:',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      '25 min',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Total Cost:',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      '\$${totalPrice.toStringAsFixed(2)}',
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.green[700],
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 120.0,
              ),
            ],
          );
        },
        separatorBuilder: (context, index) {
          return Divider(
            height: 1.0,
            color: Colors.grey,
          );
        },
      ),
      bottomSheet: Container(
        height: 100.0,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              offset: Offset(0, -1),
              blurRadius: 6.0,
            ),
          ],
        ),
        child: Center(
          child: FlatButton(
            child: Text(
              'CHECK OUT',
              style: TextStyle(
                color: Colors.white,
                fontSize: 22.0,
                fontWeight: FontWeight.bold,
                letterSpacing: 2.0,
              ),
            ),
            onPressed: (){},
          ),
        ),
      ),
    );
  }
}